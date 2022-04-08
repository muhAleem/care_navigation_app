import 'package:care_navigation/constants/app_assets.dart';
import 'package:care_navigation/controller/announcement/announcement_controller.dart';
import 'package:care_navigation/utils/app_libraries.dart';

class AnnouncementScree extends StatelessWidget {
  const AnnouncementScree({Key? key}) : super(key: key);

  Widget bodyData(BuildContext context) {
    return GetBuilder<AnnouncementController>(
      init: AnnouncementController(),
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
            : Column(
                children: [
                  _.announcementlist.isNotEmpty
                      ? Expanded(
                          child: ListView.separated(
                            shrinkWrap: true,
                            separatorBuilder: (context, index) =>
                                Container(height: 25, color: Colors.white),
                            itemCount: _.announcementlist.length,
                            itemBuilder: (context, index) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              child: SizedBox(
                                child: Row(
                                  children: [
                                    const CircleAvatar(
                                      maxRadius: 20,
                                      backgroundColor: Color(0xffC2AA52),
                                      child: Icon(
                                        Icons.notifications_outlined,
                                        color: AppColors.white,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    SizedBox(
                                      width: Get.width * 0.65,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${_.announcementlist[index]['name']}',
                                            maxLines: 40,
                                            style: TextStyle(
                                                color: AppColors.grey600,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
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
              ).marginOnly(bottom: 10, top: 20);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      showAppBar: true,
      appbarcolor: AppColors.white,
      automaticallyImplyLeading: true,
      // actions: [
      //   IconButton(
      //       onPressed: () {
      //         Get.toNamed(Routes.policyscreenRoutes);
      //       },
      //       icon: const Icon(
      //         Icons.notifications_outlined,
      //         color: AppColors.black,
      //         size: 30,
      //       ))
      // ],
      appbarTitle: AppText.announcement,
      leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.chevron_left,
            color: AppColors.black,
            size: 40,
          )),
      bodyData: bodyData(context),
    );
  }
}
