import 'package:care_navigation/constants/app_assets.dart';
import 'package:care_navigation/controller/home/home_controller.dart';
import 'package:care_navigation/utils/app_libraries.dart';
import 'package:care_navigation/view/announcement/announcement_screen.dart';
import 'package:care_navigation/view/assessment/assessment_screen.dart';
import 'package:care_navigation/view/noticeboard/notice_board_screen.dart';
import 'package:care_navigation/view/policy/policy_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      showAppBar: false,
      appbarcolor: AppColors.white,
      automaticallyImplyLeading: true,
      appbarTitle: '',
      bodyData: bodyData(context),
    );
  }

  Widget bodyData(BuildContext context) {
    return GetBuilder<HomeScreenController>(
      init: HomeScreenController(),
      builder: (_) {
        return _.isLoading
            ? Center(
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: Center(
                    child: LoadingAnimationWidget.horizontalRotatingDots(
                        color: AppColors.commonColor, size: 70),
                  ),
                ),
              )
            : Column(
                children: [
                  Image.asset(AppImage.appicon)
                      .marginOnly(top: 120, bottom: 20),
                  const Text(
                    'Main Menu',
                    style: TextStyle(
                        fontSize: 30,
                        letterSpacing: 0.7,
                        fontWeight: FontWeight.w700,
                        color: AppColors.black),
                  ).marginSymmetric(vertical: 30),
                  CircularButtons(
                    text: "Notice Board",
                    width: 250,
                    height: 60,
                    textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white),
                    onPressed: () {
                      Get.to(const NoticeBoardScreen());
                    },
                    backgroundColor: AppColors.commonColor,
                    textColor: AppColors.white,
                    borderColor: AppColors.commonColor,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CircularButtons(
                    text: "Announcement",
                    width: 250,
                    height: 60,
                    textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white),
                    onPressed: () {
                      Get.to(const AnnouncementScree());
                    },
                    backgroundColor: AppColors.commonColor,
                    textColor: AppColors.white,
                    borderColor: AppColors.commonColor,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CircularButtons(
                    text: "Policies & Procedure",
                    width: 250,
                    height: 60,
                    textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white),
                    onPressed: () {
                      Get.to(const PolicyScreen());
                    },
                    backgroundColor: AppColors.commonColor,
                    textColor: AppColors.white,
                    borderColor: AppColors.commonColor,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CircularButtons(
                    text: "Assessment",
                    width: 250,
                    height: 60,
                    textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white),
                    onPressed: () {
                      Get.to(const AssessmentScreen());
                    },
                    backgroundColor: AppColors.commonColor,
                    textColor: AppColors.white,
                    borderColor: AppColors.commonColor,
                  ),
                ],
              );
      },
    );
  }
}
