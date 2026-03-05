import 'package:flutter/material.dart';
import 'package:fog_edge_blur/fog_edge_blur.dart';
import 'package:fog_edge_blur/fog_edge_child.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/page/project_detail.dart';

class Projects extends StatelessWidget {
  const Projects({super.key});

  bool isPhone(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width < 600;
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: isPhone(context)? 20 : 80)
            .add(EdgeInsets.only(bottom: 100, top: 20)),
        key: const PageStorageKey("my_list"),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("XTEL Software Solutions (11/2023 - 12/2024)",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600
              ),
            ),
            GridView(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(vertical: 20),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 500,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 3/2
              ),
              children: [
                BoxItem(
                  image: "assets/ahome.png",
                  nameApp: "Ahome",
                  description: "Ahome is a rental platform that enables users to find, filter, and "
                      "book apartments directly from property owners in Vietnam, with features such "
                      "as OTP authentication, advanced search, room management, and issue reporting.",
                  descriptionVi: "Ahome là nền tảng cho thuê giúp người dùng tìm kiếm, lọc và "
                      "đặt phòng trực tiếp từ chủ nhà tại Việt Nam, với các tính năng như "
                      "xác thực OTP, tìm kiếm nâng cao, quản lý phòng và báo cáo sự cố.",
                  technologies: [
                    Technology(logo: "assets/logo_flutter.png", name: "Flutter"),
                    Technology(logo: "assets/logo_firebase.png", name: "Firebase"),
                    Technology(logo: "assets/logo_java.png", name: "Java"),
                  ],
                  teamSize: "2 (1 mobile, 1 backend)",
                  mainFeatures: [
                    "Sign up and log in to the application",
                    "User verification via OTP code",
                    "Search for rental listings across available locations",
                    "Advanced filters: property types (mini apartments, shared housing, "
                        "homestays, etc.), room types (shared/private bathroom, number of "
                        "bedrooms/living rooms, single room, etc.), price range, and amenities "
                        "(Wi-Fi, air conditioning, washing machine, etc.)"
                    "Manage my rooms, including current and past rentals",
                    "Rent a room and check in (rooms are created by Ahome Pro; users perform check-in)",
                    "Report issues to the landlord/property owner",
                    "Room payment invoices"
                  ],
                  mainFeaturesVi: [
                    "Đăng ký và đăng nhập ứng dụng",
                    "Xác minh người dùng qua mã OTP",
                    "Tìm kiếm danh sách cho thuê tại các địa điểm có sẵn",
                    "Bộ lọc nâng cao: loại bất động sản (chung cư mini, nhà ở ghép, "
                        "homestay, v.v.), loại phòng (phòng tắm chung/riêng, số phòng ngủ/"
                        "phòng khách, phòng đơn, v.v.), khoảng giá và tiện nghi "
                        "(Wi-Fi, điều hòa, máy giặt, v.v.)",
                    "Quản lý phòng của tôi, bao gồm phòng hiện tại và đã thuê",
                    "Thuê phòng và nhận phòng (phòng được tạo bởi Ahome Pro; người dùng thực hiện nhận phòng)",
                    "Báo cáo sự cố cho chủ nhà/chủ sở hữu",
                    "Hóa đơn thanh toán phòng"
                  ],
                  contribution: [
                    "Sole contributor to the project",
                    "Independently developed the entire project"
                  ],
                  contributionVi: [
                    "Đóng góp duy nhất cho dự án",
                    "Phát triển độc lập toàn bộ dự án"
                  ],
                  sourceCHplay: "https://play.google.com/store/apps/details?id=vn.xtel.ahome.timtro&hl=vi",
                  sourceAppstore: "https://apps.apple.com/vn/app/homevn-tr%E1%BB%8D-ch%C3%ADnh-ch%E1%BB%A7/id6736515000?l=vi",
                ),
                BoxItem(
                  image: "assets/ahome_pro.png",
                  nameApp: "Ahome Pro",
                  description: "The app is a comprehensive rental property management solution designed for "
                      "homeowners. It allows users to manage buildings and rooms, handle contracts "
                      "(including deposits, renewals, and cancellations), and track payments such as rent, "
                      "utilities, and service fees. The system also supports tenant check-in, issue reporting, "
                      "and maintenance tracking with real-time status updates. In addition, it provides "
                      "monthly statistics on payment status and room occupancy, helping homeowners optimize "
                      "operations and reduce revenue loss.",
                  descriptionVi: "Ứng dụng là giải pháp quản lý bất động sản cho thuê toàn diện dành cho "
                      "chủ nhà. Cho phép quản lý tòa nhà và phòng, xử lý hợp đồng "
                      "(bao gồm đặt cọc, gia hạn và hủy bỏ), theo dõi thanh toán tiền thuê, "
                      "điện nước và phí dịch vụ. Hệ thống cũng hỗ trợ nhận phòng, báo cáo sự cố, "
                      "và theo dõi bảo trì với cập nhật trạng thái thời gian thực. Ngoài ra, cung cấp "
                      "thống kê hàng tháng về tình trạng thanh toán và tỷ lệ phòng trống.",
                  mainFeatures: [
                    "User registration and authentication (OTP verification)",
                    "Building and room management (by type, category, and name)",
                    "Room billing management (rent, utilities, and service fees) with invoice delivery",
                    "Room details and contract management (deposit creation, contract creation, renewal, "
                        "and cancellation) with tenant check-in and payment confirmation",
                    "Handle reports and issues from tenants, with maintenance status updates (pending, "
                        "in progress, completed)",
                    "Monthly statistics on payment status (fully paid, partially paid, unpaid), room "
                        "status (occupied, vacant, expiring), and maintenance tracking",
                    "Payment information and bank account management",
                    "Create and publish rental listings for Ahome users"
                  ],
                  mainFeaturesVi: [
                    "Đăng ký và xác thực người dùng (xác minh OTP)",
                    "Quản lý tòa nhà và phòng (theo loại, danh mục và tên)",
                    "Quản lý hóa đơn phòng (tiền thuê, điện nước và phí dịch vụ) với gửi hóa đơn",
                    "Chi tiết phòng và quản lý hợp đồng (tạo đặt cọc, tạo hợp đồng, gia hạn "
                        "và hủy bỏ) với nhận phòng và xác nhận thanh toán",
                    "Xử lý báo cáo và sự cố từ người thuê, với cập nhật trạng thái bảo trì (chờ xử lý, "
                        "đang xử lý, hoàn thành)",
                    "Thống kê hàng tháng về tình trạng thanh toán (đã thanh toán, thanh toán một phần, chưa thanh toán), "
                        "trạng thái phòng (đã thuê, trống, sắp hết hạn) và theo dõi bảo trì",
                    "Quản lý thông tin thanh toán và tài khoản ngân hàng",
                    "Tạo và đăng tin cho thuê cho người dùng Ahome"
                  ],
                  technologies: [
                    Technology(logo: "assets/logo_flutter.png", name: "Flutter"),
                    Technology(logo: "assets/logo_firebase.png", name: "Firebase"),
                    Technology(logo: "assets/logo_java.png", name: "Java"),
                  ],
                  contribution: [
                    "Contributed approximately 40% of the project",
                    "Optimized codebase and project structure, refactored legacy code, "
                        "and improved performance and state management",
                    "Developed rental listing and room detail features",
                    "Implemented statistics for issues, payment status, and room status, with detailed analytics views",
                    "Built payment information management, including storing landlords' bank account details",
                    "Developed utility cost management (electricity, water) with invoice generation and storage",
                    "Implemented rent invoice generation and delivery"
                  ],
                  contributionVi: [
                    "Đóng góp khoảng 40% dự án",
                    "Tối ưu hóa codebase và cấu trúc dự án, tái cấu trúc mã cũ, "
                        "và cải thiện hiệu suất và quản lý trạng thái",
                    "Phát triển tính năng đăng tin cho thuê và chi tiết phòng",
                    "Triển khai thống kê sự cố, trạng thái thanh toán và trạng thái phòng với giao diện phân tích chi tiết",
                    "Xây dựng quản lý thông tin thanh toán, bao gồm lưu trữ thông tin tài khoản ngân hàng của chủ nhà",
                    "Phát triển quản lý chi phí điện nước với tạo và lưu trữ hóa đơn",
                    "Triển khai tạo và gửi hóa đơn tiền thuê"
                  ],
                  teamSize: "3 (2 mobile, 1 backend)",
                  sourceCHplay: "https://play.google.com/store/apps/details?id=vn.xtel.ahome.host&hl=vi",
                  sourceAppstore: "https://apps.apple.com/vn/app/homevn-pro/id6720719430?l=vi",
                ),
                BoxItem(
                  image: "assets/qldh.png",
                  nameApp: "Quản lý điều hành",
                  description: "The application assists users working in"
                      " the Ministry of Information office.",
                  descriptionVi: "Ứng dụng hỗ trợ người dùng làm việc tại"
                      " văn phòng Bộ Thông tin.",
                  teamSize: "3 (2 mobile, 1 backend)",
                  mainFeatures: [
                    "Sign up, log in, and account verification",
                    "Optional biometric authentication (fingerprint/face recognition) for fast and secure access",
                    "Task management, scheduling, and meeting organization",
                    "Manage tasks: view, assign, and receive tasks",
                    "View and book transportation for scheduled trips"
                  ],
                  mainFeaturesVi: [
                    "Đăng ký, đăng nhập và xác minh tài khoản",
                    "Xác thực sinh trắc học tùy chọn (vân tay/nhận diện khuôn mặt) để truy cập nhanh và an toàn",
                    "Quản lý công việc, lịch trình và tổ chức cuộc họp",
                    "Quản lý nhiệm vụ: xem, giao và nhận nhiệm vụ",
                    "Xem và đặt phương tiện di chuyển cho các chuyến đi theo lịch"
                  ],
                  technologies: [
                    Technology(logo: "assets/logo_flutter.png", name: "Flutter"),
                    Technology(logo: "assets/logo_firebase.png", name: "Firebase"),
                    Technology(logo: "assets/logo_java.png", name: "Java"),
                  ],
                  contribution: [
                    "Estimated contribution: 16% of the project",
                    "Optimized and refactored the codebase. Cleaned up legacy code, "
                        "applied best practices for state management, "
                        "and improved responsiveness.",
                    "Updated the UI in collaboration with the Designer",
                    "Managed tasks: assigned and received tasks, updated statistics "
                        "for assigned tasks and directed tasks."
                  ],
                  contributionVi: [
                    "Đóng góp ước tính 16% dự án",
                    "Tối ưu hóa và tái cấu trúc mã. Dọn dẹp mã nguồn cũ, "
                        "áp dụng các phương pháp quản lý trạng thái tốt nhất "
                        "và nâng cao khả năng phản hồi.",
                    "Cập nhật lại giao diện, phối hợp cùng Designer",
                    "Quản lý nhiệm vụ, giao và nhận nhiệm vụ, cập nhật thống kê "
                        "nhiệm vụ được giao, nhiêm vụ chỉ đạo."
                  ],
                  sourceCHplay: "https://play.google.com/store/apps/details?id=com.xtel.bookmetting_car&pcampaignid=web_share",
                  sourceAppstore: "https://apps.apple.com/vn/app/one-mst/id1562108303?l=vi",
                ),
                BoxItem(
                  image: "assets/nguoitieudung.png",
                  nameApp: "Người tiêu dùng",
                  description: "The “Người tiêu dùng” app provides knowledge, news, and guidance to protect the rights "
                      "and legitimate interests of consumers. Users can easily access essential consumer rights, "
                      "safety alerts, and the latest updates from the Vietnam Consumer Protection Association.",
                  descriptionVi: "Ứng dụng \u201cNgười tiêu dùng\u201d cung cấp kiến thức, tin tức và hướng dẫn bảo vệ quyền "
                      "và lợi ích hợp pháp của người tiêu dùng. Người dùng có thể dễ dàng tiếp cận các quyền "
                      "cơ bản, cảnh báo an toàn và cập nhật mới nhất từ Hội Bảo vệ Người tiêu dùng Việt Nam.",
                  technologies: [
                    Technology(logo: "assets/logo_flutter.png", name: "Flutter"),
                    Technology(logo: "assets/logo_java.png", name: "Java"),
                  ],
                  mainFeatures: [
                    "Two-way interaction for complaints and consultation support",
                    "Consumer protection law awareness and informational content",
                    "Two-way interaction for consumer feedback and policy responses",
                    "Official channel for businesses to provide authentic product information",
                    "Voting and survey system for businesses",
                    "Membership management system for the Vietnam Consumer Protection Association",
                    "Platform for showcasing trusted products and services, acting as an e-commerce "
                        "bridge connecting manufacturers, distributors, and exporters to end consumers "
                        "in compliance with regulations"
                  ],
                  mainFeaturesVi: [
                    "Tương tác hai chiều để hỗ trợ khiếu nại và tư vấn",
                    "Nâng cao nhận thức về luật bảo vệ người tiêu dùng và nội dung thông tin",
                    "Tương tác hai chiều cho phản hồi của người tiêu dùng và phản hồi chính sách",
                    "Kênh chính thức cho doanh nghiệp cung cấp thông tin sản phẩm xác thực",
                    "Hệ thống bình chọn và khảo sát cho doanh nghiệp",
                    "Hệ thống quản lý hội viên Hội Bảo vệ Người tiêu dùng Việt Nam",
                    "Nền tảng giới thiệu sản phẩm và dịch vụ uy tín, đóng vai trò cầu nối thương mại điện tử "
                        "kết nối nhà sản xuất, nhà phân phối và nhà xuất khẩu với người tiêu dùng "
                        "theo quy định"
                  ],
                  teamSize: "3 (2 mobile, 1 backend)",
                  contribution: [
                    "Key contributor (~50% of the project)",
                    "Refactored and structured the codebase, applied best practices in state management, "
                        "and organized the project using corebase and melos",
                    "Developed news, events, and legal handbook features",
                    "Implemented survey and voting system",
                    "Developed authentic product guide features",
                    "Deploy the application to CHplay and Appstore."
                  ],
                  contributionVi: [
                    "Đóng góp chính (~50% dự án)",
                    "Tái cấu trúc và tổ chức codebase, áp dụng best practices trong quản lý trạng thái, "
                        "và tổ chức dự án sử dụng corebase và melos",
                    "Phát triển tính năng tin tức, sự kiện và sổ tay pháp luật",
                    "Triển khai hệ thống khảo sát và bình chọn",
                    "Phát triển tính năng hướng dẫn sản phẩm xác thực",
                    "Triển khai ứng dụng lên CHplay và Appstore."
                  ],
                  sourceAppstore: "https://apps.apple.com/vn/app/ng%C6%B0%E1%BB%9Di-ti%C3%AAu-d%C3%B9ng/id6737721544?l=vi",
                  sourceCHplay: "https://play.google.com/store/apps/details?id=vn.org.nguoitieudung&hl=vi",
                ),
              ],
            ),
            Text("ATIN – Advanced Technology Innovations Hanoi, Vietnam (01/2025 - now)", style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600
            )),
            GridView(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(vertical: 20),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 500,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 3/2
              ),
              children: [
                BoxItem(
                  image: "assets/viettel.png",
                  nameApp: "Viettel verify ID",
                  description: "Viettel Verify ID app enables fast and secure identity verification by scanning ID "
                      "documents, performing face matching with liveness detection, and capturing user signatures.",
                  descriptionVi: "Ứng dụng Viettel Verify ID cho phép xác minh danh tính nhanh chóng và an toàn bằng cách quét "
                      "giấy tờ tùy thân, đối chiếu khuôn mặt với phát hiện sống và thu thập chữ ký người dùng.",
                  teamSize: "1",
                  technologies: [Technology(logo: "assets/logo_kotlin.jpeg", name: "Kotlin")],
                  mainFeatures: [
                    "Scan ID cards/passports and extract information for display",
                    "Capture customer photos and verify identity with liveness detection (smile, blink, turn left/right)",
                    "Customer signature confirmation",
                    "Service rating and feedback"
                  ],
                  mainFeaturesVi: [
                    "Quét CCCD/hộ chiếu và trích xuất thông tin hiển thị",
                    "Chụp ảnh khách hàng và xác minh danh tính với phát hiện sống (cười, nháy mắt, quay trái/phải)",
                    "Xác nhận chữ ký khách hàng",
                    "Đánh giá dịch vụ và phản hồi"
                  ],
                  contribution: [
                    "Sole contributor to the project",
                    "Independently developed the entire project"
                  ],
                  contributionVi: [
                    "Đóng góp duy nhất cho dự án",
                    "Phát triển độc lập toàn bộ dự án"
                  ],
                ),
                BoxItem(
                  image: "assets/sun_monitor.jpeg",
                  nameApp: "SUN monitor",
                  description: "A device management platform for SUN Group Smart Face systems that enables "
                      "centralized monitoring and control of devices. The system provides real-time insights "
                      "into device performance, including hardware metrics such as RAM, CPU, storage, and temperature, "
                      "along with operational status and location tracking. It also supports OTA software updates, "
                      "remote device reboot, and automated email notifications to ensure efficient maintenance and "
                      "system reliability.",
                  teamSize: "2 (1 mobile - backend, 1 web)",
                  technologies: [
                    Technology(logo: "assets/logo_kotlin.jpeg", name: "Kotlin"),
                    Technology(logo: "assets/logo_jetpack.png", name: "Jetpack"),
                    Technology(logo: "assets/logo_nodejs.png", name: "NodeJS"),
                    Technology(logo: "assets/logo_typejs.png", name: "TypeJS"),
                    Technology(logo: "assets/logo_reactjs.svg.png", name: "ReactJS"),
                  ],
                  sourceGithub: "https://github.com/ThanhNg224/device_management_full",
                  mainFeatures: [
                    "Manage devices, including quantity, status (RAM, ROM, CPU, temperature), operational "
                        "state (online/offline), and location",
                    "Perform OTA updates for Smart Face software via file transfer from the web platform",
                    "Remote device reboot",
                    "Send device status notifications via email"
                  ],
                  mainFeaturesVi: [
                    "Quản lý thiết bị, bao gồm số lượng, trạng thái (RAM, ROM, CPU, nhiệt độ), "
                        "trạng thái hoạt động (online/offline) và vị trí",
                    "Cập nhật OTA cho phần mềm Smart Face qua truyền file từ nền tảng web",
                    "Khởi động lại thiết bị từ xa",
                    "Gửi thông báo trạng thái thiết bị qua email"
                  ],
                  descriptionVi: "Nền tảng quản lý thiết bị cho hệ thống SUN Group Smart Face, cho phép "
                      "giám sát và điều khiển tập trung các thiết bị. Cung cấp thông tin thời gian thực "
                      "về hiệu suất phần cứng (RAM, CPU, bộ nhớ, nhiệt độ), trạng thái hoạt động "
                      "và theo dõi vị trí. Hỗ trợ cập nhật OTA, khởi động lại từ xa và thông báo email tự động.",
                    contribution: [
                      "Contributed to mobile and backend development",
                      "Optimized performance on Smart Face devices for continuous data transmission via sockets",
                      "Improved service reliability to ensure the app restarts when killed and auto-recovers after device reboot",
                      "Implemented software update mechanism triggered by server notifications with APK delivery (Smart Face app)",
                      "Enabled automatic device reboot via server commands",
                      "Developed backend APIs",
                      "Enhanced backend security by securing API endpoints and restricting unauthorized access to APK storage"
                    ],
                    contributionVi: [
                      "Đóng góp phát triển mobile và backend",
                      "Tối ưu hiệu suất trên thiết bị Smart Face cho truyền dữ liệu liên tục qua socket",
                      "Cải thiện độ tin cậy dịch vụ, đảm bảo ứng dụng tự khởi động lại khi bị tắt và tự phục hồi sau khi khởi động lại thiết bị",
                      "Triển khai cơ chế cập nhật phần mềm khi nhận thông báo từ server với gửi APK (ứng dụng Smart Face)",
                      "Cho phép khởi động lại thiết bị tự động qua lệnh từ server",
                      "Phát triển API backend",
                      "Tăng cường bảo mật backend bằng cách bảo vệ API endpoint và hạn chế truy cập trái phép vào kho APK"
                    ]
                ),
                BoxItem(
                  image: "assets/atin_timekeeping.png",
                  nameApp: "Atin Timekeeping",
                  description: "An attendance management application for Atin company employees, enabling "
                      "users to track daily attendance, working hours, and statuses with detailed monthly "
                      "records. The app supports mobile-based check-in, leave and overtime requests, role-based "
                      "access control, and multi-language customization.",
                  teamSize: "2 (1 mobile, 1 backend)",
                  technologies: [
                    Technology(logo: "assets/logo_flutter.png", name: "Flutter"),
                    Technology(logo: "assets/logo_java.png", name: "Java"),
                    Technology(logo: "assets/logo_firebase.png", name: "Firebase"),
                  ],
                  mainFeatures: [
                    "Login with company-provided accounts",
                    "Track attendance with detailed daily records by month, including working days, "
                        "working hours, and statuses (late arrival, early leave, on time, absent)",
                    "Multi-language and multi-theme support",
                    "Mobile-based attendance check-in",
                    "Role-based access control (admin and employee)",
                    "Leave requests and overtime registration"
                  ],
                  mainFeaturesVi: [
                    "Đăng nhập bằng tài khoản do công ty cung cấp",
                    "Theo dõi chấm công với bản ghi chi tiết hàng ngày theo tháng, bao gồm ngày làm việc, "
                        "giờ làm việc và trạng thái (đi muộn, về sớm, đúng giờ, vắng mặt)",
                    "Hỗ trợ đa ngôn ngữ và đa giao diện",
                    "Chấm công qua điện thoại",
                    "Phân quyền truy cập theo vai trò (admin và nhân viên)",
                    "Yêu cầu nghỉ phép và đăng ký làm thêm giờ"
                  ],
                  contribution: [
                    "Sole contributor to the project",
                    "Set up and structured the application, implementing a core base architecture using Bloc",
                    "Developed Dart scripts to automate and accelerate project setup based on the defined architecture"
                  ],
                  contributionVi: [
                    "Đóng góp duy nhất cho dự án",
                    "Thiết lập và cấu trúc ứng dụng, triển khai kiến trúc core base sử dụng Bloc",
                    "Phát triển Dart scripts để tự động hóa và đẩy nhanh quá trình thiết lập dự án theo kiến trúc đã định"
                  ],
                  descriptionVi: "Ứng dụng quản lý chấm công cho nhân viên công ty Atin, cho phép "
                      "theo dõi chấm công hàng ngày, giờ làm việc và trạng thái với bản ghi chi tiết theo tháng. "
                      "Hỗ trợ chấm công qua điện thoại, yêu cầu nghỉ phép và làm thêm giờ, phân quyền vai trò "
                      "và tùy chỉnh đa ngôn ngữ.",
                ),
              ],
            ),
            Text("TopTop Technology company (Freelancer)", style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600
            ),),
            GridView(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(vertical: 20),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 500,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 3/2
              ),
              children: [
                BoxItem(
                  image: "assets/topcam.png",
                  nameApp: "TopCam - Phụ huynh",
                  description: "The app enables parents to monitor their children’s attendance through the school’s "
                      "AI-powered camera system, receive real-time notifications, and access live camera "
                      "streams. It also supports student registration and payment management.",
                  descriptionVi: "Ứng dụng giúp phụ huynh giám sát việc điểm danh của con em qua hệ thống "
                      "camera AI của trường học, nhận thông báo thời gian thực và truy cập "
                      "camera trực tiếp. Hỗ trợ đăng ký học sinh và quản lý thanh toán.",
                  mainFeatures: [
                    "User registration and authentication",
                    "View and manage children’s profiles, with registration and payment features",
                    "Receive notifications when children are checked in via the school’s AI camera system",
                    "Live camera streaming access"
                  ],
                  mainFeaturesVi: [
                    "Đăng ký và xác thực người dùng",
                    "Xem và quản lý hồ sơ con em, với tính năng đăng ký và thanh toán",
                    "Nhận thông báo khi con em được điểm danh qua hệ thống camera AI của trường",
                    "Truy cập phát trực tiếp camera"
                  ],
                  technologies: [
                    Technology(logo: "assets/logo_flutter.png", name: "Flutter"),
                    Technology(logo: "assets/logo_firebase.png", name: "Firebase"),
                    Technology(logo: "assets/logo_cakephp.png", name: "Cake"),
                  ],
                  contribution: [
                    "Sole mobile developer for the project",
                    "Set up and structured the codebase using GetX architecture",
                    "Deployed the application to Google Play and the App Store"
                  ],
                  contributionVi: [
                    "Là nhà phát triển mobile duy nhất của dự án",
                    "Thiết lập và cấu trúc codebase sử dụng kiến trúc GetX",
                    "Triển khai ứng dụng lên Google Play và App Store"
                  ],
                  sourceAppstore: "https://apps.apple.com/vn/app/topcam-ph%E1%BB%A5-huynh/id6751745649?l=vi",
                  sourceCHplay: "https://play.google.com/store/apps/details?id=vn.ai.topcam.edu&hl=vi",
                ),
                BoxItem(
                  image: "assets/phoenixcamp.png",
                  nameApp: "Phoenix - camp",
                  description: "The application enables Phoenix users and students to connect, learn, and engage "
                      "within a community-driven platform, offering features such as social networking, mentorship "
                      "content, events, numerology insights, and marketing courses.",
                  descriptionVi: "Ứng dụng giúp người dùng và học viên Phoenix kết nối, học tập và tham gia "
                      "trong nền tảng cộng đồng, cung cấp mạng xã hội, nội dung mentor, "
                      "sự kiện, thần số học và khóa học marketing.",
                  technologies: [
                    Technology(logo: "assets/logo_flutter.png", name: "Flutter"),
                    Technology(logo: "assets/logo_firebase.png", name: "Firebase"),
                    Technology(logo: "assets/logo_cakephp.png", name: "Cake"),
                  ],
                  mainFeatures: [
                    "User registration and login",
                    "Social networking for sharing moments",
                    "Add friends and block users",
                    "Library: videos, documents, and images shared by mentors",
                    "Events organized by mentors with registration and schedule management",
                    "Numerology",
                    "Marketing courses (training content and video lessons)",
                    "Increase engagement on social media platforms (Facebook, TikTok, etc.)"
                  ],
                  mainFeaturesVi: [
                    "Đăng ký và đăng nhập",
                    "Mạng xã hội chia sẻ khoảnh khắc",
                    "Thêm bạn và chặn người dùng",
                    "Thư viện: video, tài liệu và hình ảnh được mentor chia sẻ",
                    "Sự kiện do mentor tổ chức với đăng ký và quản lý lịch trình",
                    "Thần số học",
                    "Khóa học marketing (nội dung đào tạo và bài giảng video)",
                    "Tăng tương tác trên mạng xã hội (Facebook, TikTok, v.v.)"
                  ],
                  teamSize: "3 (2 mobile, 1 backend)",
                  contribution: [
                    "Maintained and enhanced the mobile application.",
                    "Contributed approximately 28% of the overall project development.",
                    "Updated UI and business logic based on evolving requirements.",
                    "Refactored legacy code, applied best practices for state management, and improved app responsiveness.",
                    "Optimized the video lesson module to prevent crashes and ensure smooth playback.",
                    "Developed user interaction features for community posts.",
                    "Implemented Phoenix account upgrade and payment functionality."
                  ],
                  contributionVi: [
                    "Bảo trì và nâng cấp ứng dụng mobile.",
                    "Đóng góp khoảng 28% phát triển tổng thể dự án.",
                    "Cập nhật UI và logic nghiệp vụ theo yêu cầu thay đổi.",
                    "Tái cấu trúc mã cũ, áp dụng best practices quản lý trạng thái và cải thiện khả năng phản hồi.",
                    "Tối ưu module bài giảng video để tránh crash và đảm bảo phát lại mượt mà.",
                    "Phát triển tính năng tương tác người dùng cho bài viết cộng đồng.",
                    "Triển khai nâng cấp tài khoản Phoenix và chức năng thanh toán."
                  ],
                  sourceCHplay: "https://play.google.com/store/apps/details?id=vn.phoenixcamp.mobile&hl=vi",
                  sourceAppstore: "https://apps.apple.com/vn/app/phoenix-ng%C6%B0%E1%BB%9Di-d%E1%BA%ABn-%C4%91%C6%B0%E1%BB%9Dng/id6504493368?l=vi",
                ),
                BoxItem(
                  image: "assets/dsoft.png",
                  nameApp: "DSOFT",
                  description: "Dsoft - a modern and professional spa and salon management "
                      "solution. If you're looking for a professional and time-saving "
                      "application to manage your spa, hair salon, etc., Dsoft is the "
                      "perfect assistant.",
                  descriptionVi: "Dsoft - giải pháp quản lý spa và salon hiện đại và chuyên nghiệp. "
                      "Nếu bạn đang tìm một ứng dụng chuyên nghiệp và tiết kiệm thời gian "
                      "để quản lý spa, tiệm tóc, v.v., Dsoft là trợ lý hoàn hảo.",
                  technologies: [
                    Technology(logo: "assets/logo_flutter.png", name: "Flutter"),
                    Technology(logo: "assets/logo_cakephp.png", name: "Cake"),
                  ],
                  mainFeatures: [
                    "Customer management (customer groups, customer sources)",
                    "Appointment management and booking (consultation, care, treatment, therapy sessions)",
                    "Monthly revenue statistics and reporting",
                    "Product management (categories, brands, partners)",
                    "Service and service group management",
                    "Room and bed management",
                    "Employee management (teams, rewards, penalties, attendance, payroll)",
                    "Financial management (cash book, receipts, payments, accounts receivable, accounts payable)"
                  ],
                  mainFeaturesVi: [
                    "Quản lý khách hàng (nhóm khách hàng, nguồn khách hàng)",
                    "Quản lý lịch hẹn và đặt lịch (tư vấn, chăm sóc, điều trị, liệu trình)",
                    "Thống kê doanh thu hàng tháng và báo cáo",
                    "Quản lý sản phẩm (danh mục, thương hiệu, đối tác)",
                    "Quản lý dịch vụ và nhóm dịch vụ",
                    "Quản lý phòng và giường",
                    "Quản lý nhân viên (nhóm, thưởng, phạt, chấm công, lương)",
                    "Quản lý tài chính (sổ quỹ, phiếu thu, phiếu chi, công nợ phải thu, công nợ phải trả)"
                  ],
                  teamSize: "2 (1 mobile, 1 backend)",
                  contribution: [
                    "Led the mobile development of the project",
                    "Developed the application, refactored legacy code, and applied best practices in state management to improve performance and responsiveness",
                    "Built and configured the codebase based on the BLoC architecture",
                    "Developed Dart scripts to improve development efficiency and streamline workflows",
                    "Deployed the application to Google Play and the App Store"
                  ],
                  contributionVi: [
                    "Dẫn dắt phát triển mobile của dự án",
                    "Phát triển ứng dụng, tái cấu trúc mã cũ và áp dụng best practices quản lý trạng thái để cải thiện hiệu suất",
                    "Xây dựng và cấu hình codebase theo kiến trúc BLoC",
                    "Phát triển Dart scripts để nâng cao hiệu quả phát triển và tối ưu quy trình",
                    "Triển khai ứng dụng lên Google Play và App Store"
                  ],
                  sourceAppstore: "https://apps.apple.com/vn/app/dsoft-qu%E1%BA%A3n-l%C3%BD-spa-salon/id6744956671?l=vi",
                  sourceCHplay: "https://play.google.com/store/apps/details?id=info.dsoft.app&hl=vi",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BoxItem extends StatefulWidget {
  final String image;
  final String nameApp;
  final String description;
  final String? descriptionVi;
  final String? teamSize;
  final List<String> mainFeatures;
  final List<String> mainFeaturesVi;
  final List<String> contribution;
  final List<String> contributionVi;
  final List<Technology> technologies;
  final String? sourceCHplay;
  final String? sourceAppstore;
  final String? sourceGithub;

  const BoxItem({
    super.key,
    required this.image,
    required this.nameApp,
    required this.description,
    this.descriptionVi,
    this.teamSize,
    this.mainFeatures = const [],
    this.mainFeaturesVi = const [],
    this.contribution = const [],
    this.contributionVi = const [],
    this.technologies = const [],
    this.sourceCHplay,
    this.sourceAppstore,
    this.sourceGithub,
  });

  @override
  State<BoxItem> createState() => BoxItemState();
}

class BoxItemState extends State<BoxItem> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push("/project_detail", extra: ModelArgument(
        image: widget.image,
        description: widget.description,
        descriptionVi: widget.descriptionVi,
        nameApp: widget.nameApp,
        temSize: widget.teamSize,
        mainFeatures: widget.mainFeatures,
        mainFeaturesVi: widget.mainFeaturesVi,
        contribution: widget.contribution,
        contributionVi: widget.contributionVi,
        technologies: widget.technologies,
        sourceCHplay: widget.sourceCHplay,
        sourceAppstore: widget.sourceAppstore,
        sourceGithub: widget.sourceGithub,
      )),
      child: MouseRegion(
        onEnter: (_) => setState(() => isHover = true),
        onExit: (_) => setState(() => isHover = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: isHover ? [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.2),
                blurRadius: 20,
              )
            ] : [],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FogEdgeBlur(
              edgeAlign: EdgeAlign.bottom,
              sigma: 3,
              fogEdgeChild: FogEdgeChild(
                heightEdge: 100,
                colorEdge: Colors.black.withValues(alpha: 0.3),
                child: Padding(
                  padding: const EdgeInsets.all(10)
                      .add(const EdgeInsets.only(top: 5)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.nameApp,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18,
                          shadows: [
                            Shadow(
                              blurRadius: 4,
                              color: Colors.black.withValues(alpha: 0.5),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        widget.description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              blurRadius: 4,
                              color: Colors.black.withValues(alpha: 0.5),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              child: AnimatedScale(
                scale: isHover ? 1.08 : 1.0,
                duration: const Duration(milliseconds: 250),
                child: Image.asset(
                  widget.image,
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
