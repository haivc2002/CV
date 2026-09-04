// --- Three.js Background Setup ---
const canvas = document.querySelector('#bg-canvas');
const scene = new THREE.Scene();
scene.fog = new THREE.FogExp2(0x050505, 0.002);

const camera = new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, 0.1, 1000);
const renderer = new THREE.WebGLRenderer({ canvas: canvas, alpha: true, antialias: true });

renderer.setSize(window.innerWidth, window.innerHeight);
renderer.setPixelRatio(Math.min(window.devicePixelRatio, 2));

// Create Particles
const particlesGeometry = new THREE.BufferGeometry();
const particlesCount = 2000;

const posArray = new Float32Array(particlesCount * 3);
const colorsArray = new Float32Array(particlesCount * 3);

const color1 = new THREE.Color(0x00f0ff); // Cyan
const color2 = new THREE.Color(0x8a2be2); // Purple

for (let i = 0; i < particlesCount * 3; i += 3) {
    // Spread particles over a large area
    posArray[i] = (Math.random() - 0.5) * 20;     // x
    posArray[i + 1] = (Math.random() - 0.5) * 20;   // y
    posArray[i + 2] = (Math.random() - 0.5) * 20;   // z

    // Mix colors randomly
    const mixedColor = color1.clone().lerp(color2, Math.random());
    colorsArray[i] = mixedColor.r;
    colorsArray[i + 1] = mixedColor.g;
    colorsArray[i + 2] = mixedColor.b;
}

particlesGeometry.setAttribute('position', new THREE.BufferAttribute(posArray, 3));
particlesGeometry.setAttribute('color', new THREE.BufferAttribute(colorsArray, 3));

const material = new THREE.PointsMaterial({
    size: 0.03,
    vertexColors: true,
    transparent: true,
    opacity: 0.8,
    blending: THREE.AdditiveBlending
});

const particlesMesh = new THREE.Points(particlesGeometry, material);
scene.add(particlesMesh);

camera.position.z = 5;

// Mouse Interaction
let mouseX = 0;
let mouseY = 0;
let targetX = 0;
let targetY = 0;

const windowHalfX = window.innerWidth / 2;
const windowHalfY = window.innerHeight / 2;

document.addEventListener('mousemove', (event) => {
    mouseX = (event.clientX - windowHalfX);
    mouseY = (event.clientY - windowHalfY);
});

// Animation Loop
const clock = new THREE.Clock();

const tick = () => {
    const elapsedTime = clock.getElapsedTime();

    // Base rotation
    particlesMesh.rotation.y = elapsedTime * 0.05;
    particlesMesh.rotation.x = elapsedTime * 0.02;

    // Smooth mouse follow
    targetX = mouseX * 0.001;
    targetY = mouseY * 0.001;

    particlesMesh.rotation.y += 0.05 * (targetX - particlesMesh.rotation.y);
    particlesMesh.rotation.x += 0.05 * (targetY - particlesMesh.rotation.x);

    // Subtle wave effect on Z
    particlesMesh.position.z = Math.sin(elapsedTime * 0.5) * 0.2;

    // Render
    renderer.render(scene, camera);

    // Call tick again on the next frame
    window.requestAnimationFrame(tick);
};

tick();

// Handle Resize
window.addEventListener('resize', () => {
    // Update camera
    camera.aspect = window.innerWidth / window.innerHeight;
    camera.updateProjectionMatrix();

    // Update renderer
    renderer.setSize(window.innerWidth, window.innerHeight);
    renderer.setPixelRatio(Math.min(window.devicePixelRatio, 2));
});


// --- UI Navigation Logic ---
const navLinks = document.querySelectorAll('.nav-links a[href^="#"]');
const allTabLinks = document.querySelectorAll('.nav-links a[href^="#"], .hero-actions a[href^="#"]');
const sections = document.querySelectorAll('.view-section');
const bgCanvas = document.getElementById('bg-canvas');

allTabLinks.forEach(link => {
    link.addEventListener('click', (e) => {
        e.preventDefault();

        const targetId = link.getAttribute('href').substring(1);

        // Remove active class from all links and sections
        navLinks.forEach(l => l.classList.remove('active'));
        sections.forEach(s => s.classList.remove('active'));

        // Add active class to the corresponding nav menu link
        const correspondingNavLink = document.querySelector(`.nav-links a[href="#${targetId}"]`);
        if (correspondingNavLink) {
            correspondingNavLink.classList.add('active');
        }

        // Show target section
        const targetSection = document.getElementById(targetId);
        if (targetSection) {
            targetSection.classList.add('active');
        }

        // Show/hide 3D background based on section
        if (targetId === 'home') {
            bgCanvas.style.opacity = '1';
        } else {
            bgCanvas.style.opacity = '0';
        }

        // Update URL cleanly without hash
        history.pushState(null, null, '?tab=' + targetId);

        // Close mobile menu if open
        if (navLinksContainer.classList.contains('active-menu')) {
            navLinksContainer.classList.remove('active-menu');
        }
    });
});

// Handle initial load with query parameter (Deep linking)
window.addEventListener('load', () => {
    // Support new ?tab=format
    const urlParams = new URLSearchParams(window.location.search);
    let tab = urlParams.get('tab');

    // Support legacy #format as fallback
    if (!tab && window.location.hash) {
        tab = window.location.hash.substring(1);
    }

    if (tab) {
        const targetLink = document.querySelector(`.nav-links a[href="#${tab}"]`);
        if (targetLink) {
            targetLink.click();
        }
    }
});

// Mobile Menu Toggle
const mobileToggle = document.querySelector('.nav-mobile-toggle');
const navLinksContainer = document.querySelector('.nav-links');

if (mobileToggle && navLinksContainer) {
    mobileToggle.addEventListener('click', () => {
        navLinksContainer.classList.toggle('active-menu');
    });
}

// Logo click to Home
const logo = document.querySelector('.logo');
if (logo) {
    logo.addEventListener('click', () => {
        const homeLink = document.querySelector('.nav-links a[href="#home"]');
        if (homeLink) homeLink.click();
    });
}

// --- PDF.js Logic ---
async function renderPDF() {
    const url = 'assets/ThanhHai_mobile.pdf';
    const container = document.getElementById('pdf-render-area');
    const loading = document.getElementById('pdf-loading');

    if (!container || !loading) return;

    try {
        // Use Global worker for PDF.js
        pdfjsLib.GlobalWorkerOptions.workerSrc = 'https://cdnjs.cloudflare.com/ajax/libs/pdf.js/3.11.174/pdf.worker.min.js';

        const loadingTask = pdfjsLib.getDocument(url);
        const pdf = await loadingTask.promise;
        loading.style.display = 'none';

        // Render all pages
        for (let pageNum = 1; pageNum <= pdf.numPages; pageNum++) {
            const page = await pdf.getPage(pageNum);

            // Adjust scale for better resolution on high DPI screens
            const scale = 1.5;
            const viewport = page.getViewport({ scale });

            const wrapper = document.createElement('div');
            wrapper.className = 'pdf-page-wrapper skeleton';

            const canvas = document.createElement('canvas');
            const context = canvas.getContext('2d');
            canvas.height = viewport.height;
            canvas.width = viewport.width;

            const renderContext = {
                canvasContext: context,
                viewport: viewport
            };

            wrapper.appendChild(canvas);
            container.appendChild(wrapper);

            await page.render(renderContext).promise;

            wrapper.classList.remove('skeleton');

            // Add links overlay for specific pages
            if (pageNum === 1 || pageNum === 2) {
                addLinksOverlay(wrapper, canvas.offsetWidth, pageNum);

                window.addEventListener('resize', () => {
                    wrapper.querySelectorAll('.pdf-link-area').forEach(el => el.remove());
                    addLinksOverlay(wrapper, canvas.offsetWidth, pageNum);
                });
            }

            if (pageNum < pdf.numPages) {
                await new Promise(resolve => setTimeout(resolve, 50));
            }
        }
    } catch (error) {
        console.error('Error rendering PDF:', error);
        loading.innerHTML = 'Error loading CV. Please try downloading it.';
    }
}

function addLinksOverlay(wrapper, displayWidth, pageNum) {
    const w = displayWidth;
    let links = [];

    if (pageNum === 1) {
        links = [
            { url: "https://github.com/haivc2002", w: w / 4.7, h: w / 38, t: w / 8.7, r: w / 3.7, l: null }
        ];
    } else if (pageNum === 2) {
        links = [
            { url: "https://pub.dev/packages/fog_edge_blur", w: w / 3.5, h: w / 38, t: w / 1.225, l: w / 13, r: null },
            { url: "https://pub.dev/packages/flow_box_popup", w: w / 3.5, h: w / 38, t: w / 1.095, l: w / 11, r: null },
            { url: "https://pub.dev/packages/fluid_wave", w: w / 3.5, h: w / 38, t: w / 0.99, l: w / 11, r: null },
            { url: "https://haivc2002.github.io/CV/?tab=projects", w: w / 3.3, h: w / 38, t: w / 0.92, l: w / 6, r: null }
        ];
    }

    links.forEach(link => {
        const a = document.createElement('a');
        a.className = 'pdf-link-area';

        if (link.onclick) {
            a.onclick = (e) => { e.preventDefault(); link.onclick(); };
            a.href = '#';
        } else {
            a.href = link.url;
            a.target = '_blank';
        }

        a.style.width = link.w + 'px';
        a.style.height = link.h + 'px';
        a.style.top = link.t + 'px';
        if (link.l !== null) a.style.left = link.l + 'px';
        if (link.r !== null) a.style.right = link.r + 'px';

        wrapper.appendChild(a);
    });
}

// Call on load
renderPDF();

// --- Contact Form Logic ---
const contactForm = document.getElementById('contactForm');
if (contactForm) {
    contactForm.addEventListener('submit', () => {
        // Clear the form after a short delay so the browser can capture the data for submission first
        setTimeout(() => {
            contactForm.reset();
        }, 500);
    });
}

// --- Projects Render Logic ---
function renderProjects() {
    const grid = document.getElementById('projects-grid');
    if (!grid || typeof projectsData === 'undefined') return;

    grid.innerHTML = '';

    projectsData.forEach(project => {
        const card = document.createElement('div');
        card.className = 'project-card glass-panel';
        card.onclick = () => openProjectModal(project.id);

        card.innerHTML = `
            <div class="project-img-wrapper">
                <img src="${project.image}" alt="${project.nameApp}" class="project-img">
            </div>
            <div class="project-card-content">
                <h3 class="project-title">${project.nameApp}</h3>
                <p class="project-company">${project.company.split('(')[0].trim()}</p>
            </div>
        `;
        grid.appendChild(card);
    });
}

function openProjectModal(projectId) {
    const project = projectsData.find(p => p.id === projectId);
    if (!project) return;

    const modal = document.getElementById('project-modal');
    const modalBody = document.getElementById('modal-body-content');

    let featuresHtml = project.mainFeatures ?
        `<h4>Main Features</h4><ul>${project.mainFeatures.map(f => `<li>${f}</li>`).join('')}</ul>` : '';

    let contributionHtml = project.contribution ?
        `<h4>My Contribution</h4><ul>${project.contribution.map(c => `<li>${c}</li>`).join('')}</ul>` : '';

    let linksHtml = '';
    if (project.sourceAppstore) {
        linksHtml += `<a href="${project.sourceAppstore}" target="_blank" class="btn btn-primary store-btn">App Store</a>`;
    }
    if (project.sourceCHplay) {
        linksHtml += `<a href="${project.sourceCHplay}" target="_blank" class="btn btn-secondary store-btn">Google Play</a>`;
    }

    let techHtml = '';
    if (project.technologies) {
        techHtml = project.technologies.map(tech =>
            `<img src="${tech.logo}" alt="${tech.name}" title="${tech.name}" class="modal-tech-icon-large">`
        ).join('');
    }

    modalBody.innerHTML = `
        <div class="modal-img-col">
            <img src="${project.image}" alt="${project.nameApp}" class="modal-img">
            <div class="modal-links">${linksHtml}</div>
        </div>
        <div class="modal-info-col">
            <h2 class="modal-title">${project.nameApp}</h2>
            <p class="modal-company">${project.company.split('(')[0].trim()}</p>
            <div class="modal-tech-list">${techHtml}</div>
            <p class="modal-desc">${project.description}</p>
            <div class="modal-details-scroll">
                ${featuresHtml}
                ${contributionHtml}
            </div>
        </div>
    `;

    modal.classList.add('active');
    // document.body.style.overflow = 'hidden'; // Don't hide overflow if it breaks background
}

// Modal Close Handlers
const modal = document.getElementById('project-modal');
const modalCloseBtn = document.getElementById('modal-close-btn');

if (modal && modalCloseBtn) {
    const closeModal = () => {
        modal.classList.remove('active');
    };

    modalCloseBtn.addEventListener('click', closeModal);

    modal.addEventListener('click', (e) => {
        if (e.target === modal) closeModal();
    });
}

// Call to render projects
renderProjects();
