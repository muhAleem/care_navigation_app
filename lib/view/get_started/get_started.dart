import 'package:care_navigation/constants/app_assets.dart';
import 'package:care_navigation/controller/get_started/get_started_controller.dart';
import 'package:care_navigation/utils/app_libraries.dart';
import 'package:care_navigation/view/auth/login/login_screen.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      bodyData: bodyData(context),
      backGroundColors: AppColors.white,
    );
  }

  Widget bodyData(BuildContext context) {
    return GetBuilder<GetStartedController>(
        init: GetStartedController(),
        builder: (_) {
          return _.isLoading
              ? Center(
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: Center(
                      child: LoadingAnimationWidget.threeArchedCircle(
                          color: AppColors.commonColor, size: 70),
                    ),
                  ),
                )
              : Container(
                  height: Get.height,
                  width: Get.width,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(AppImage.getstarted),
                          fit: BoxFit.cover)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/app_logo.png')
                          .marginOnly(left: 80),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            AppText.welcome,
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: AppColors.white),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text(
                            AppText.to,
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w300,
                                color: AppColors.white),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            AppText.care,
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w300,
                                color: AppColors.white),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text(
                            AppText.navigation,
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: AppColors.white),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(LoginScreen());
                        },
                        child: Container(
                          height: 55,
                          width: 220,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: AppColors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Text(
                                AppText.getstarted,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.black),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: AppColors.black,
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ).marginOnly(bottom: 80),
                ).marginOnly(top: 80);
        });
  }
}
