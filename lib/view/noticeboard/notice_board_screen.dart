import 'package:care_navigation/constants/app_assets.dart';
import 'package:care_navigation/controller/noticeboard/notice_board_controller.dart';
import 'package:care_navigation/utils/app_libraries.dart';

class NoticeBoardScreen extends StatelessWidget {
  const NoticeBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      showAppBar: true,
      appbarcolor: AppColors.white,
      automaticallyImplyLeading: true,
      // actions: [
      //   IconButton(
      //       onPressed: () {},
      //       icon: const Icon(
      //         Icons.notifications_outlined,
      //         color: AppColors.commonColor,
      //         size: 30,
      //       ))
      // ],
      appbarTitle: AppText.noticeboard,
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
    return GetBuilder<NoticeBoardController>(
      init: NoticeBoardController(),
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
            : SingleChildScrollView(
                child: Column(
                  children: [
                    _.noticelist.isNotEmpty
                        ? RawScrollbar(
                            thumbColor: AppColors.commonColor,
                            child: Container(
                              height: Get.height * 0.75,
                              width: Get.width,
                              color: Colors.white,
                              child: ListView.separated(
                                shrinkWrap: false,
                                separatorBuilder: (context, index) => Divider(),
                                itemCount: _.noticelist.length,
                                itemBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: SizedBox(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.65,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${_.noticelist[index]['name']}',
                                                maxLines: 40,
                                                style: TextStyle(
                                                    color: AppColors.grey600,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ).marginOnly(top: 10),
                                  ),
                                ),
                              ),
                            ).marginOnly(top: 20),
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
                    const SizedBox(
                      height: 40,
                    ),
                    _.noticelist.isNotEmpty
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Want to comment? ",
                                style: TextStyle(
                                    color: AppColors.grey,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14),
                              ),
                              InkWell(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                            scrollable: true,
                                            insetPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 20),
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(20.0),
                                              ),
                                            ),
                                            backgroundColor: Colors.white,
                                            content: SizedBox(
                                              height: 400,
                                              width: Get.width,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Image.asset(AppImage.appicon),
                                                  const Text(
                                                    "Add Comment",
                                                    style: TextStyle(
                                                        color: AppColors
                                                            .commonColor,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 18),
                                                  ).marginSymmetric(
                                                      vertical: 15),
                                                  CommonTextField(
                                                    maxLength: 100,
                                                    
                                                    controller: _.comment,
                                                    hintText:
                                                        'Please Type Comments...........',
                                                    isTextHidden: false,
                                                    validator: (value) {},
                                                  ).marginOnly(
                                                      top: 10, bottom: 25),
                                                  CircularButtons(
                                                          text: AppText.submit,
                                                          width: 250,
                                                          height: 50,
                                                          textStyle:
                                                              const TextStyle(
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: AppColors
                                                                      .white),
                                                          onPressed: () {
                                                            if (_.comment.text
                                                                .isNotEmpty) {
                                                              _.addData();
                                                              Get.back();
                                                            } else {
                                                              Get.snackbar(
                                                                  'Error',
                                                                  'First Type Something',
                                                                  backgroundColor:
                                                                      Colors
                                                                          .red);
                                                            }
                                                          },
                                                          backgroundColor:
                                                              AppColors
                                                                  .commonColor,
                                                          textColor:
                                                              AppColors.white,
                                                          borderColor: AppColors
                                                              .commonColor)
                                                      .marginSymmetric(
                                                          vertical: 15),
                                                  CircularButtons(
                                                      text: "Back",
                                                      width: 250,
                                                      height: 50,
                                                      textStyle:
                                                          const TextStyle(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: AppColors
                                                                  .white),
                                                      onPressed: () {
                                                        Get.back();
                                                      },
                                                      backgroundColor:
                                                          AppColors.commonColor,
                                                      textColor:
                                                          AppColors.white,
                                                      borderColor: AppColors
                                                          .commonColor),
                                                ],
                                              ),
                                            ));
                                      });
                                },
                                child: const Text(
                                  "Click here",
                                  style: TextStyle(
                                      color: AppColors.commonColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                              ),
                            ],
                          )
                        : Container(),
                    // CommonTextField(
                    //   controller: _.comment,
                    //   hintText: 'Please Type Comments...........',
                    //   isTextHidden: false,
                    // ).marginOnly(left: 30, right: 30, top: 10, bottom: 25),
                    // CircularButtons(
                    //     text: AppText.submit,
                    //     width: 250,
                    //     height: 50,
                    //     textStyle: const TextStyle(
                    //         fontSize: 18,
                    //         fontWeight: FontWeight.w500,
                    //         color: AppColors.white),
                    //     onPressed: () {
                    //       _.addData();
                    //     },
                    //     backgroundColor: AppColors.commonColor,
                    //     textColor: AppColors.white,
                    //     borderColor: AppColors.commonColor),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    // CircularButtons(
                    //     text: AppText.skip,
                    //     width: 250,
                    //     height: 50,
                    //     textStyle: const TextStyle(
                    //         fontSize: 18,
                    //         fontWeight: FontWeight.w500,
                    //         color: AppColors.white),
                    //     onPressed: () {},
                    //     backgroundColor: const Color(0xffC2AA52),
                    //     textColor: AppColors.white,
                    //     borderColor: const Color(0xffC2AA52)),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              );
      },
    );
  }
}
