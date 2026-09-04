const projectsData = [
  {
    id: 'ahome',
    company: 'XTEL Software Solutions (11/2023 - 12/2024)',
    image: 'assets/ahome.webp',
    nameApp: 'Ahome',
    description: 'A high-performance rental platform connecting property owners and tenants. Engineered with a scalable GetX modular architecture, the app seamlessly serves a large user base, handling thousands of real-time property searches and transactions daily.',
    technologies: [
      { logo: 'assets/logo_flutter.webp', name: 'Flutter' },
      { logo: 'assets/logo_firebase.webp', name: 'Firebase' },
      { logo: 'assets/logo_java.webp', name: 'Java' }
    ],
    teamSize: '2 (1 mobile, 1 backend)',
    mainFeatures: [
      'Developed robust OTP-based authentication system, securing user data and significantly reducing fake accounts.',
      'Implemented an advanced, multi-parameter search engine (by amenities, location, price) capable of filtering over 50,000+ listings in under 200ms.',
      'Integrated real-time room management and check-in workflows, digitizing 100% of the traditional paper-based process.',
      'Built a seamless issue reporting and invoice tracking system, improving landlord-tenant communication efficiency by 80%.'
    ],
    contribution: [
      'Designed and implemented a highly scalable GetX-based modular architecture from scratch.',
      'Extracted business logic into a Shared Core Module, accelerating the development of the Ahome Pro app by 50% and ensuring code consistency.',
      'Served as the sole Mobile Engineer, independently delivering the entire Flutter application and maintaining a 90% crash-free rate.'
    ],
    sourceCHplay: 'https://play.google.com/store/apps/details?id=vn.xtel.ahome.timtro&hl=vi',
    sourceAppstore: 'https://apps.apple.com/vn/app/homevn-tr%E1%BB%8D-ch%C3%ADnh-ch%E1%BB%A7/id6736515000?l=vi'
  },
  {
    id: 'ahome-pro',
    company: 'XTEL Software Solutions (11/2023 - 12/2024)',
    image: 'assets/ahome_pro.webp',
    nameApp: 'Ahome Pro',
    description: 'A comprehensive property management ecosystem designed for landlords. Leveraging the same Shared Core Module as the Ahome app, this platform optimizes contract lifecycles, payment tracking, and tenant management for over 10,000+ active property owners.',
    technologies: [
      { logo: 'assets/logo_flutter.webp', name: 'Flutter' },
      { logo: 'assets/logo_firebase.webp', name: 'Firebase' },
      { logo: 'assets/logo_java.webp', name: 'Java' }
    ],
    teamSize: '3 (2 mobile, 1 backend)',
    mainFeatures: [
      'Engineered complex building and room management modules, efficiently handling large-scale hierarchical data.',
      'Developed an automated billing and invoicing system, reducing missed rent payments by 60% for landlords.',
      'Implemented end-to-end digital contract management, including deposit handling, renewals, and secure tenant check-ins.',
      'Built a real-time analytics dashboard providing interactive monthly statistics on revenue, occupancy rates, and maintenance issues.'
    ],
    contribution: [
      'Spearheaded the integration of the Shared Core Module into the existing architecture, eliminating code duplication.',
      'Re-architected legacy codebases using GetX, optimizing state management and reducing UI rendering lag by 40%.',
      'Developed complex interactive charts and data visualizations for the landlord statistics dashboard.',
      'Engineered secure utility cost calculation logic and bank account management modules.'
    ],
    sourceCHplay: 'https://play.google.com/store/apps/details?id=vn.xtel.ahome.host&hl=vi',
    sourceAppstore: 'https://apps.apple.com/vn/app/homevn-pro/id6720719430?l=vi'
  },
  {
    id: 'qldh',
    company: 'XTEL Software Solutions (11/2023 - 12/2024)',
    image: 'assets/qldh.webp',
    nameApp: 'Quản lý điều hành',
    description: 'An exclusive E-Government internal operations platform developed for the Ministry of Information and Communications. The application digitizes daily workflows, task assignments, and secure communications for thousands of government personnel.',
    teamSize: '3 (2 mobile, 1 backend)',
    technologies: [
      { logo: 'assets/logo_flutter.webp', name: 'Flutter' },
      { logo: 'assets/logo_firebase.webp', name: 'Firebase' },
      { logo: 'assets/logo_java.webp', name: 'Java' }
    ],
    mainFeatures: [
      'Implemented high-security biometric authentication (FaceID/Fingerprint), ensuring strict access control for internal government data.',
      'Developed a comprehensive task management and scheduling module, tracking thousands of daily assignments and reducing administrative delays by 45%.',
      'Engineered a smart transportation and resource booking system, optimizing logistical operations for scheduled official trips.',
      'Built a real-time statistical dashboard for monitoring task completion rates and directing official orders.'
    ],
    contribution: [
      'Spearheaded a critical codebase refactoring using GetX, eliminating legacy technical debt and boosting application responsiveness by 30%.',
      'Engineered custom Android Native Biometric authentication via MethodChannel. Utilized BiometricPrompt (BIOMETRIC_STRONG) with a smart hardware detection fallback (BiometricManager/FingerprintManager), managing ActivityAware lifecycles and CancellationSignal to prevent memory leaks.',
      'Architected iOS native security using LAContext (.deviceOwnerAuthenticationWithBiometrics) to enforce strict FaceID/TouchID checks, coupled with automated Deep Linking to system settings as a seamless fallback.',
      'Developed and optimized the core task distribution algorithm to handle complex hierarchical assignments seamlessly.'
    ],
    sourceCHplay: 'https://play.google.com/store/apps/details?id=com.xtel.bookmetting_car&pcampaignid=web_share',
    sourceAppstore: 'https://apps.apple.com/vn/app/one-mst/id1562108303?l=vi'
  },
  {
    id: 'nguoitieudung',
    company: 'XTEL Software Solutions (11/2023 - 12/2024)',
    image: 'assets/nguoitieudung.webp',
    nameApp: 'Người tiêu dùng',
    description: 'A public sector application managed by the Vietnam Consumer Protection Association. The platform serves as a critical bridge connecting thousands of citizens with verified businesses, ensuring consumer rights protection, legal compliance, and authentic e-commerce interactions.',
    technologies: [
      { logo: 'assets/logo_flutter.webp', name: 'Flutter' },
      { logo: 'assets/logo_java.webp', name: 'Java' }
    ],
    teamSize: '3 (2 mobile, 1 backend)',
    mainFeatures: [
      'Engineered a secure two-way interaction portal, processing continuous daily consumer complaints and legal consultation requests.',
      'Developed a scalable Survey & Voting module capable of handling concurrent traffic during public voting campaigns.',
      'Implemented an official verification channel for businesses to publish authentic product data, combating counterfeit goods.',
      'Built a comprehensive legal handbook and news feed, keeping citizens updated on consumer protection laws.',
      'Designed a robust membership management system for the Vietnam Consumer Protection Association.'
    ],
    contribution: [
      'Standardized state management across the application using GetX, significantly improving codebase maintainability and module organization.',
      'Architected and delivered the core Survey & Voting engine, optimizing backend API calls for high-load scenarios.',
      'Developed the authentic product directory and legal handbook modules from scratch.',
      'Successfully managed end-to-end deployment pipelines for both App Store and Google Play, ensuring strict compliance with store guidelines.'
    ],
    sourceAppstore: 'https://apps.apple.com/vn/app/ng%C6%B0%E1%BB%9Di-ti%C3%AAu-d%C3%B9ng/id6737721544?l=vi',
    sourceCHplay: 'https://play.google.com/store/apps/details?id=vn.org.nguoitieudung&hl=vi'
  },
  {
    id: 'viettel',
    company: 'ATIN – Advanced Technology Innovations Hanoi, Vietnam (01/2025 - now)',
    image: 'assets/viettel.webp',
    nameApp: 'Viettel EID',
    description: 'An advanced Android Kiosk Solution built for Viettel, designed for fast and secure identity verification on specialized hardware (Joyusing Z10S Pro). The application handles end-to-end identity pipelines including MRZ OCR, NFC chip reading, face-matching, and digital signatures.',
    teamSize: '1',
    technologies: [
      { logo: 'assets/logo_kotlin.webp', name: 'Kotlin' },
      { logo: 'assets/logo_java.webp', name: 'REST API' }
    ],
    mainFeatures: [
      'Full identity verification pipeline: document capture, MRZ OCR, ML Kit image preprocessing, NFC chip reading, and face-matching via Face Engine API.',
      'Integration of manufacturer SDKs for camera, NFC reader, and biometric modules.',
      'VNPAY sandbox QR payment integration and digital signing modules for secure transaction validation.',
      'Liveness detection (smile, blink, turn left/right) and real-time customer photo capture.'
    ],
    contribution: [
      'Developed the Android kiosk application from scratch in Kotlin using MVVM and Clean Architecture, ensuring robust lifecycle handling on dedicated hardware.',
      'Implemented asynchronous capture and processing flows using Coroutines to guarantee smooth and stable real-time operations.',
      'Engineered the complete identity verification pipeline, flawlessly integrating MRZ OCR, NFC extraction, and Face Engine matching.',
      'Connected with Viettel backend systems using Retrofit and secure REST APIs for seamless data synchronization.'
    ],
  },
  {
    id: 'sun-monitor',
    company: 'ATIN – Advanced Technology Innovations Hanoi, Vietnam (01/2025 - now)',
    image: 'assets/sun_monitor.webp',
    nameApp: 'Device Management System',
    description: 'A centralized device management platform developed for SUN Group. The system is successfully deployed and smoothly operating on 700+ Faceterminal F6C-T devices across Sun World locations. It provides real-time insights into hardware performance (RAM, CPU, temperature) and operational status, while supporting OTA updates and remote control to ensure high system reliability.',
    teamSize: '2',
    technologies: [
      { logo: 'assets/logo_kotlin.webp', name: 'Kotlin' },
      { logo: 'assets/logo_nodejs.webp', name: 'Node.js' },
      { logo: 'assets/logo_firebase.webp', name: 'MongoDB' } // reusing firebase icon or similar as placeholder if mongodb logo missing
    ],
    sourceGithub: 'https://github.com/ThanhNg224/device_management_full',
    mainFeatures: [
      'Manage 700+ active devices simultaneously, tracking hardware metrics (RAM, ROM, CPU, storage, temperature) and operational state in real-time.',
      'Perform seamless OTA updates for Smart Face software via automated silent APK installation and scheduled tasks.',
      'Remote device reboot and automated log collection for system alerts and critical status changes.'
    ],
    contribution: [
      'Developed an Android device management agent using Kotlin and Coroutines for background execution.',
      'Built persistent background services to stream real-time device telemetry via WebSockets and collect device logs.',
      'Integrated the mobile agent with a web-based monitoring platform built with Node.js and MongoDB.',
      'Supported silent APK installation, scheduled tasks, and automated OTA updates on Android-based face terminals across multiple deployments.'
    ],
  },
  {
    id: 'atin-timekeeping',
    company: 'ATIN – Advanced Technology Innovations Hanoi, Vietnam (01/2025 - now)',
    image: 'assets/atin_timekeeping.webp',
    nameApp: 'Atin Timekeeping',
    description: 'An internal attendance management application deployed for ATIN company\'s 80+ personnel. The app streamlines HR operations by tracking daily attendance, working hours, and leave/overtime requests with role-based access control.',
    teamSize: '2 (1 mobile, 1 backend)',
    technologies: [
      { logo: 'assets/logo_flutter.webp', name: 'Flutter' },
      { logo: 'assets/logo_firebase.webp', name: 'Firebase' }
    ],
    mainFeatures: [
      'Mobile-based attendance check-in using advanced face detection (google_mlkit_face_detection).',
      'Real-time status tracking for daily records (late arrival, early leave, on time, absent).',
      'Integrated Firebase Push Notifications for leave approvals and administrative alerts.',
      'Comprehensive crash monitoring and stability tracking using Firebase Crashlytics.',
      'Automated leave requests and overtime registration workflows.'
    ],
    contribution: [
      'Architected and implemented the application on a custom highly scalable BLoC core architecture.',
      'Developed custom Dart automation scripts to accelerate project setup and boilerplate generation based on the BLoC core.',
      'Resolved a critical iOS camera white-out bug during selfie check-ins by deeply handling native iOS camera buffers and lifecycles.',
      'Integrated google_mlkit_face_detection for precise and fast employee check-ins.'
    ],
  },
  {
    id: 'record-ai',
    company: 'ATIN – Advanced Technology Innovations Hanoi, Vietnam (01/2025 - now)',
    image: 'assets/recored.webp',
    nameApp: 'Record Ai',
    description: 'An AI-powered Audio Recording & Media Processing Application that automatically converts voice into structured text. It enables users to record meetings, generate AI summaries, analyze vocal emotions, and perform automated checklist scoring.',
    teamSize: '2 (1 mobile, 1 backend)',
    technologies: [
      { logo: 'assets/logo_flutter.webp', name: 'Flutter' },
      { logo: 'assets/logo_glsl.webp', name: 'GLSL' },
      { logo: 'assets/logo_java.webp', name: 'FFmpeg' }
    ],
    mainFeatures: [
      'On-device Audio Processing: Integrated FFmpeg Kit for local format conversion and media manipulation, drastically reducing server-side dependency.',
      'GPU-Accelerated Visualizations: Developed custom Fragment Shaders (GLSL) utilizing Gaussian Blur algorithms and UV coordinate displacement with Perlin/Simplex Noise for fluid distortion rendering (Silk Wave, Aura Lumina).',
      'Offline-First Data Layer: Designed a robust SQLite architecture to handle recording metadata, local audio playback, and persistent storage.',
      'Advanced Audio Capabilities: Managed background audio execution, system volume control, runtime permissions, and cross-platform file sharing.'
    ],
    contribution: [
      'Architected a production-ready Flutter/Dart application utilizing a highly Modular Architecture and BLoC pattern for reusable components.',
      'Engineered complex GLSL shaders for high-performance, GPU-accelerated audio frequency visualizations, mastering algorithms like Gaussian Blur and UV Domain Warping.',
      'Implemented deep native integrations for background recording and comprehensive cross-platform file management.',
      'Built a resilient offline-first storage mechanism using SQLite with automatic cloud synchronization upon network reconnection.'
    ]
  },
  {
    id: 'topcam',
    company: 'TopTop Technology company (Freelancer)',
    image: 'assets/topcam.webp',
    nameApp: 'TopCam - Phụ huynh',
    description: 'A school monitoring application serving 1600+ active users (parents). The app enables parents to track their children’s attendance via AI cameras, receive real-time push notifications, and access live classroom camera streams.',
    teamSize: '1',
    technologies: [
      { logo: 'assets/logo_flutter.webp', name: 'Flutter' },
      { logo: 'assets/logo_firebase.webp', name: 'Firebase' }
    ],
    mainFeatures: [
      'Live Camera Streaming: Integrated VLC player to decode and display live HLS (m3u8) video streams directly from school cameras.',
      'Real-time Alerts: Utilized Firebase Push Notifications for instant updates when children are detected by the AI camera system.',
      'User Profiles & Payments: Managed student profiles, registration, and school fee payments via secure RESTful APIs.',
      'Authentication: Secure user registration and login flows.'
    ],
    contribution: [
      'Developed the entire mobile application using a robust GetX core architecture for streamlined state management and routing.',
      'Successfully integrated VLC for mobile to handle complex m3u8/HLS media streaming protocols.',
      'Handled robust network communication and seamless data synchronization using RESTful APIs.',
      'Managed end-to-end deployment pipelines for Google Play and the App Store.'
    ],
    sourceAppstore: 'https://apps.apple.com/vn/app/topcam-ph%E1%BB%A5-huynh/id6751745649?l=vi',
    sourceCHplay: 'https://play.google.com/store/apps/details?id=vn.ai.topcam.edu&hl=vi',
    sourceAppstore: 'https://apps.apple.com/vn/app/topcam-ph%E1%BB%A5-huynh/id6751745649?l=vi'
  },
  {
    id: 'phoenix',
    company: 'TopTop Technology company (Freelancer)',
    image: 'assets/phoenixcamp.webp',
    nameApp: 'Phoenix - Camp',
    description: 'An educational and community-driven application serving 500+ active students at Phoenix Camp. The platform offers social networking, marketing video courses, event management, and numerology insights.',
    teamSize: '3 (2 mobile, 1 backend)',
    technologies: [
      { logo: 'assets/logo_flutter.webp', name: 'Flutter' },
      { logo: 'assets/logo_firebase.webp', name: 'Firebase' }
    ],
    mainFeatures: [
      'E-Learning & Video Courses: Integrated media_kit and youtube_player_flutter for robust playback of training content and video lessons.',
      'Community & Social Networking: Built rich-text posts (flutter_quill) and multimedia sharing capabilities for deep community engagement.',
      'Event Location & Mapping: Utilized flutter_map for event tracking, check-ins, and schedule management.',
      'Push Notifications & Dynamic UI: Handled Firebase Messaging and Remote Config for dynamic app updates and instant alerts.'
    ],
    contribution: [
      'Architected a highly scalable codebase utilizing the BLoC pattern, Freezed for immutable states, and GetIt/Injectable for Dependency Injection.',
      'Engineered complex navigation flows using AutoRoute and managed robust API communication via Dio and Retrofit.',
      'Optimized local storage and offline caching by integrating the Hive NoSQL database.',
      'Refactored legacy modules, significantly improving overall application responsiveness and code maintainability.'
    ],
    sourceCHplay: 'https://play.google.com/store/apps/details?id=vn.phoenixcamp.mobile&hl=vi',
    sourceAppstore: 'https://apps.apple.com/vn/app/phoenix-ng%C6%B0%E1%BB%9Di-d%E1%BA%ABn-%C4%91%C6%B0%E1%BB%9Dng/id6504493368?l=vi'
  },
  {
    id: 'phoenix-event',
    company: 'TopTop Technology company (Freelancer)',
    image: 'assets/phoenix_affilate.webp',
    nameApp: 'Sự kiện Phoenix',
    description: 'Sự kiện Phoenix is an exclusive application for Phoenix community members to manage their affiliate commissions. Users can easily generate and share affiliate links for Phoenix products and services, allowing them to track their referrals and earnings efficiently.',
    teamSize: '2 (1 mobile, 1 backend)',
    technologies: [
      { logo: 'assets/logo_flutter.webp', name: 'Flutter' },
      { logo: 'assets/logo_cakephp.webp', name: 'Cake' }
    ],
    mainFeatures: [
      'User registration and authentication',
      'Generate and share affiliate links for various products and services',
      'Manage and visualize the affiliate relationship tree (multi-level member hierarchy)',
      'Track commissions, earnings, and payout history in real-time'
    ],
    contribution: [
      'Sole mobile developer for the project',
      'Set up and structured the application architecture by building the core base module',
      'Developed the entire mobile application from scratch'
    ],
    sourceCHplay: 'https://play.google.com/store/apps/details?id=pro.sukien&hl=vi',
    sourceAppstore: 'https://apps.apple.com/vn/app/s%E1%BB%B1-ki%E1%BB%87n-phoenix/id6762500231?l=vi'
  },
  {
    id: 'dsoft',
    company: 'TopTop Technology company (Freelancer)',
    image: 'assets/dsoft.webp',
    nameApp: 'DSOFT',
    description: 'Dsoft - a modern and professional spa and salon management solution. If you\'re looking for a professional and time-saving application to manage your spa, hair salon, etc., Dsoft is the perfect assistant.',
    teamSize: '2 (1 mobile, 1 backend)',
    technologies: [
      { logo: 'assets/logo_flutter.webp', name: 'Flutter' },
      { logo: 'assets/logo_cakephp.webp', name: 'Cake' }
    ],
    mainFeatures: [
      'Customer management (customer groups, customer sources)',
      'Appointment management and booking (consultation, care, treatment, therapy sessions)',
      'Monthly revenue statistics and reporting',
      'Product management (categories, brands, partners)',
      'Service and service group management',
      'Room and bed management',
      'Employee management (teams, rewards, penalties, attendance, payroll)',
      'Financial management (cash book, receipts, payments, accounts receivable, accounts payable)'
    ],
    contribution: [
      'Led the mobile development of the project',
      'Developed the application, refactored legacy code, and applied best practices in state management to improve performance and responsiveness',
      'Built and configured the codebase based on the BLoC architecture',
      'Developed Dart scripts to improve development efficiency and streamline workflows',
      'Deployed the application to Google Play and the App Store'
    ],
    sourceAppstore: 'https://apps.apple.com/vn/app/dsoft-qu%E1%BA%A3n-l%C3%BD-spa-salon/id6744956671?l=vi',
    sourceCHplay: 'https://play.google.com/store/apps/details?id=info.dsoft.app&hl=vi'
  },
  {
    id: 'vpcp',
    company: 'ATIN – Advanced Technology Innovations Hanoi, Vietnam (Deployed in Hội An)',
    image: 'assets/vpcp.webp',
    nameApp: 'Văn phòng chính phủ',
    description: 'An advanced Edge AI and Android Kiosk application deployed for the Government Office in Hội An. The system serves as a highly secure Access Control and Identity Verification platform, operating completely offline with real-time biometric processing.',
    teamSize: '1',
    technologies: [
      { logo: 'assets/logo_kotlin.webp', name: 'Kotlin XML' },
      { logo: 'assets/logo_java.webp', name: 'Java / RxJava' }
    ],
    mainFeatures: [
      'Offline Face Recognition (Edge AI): Integrated ArcSoft Face SDK for on-device biometric extraction and high-speed matching (1:1/1:N) without internet reliance.',
      'Face Liveness Detection: Anti-spoofing mechanism utilizing Dual Camera Management (RGB & IR) to verify living entities and reject spoofing attempts.',
      'Hardware Integration: Interacted with kiosk peripherals via Serial and Intent Broadcasts, integrating NFC/Mifare readers and QRCode scanners.',
      'Background IPC & Networking: Managed persistent TCP/WebSocket connections and broadcasted IPC events to UI threads seamlessly.'
    ],
    contribution: [
      'Successfully integrated the ArcSoft AI SDK (Edge Computing), combining RxJava to process multi-camera streams with recognition latency under 200ms.',
      'Utilized Room Database to securely store and rapidly query tens of thousands of facial feature vectors locally.',
      'Implemented Root Shell Automation, executing deep hardware-level commands (e.g. screenrecord for H.264 video compression via GPU).',
      'Optimized memory usage for low-spec Kiosk devices using Native UI (Kotlin XML), leveraging Glide for image rendering and Lottie for smooth animations.'
    ]
  },
  {
    id: 'smart-guard',
    company: 'ATIN – Advanced Technology Innovations Hanoi, Vietnam (01/2025 - now)',
    image: 'assets/kcnhungphu.webp',
    nameApp: 'Smart Guard',
    description: 'A high-performance cross-platform security monitoring application built with Flutter/Dart. The platform serves as a Real-time Video Monitoring & Security hub, supporting real-time camera streams, device management, and high-security access control.',
    teamSize: '2 (1 mobile, 1 backend)',
    technologies: [
      { logo: 'assets/logo_flutter.webp', name: 'Flutter' },
      { logo: 'assets/logo_kotlin.webp', name: 'Kotlin' },
      { logo: 'assets/logo_swift.webp', name: 'Swift' }
    ],
    mainFeatures: [
      'Real-time Video Monitoring: Integrated WebRTC for real-time video streaming across security cameras.',
      'Advanced Stream Lifecycle Management: Custom engineered stream management across Foreground and Background application states.',
      'Resource Optimization: Dynamically controlled WebRTC tracks and paused inactive streams (using App Lifecycle, TickerMode, and ModalRoute) to minimize unnecessary CPU/GPU and battery usage.',
      'Secure Platform Integration: Built native integrations through MethodChannel for biometric authentication and secure credential storage via Keychain/Keystore.'
    ],
    contribution: [
      'Architected a highly modular Flutter codebase using BLoC pattern for robust state management.',
      'Optimized video rendering and heavy resource consumption for real-time WebRTC streams.',
      'Implemented resilient networking with Dio, featuring custom interceptors, automatic token refresh, request queuing, and retry handling for secure API communication.',
      'Developed native platform bridges (MethodChannel) to integrate deep system-level features.'
    ]
  }
];
