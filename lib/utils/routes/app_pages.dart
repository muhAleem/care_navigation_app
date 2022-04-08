import 'package:care_navigation/utils/app_libraries.dart';

import 'package:care_navigation/view/announcement/announcement_screen.dart';
import 'package:care_navigation/view/assessment/assessment_screen.dart';
import 'package:care_navigation/view/auth/login/login_screen.dart';
import 'package:care_navigation/view/auth/password/forget_password_screen.dart';
import 'package:care_navigation/view/auth/register/sign_up_screen.dart';
import 'package:care_navigation/view/createfolder/create_folder_screen.dart';

import 'package:care_navigation/view/get_started/get_started.dart';
import 'package:care_navigation/view/noticeboard/notice_board_screen.dart';
import 'package:care_navigation/view/pdf/view_pdf_screen.dart';
import 'package:care_navigation/view/policy/policy_screen.dart';

class AppPages {
  static const initial = Routes.loginscreenRoutes;

  static final routes = [
    //< -------------------- Get Started Page ----------------->
    GetPage(
      name: Routes.getStartedRoutes,
      page: () => const GetStarted(),
    ),

    //< -------------------- Login Page ----------------->
    GetPage(
      name: Routes.loginscreenRoutes,
      page: () => const LoginScreen(),
    ),

    //< -------------------- Register Page ----------------->
    GetPage(
      name: Routes.registerscreenRoutes,
      page: () => const RegisterScreen(),
    ),

    //< -------------------- Forget Password Page ----------------->
    GetPage(
      name: Routes.forgetpasswordscreenRoutes,
      page: () => const ForgetPassword(),
    ),

    //< -------------------- Update Password Page ----------------->

    //< -------------------- Notice Board Page ----------------->
    GetPage(
      name: Routes.noticeboardscreenRoutes,
      page: () => const NoticeBoardScreen(),
    ),

    //< --------------------Announcement Page ----------------->
    GetPage(
      name: Routes.announcementscreenRoutes,
      page: () => const AnnouncementScree(),
    ),

    //< --------------------Policy Page ----------------->
    GetPage(
      name: Routes.policyscreenRoutes,
      page: () => const PolicyScreen(),
    ),
    //< --------------------Assessment Page ----------------->
    GetPage(
      name: Routes.assessmentscreenRoutes,
      page: () => const AssessmentScreen(),
    ),

    //< --------------------Create Folder Page ----------------->
    GetPage(
      name: Routes.createfoldercreenRoutes,
      page: () => const CreateFolderScreen(),
    ),

    //< --------------------View Pdf Page ----------------->
    GetPage(
      name: Routes.viewpdfcreenRoutes,
      page: () => const ViewPdfScreen(),
    ),
  ];
}
