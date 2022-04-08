import 'package:care_navigation/constants/app_assets.dart';
import 'package:care_navigation/controller/assessment/assessment_controller.dart';
import 'package:care_navigation/utils/app_libraries.dart';

class AssessmentScreen extends StatelessWidget {
  const AssessmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      showAppBar: true,
      appbarcolor: AppColors.white,
      automaticallyImplyLeading: true,
      appbarTitle: AppText.assessment,
      leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.chevron_left,
            color: AppColors.commonColor,
            size: 40,
          )),
      bodyData: bodyData(context),
    );
  }

  Widget bodyData(BuildContext context) {
    return GetBuilder<AssessmentController>(
      init: AssessmentController(),
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
                  _.assessmentlist.isNotEmpty
                      ? Expanded(
                          child: ListView.separated(
                            shrinkWrap: true,
                            separatorBuilder: (context, index) =>
                                Container(height: 25, color: Colors.white),
                            itemCount: _.assessmentlist.length,
                            itemBuilder: (context, index) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 25),
                                child: InkWell(
                                  onTap: () {
                                    Get.toNamed(Routes.createfoldercreenRoutes);
                                  },
                                  child: ListTile(
                                    title: Text(
                                      '${_.assessmentlist[index]['title']}',
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.black),
                                    ),
                                    subtitle: SizedBox(
                                      width: Get.width * 0.8,
                                      child: Text(
                                        '${_.assessmentlist[index]['subtitle']}',
                                        style: TextStyle(
                                          color: AppColors.grey600,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ).marginOnly(top: 10),
                                  ),
                                )),
                          ),
                        )
                      : Column(
                          children: [
                            Lottie.asset(AppImage.click)
                                .marginOnly(top: 70, bottom: 30),
                            const Text(
                              "No Data Available",
                              style: TextStyle(
                                color: AppColors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                ],
              );
      },
    );
  }
}
