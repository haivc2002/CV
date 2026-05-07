// --- SPA Routing ---
const navButtons = document.querySelectorAll('.nav-btn');
const views = document.querySelectorAll('.view-section');
const btnBack = document.getElementById('btn-back');

function navigateTo(targetId) {
    window.location.hash = targetId;
}

function handleHashChange() {
    let targetId = window.location.hash.replace('#', '');
    if (!targetId || targetId === '') {
        targetId = 'about'; // default
    }

    // Update nav buttons
    navButtons.forEach(btn => {
        // Keep projects highlighted when in project detail
        if(btn.dataset.target === targetId || (targetId === 'project-detail' && btn.dataset.target === 'projects')) {
            btn.classList.add('active');
        } else {
            btn.classList.remove('active');
        }
    });

    // Update views
    views.forEach(view => {
        if(view.id === targetId) {
            view.classList.add('active');
        } else {
            view.classList.remove('active');
        }
    });

    // Scroll to top
    window.scrollTo(0, 0);
}

window.addEventListener('hashchange', handleHashChange);

navButtons.forEach(btn => {
    btn.addEventListener('click', () => {
        navigateTo(btn.dataset.target);
    });
});

btnBack.addEventListener('click', () => {
    navigateTo('projects');
});

// --- Projects Rendering ---
function renderProjectsGrid() {
    const container = document.querySelector('.projects-container');
    container.innerHTML = ''; // Clear

    // Group projects by company
    const grouped = {};
    projectsData.forEach(p => {
        if (!grouped[p.company]) {
            grouped[p.company] = [];
        }
        grouped[p.company].push(p);
    });

    for (const [company, projects] of Object.entries(grouped)) {
        // Company Title
        const titleEl = document.createElement('h2');
        titleEl.className = 'company-title';
        titleEl.textContent = company;
        container.appendChild(titleEl);

        // Grid
        const gridEl = document.createElement('div');
        gridEl.className = 'projects-grid';
        
        projects.forEach(p => {
            const card = document.createElement('div');
            card.className = 'project-card';
            card.onclick = () => renderProjectDetail(p);

            card.innerHTML = `
                <img src="${p.image}" class="project-image" alt="${p.nameApp}">
                <div class="project-info-overlay">
                    <div class="project-title">${p.nameApp}</div>
                    <div class="project-desc-short">${p.description}</div>
                </div>
            `;
            gridEl.appendChild(card);
        });

        container.appendChild(gridEl);
    }
}

// --- Project Detail Rendering ---
let currentProject = null;
let isVietnamese = false;

function renderProjectDetail(project) {
    currentProject = project;
    updateProjectDetailDOM();
    navigateTo('project-detail');
}

function updateProjectDetailDOM() {
    if (!currentProject) return;
    const p = currentProject;
    const container = document.getElementById('detail-content');

    const desc = (isVietnamese && p.descriptionVi) ? p.descriptionVi : p.description;
    const features = (isVietnamese && p.mainFeaturesVi && p.mainFeaturesVi.length) ? p.mainFeaturesVi : p.mainFeatures;
    const contribution = (isVietnamese && p.contributionVi && p.contributionVi.length) ? p.contributionVi : p.contribution;
    
    const labels = {
        features: isVietnamese ? "Tính năng" : "Features",
        contribution: isVietnamese ? "Đóng góp" : "Contribution",
        tech: isVietnamese ? "Công nghệ" : "Technology",
        download: isVietnamese ? "Tải ứng dụng" : "Available for User",
        team: isVietnamese ? "Quy mô nhóm: " : "Team size: "
    };

    let techHtml = '';
    if (p.technologies && p.technologies.length > 0) {
        techHtml = `
            <h3 class="section-title">${labels.tech}</h3>
            <div class="tech-grid">
                ${p.technologies.map(t => `
                    <div class="tech-item">
                        <img src="${t.logo}" alt="${t.name}">
                        <span>${t.name}</span>
                    </div>
                `).join('')}
            </div>
        `;
    }

    let linksHtml = '';
    const hasLinks = p.sourceAppstore || p.sourceCHplay || p.sourceGithub;
    if (hasLinks) {
        linksHtml = `
            <hr style="margin: 30px 0; border: none; border-top: 1px solid #ccc;">
            <h3 class="section-title">${labels.download}</h3>
            <div class="store-links">
                ${p.sourceAppstore ? `<a href="${p.sourceAppstore}" target="_blank"><img src="assets/logo_appstore.png" alt="App Store"></a>` : ''}
                ${p.sourceCHplay ? `<a href="${p.sourceCHplay}" target="_blank"><img src="assets/logo_chplay.png" alt="Google Play"></a>` : ''}
                ${p.sourceGithub ? `<a href="${p.sourceGithub}" target="_blank"><img src="assets/logo_github.png" alt="GitHub"></a>` : ''}
            </div>
        `;
    }

    container.innerHTML = `
        <img src="${p.image}" class="detail-header-image" alt="${p.nameApp}">
        
        <div class="detail-top">
            <div class="lang-toggle">
                <button class="lang-btn ${!isVietnamese ? 'active' : ''}" onclick="toggleLang(false)">EN</button>
                <button class="lang-btn ${isVietnamese ? 'active' : ''}" onclick="toggleLang(true)">VI</button>
            </div>
            
            <div class="detail-title-row">
                <div class="title-decorator"></div>
                <div class="title-content">
                    <h1>${p.nameApp}</h1>
                    ${p.teamSize ? `<div class="team-size">${labels.team} ${p.teamSize}</div>` : ''}
                    <div class="detail-description">${desc}</div>
                </div>
            </div>
        </div>

        <div class="detail-content-grid">
            <div class="main-column">
                ${features.length ? `
                    <h3 class="section-title">${labels.features}</h3>
                    <ul class="feature-list">
                        ${features.map(f => `<li>${f}</li>`).join('')}
                    </ul>
                ` : ''}

                ${contribution && contribution.length ? `
                    <h3 class="section-title">${labels.contribution}</h3>
                    <ul class="feature-list">
                        ${contribution.map(c => `<li>${c}</li>`).join('')}
                    </ul>
                ` : ''}
            </div>
            
            <div class="side-column">
                ${techHtml}
                ${linksHtml}
            </div>
        </div>
    `;
}

window.toggleLang = function(toVietnamese) {
    isVietnamese = toVietnamese;
    updateProjectDetailDOM();
};

// --- PDF Rendering ---
pdfjsLib.GlobalWorkerOptions.workerSrc = 'https://cdnjs.cloudflare.com/ajax/libs/pdf.js/3.11.174/pdf.worker.min.js';

async function renderPDF() {
    const url = 'assets/ThanhHai_mobile.pdf';
    const container = document.getElementById('pdf-render-area');
    const loading = document.getElementById('pdf-loading');

    try {
        const loadingTask = pdfjsLib.getDocument(url);
        const pdf = await loadingTask.promise;
        loading.style.display = 'none';

        // Render all pages
        for (let pageNum = 1; pageNum <= pdf.numPages; pageNum++) {
            const page = await pdf.getPage(pageNum);
            
            // Adjust scale for better resolution on high DPI screens
            const scale = 2.0; 
            const viewport = page.getViewport({ scale });

            const wrapper = document.createElement('div');
            wrapper.className = 'pdf-page-wrapper';
            
            const canvas = document.createElement('canvas');
            const context = canvas.getContext('2d');
            canvas.height = viewport.height;
            canvas.width = viewport.width;

            // Render PDF page into canvas context
            const renderContext = {
                canvasContext: context,
                viewport: viewport
            };
            
            wrapper.appendChild(canvas);
            container.appendChild(wrapper);
            
            // We await the render task so pages appear in order without overwhelming memory
            await page.render(renderContext).promise;

            // Add links overlay on the first page
            if (pageNum === 1) {
                addLinksOverlay(wrapper, canvas.offsetWidth);
                
                // Keep overlay sizes updated if window resizes
                window.addEventListener('resize', () => {
                    // Re-calculate overlays if canvas display width changes
                    wrapper.querySelectorAll('.pdf-link-area').forEach(el => el.remove());
                    addLinksOverlay(wrapper, canvas.offsetWidth);
                });
            }
        }
    } catch (error) {
        console.error('Error rendering PDF:', error);
        loading.innerHTML = 'Error loading CV. Please try downloading it.';
    }
}

function addLinksOverlay(wrapper, displayWidth) {
    // Original formula from Flutter: 
    // width = maxWidth
    // width: width/4.7, height: width/38, top: width/8.7, right: width/3.7 -> GitHub
    // width: width/3.5, height: width/38, top: width/1.135, left: width/13 -> Portfolio Projects
    // width: width/3.5, height: width/38, top: width/1.02, left: width/13 -> fog_edge_blur
    // width: width/3.5, height: width/38, top: width/0.905, left: width/11 -> flow_box_popup
    // width: width/3.9, height: width/38, top: width/0.815, left: width/11 -> fluid_wave

    const w = displayWidth;
    
    const links = [
        { url: "https://github.com/haivc2002", w: w/4.7, h: w/38, t: w/8.7, r: w/3.7, l: null },
        { url: "#", onclick: () => navigateTo('projects'), w: w/3.5, h: w/38, t: w/1.135, l: w/13, r: null }, // Portfolio projects
        { url: "https://pub.dev/packages/fog_edge_blur", w: w/3.5, h: w/38, t: w/1.02, l: w/13, r: null },
        { url: "https://pub.dev/packages/flow_box_popup", w: w/3.5, h: w/38, t: w/0.905, l: w/11, r: null },
        { url: "https://pub.dev/packages/fluid_wave", w: w/3.9, h: w/38, t: w/0.815, l: w/11, r: null }
    ];

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


// Initialize
handleHashChange(); // Setup initial route based on hash
renderProjectsGrid();
renderPDF();
