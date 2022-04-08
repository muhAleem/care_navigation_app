import 'package:care_navigation/constants/app_assets.dart';
import 'package:care_navigation/controller/createfolder/create_folder_controller.dart';
import 'package:care_navigation/utils/app_libraries.dart';
import 'package:care_navigation/view/pdf/view_pdf_screen.dart';
import 'package:care_navigation/widgets/search_bar.dart';

class CreateFolderScreen extends StatelessWidget {
  const CreateFolderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      showAppBar: true,
      appbarcolor: AppColors.white,
      automaticallyImplyLeading: true,
      appbarTitle: AppText.viewfolder,
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

  Widget bodyData(BuildContext context) {
    return GetBuilder<CreateFolderController>(
      init: CreateFolderController(),
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
            : _.folderlist.isNotEmpty
                ? Column(
                    children: [
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.end,
                      //   children: [
                      //     Image.asset(AppImage.view),
                      //     const SizedBox(
                      //       width: 10,
                      //     ),
                      //     Image.asset(AppImage.gridview),
                      //     const SizedBox(
                      //       width: 10,
                      //     ),
                      //     Image.asset(AppImage.addfolder),
                      //   ],
                      // ).marginOnly(top: 30, bottom: 50, right: 30),
                      const Text(
                        'Folder List',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ).marginSymmetric(vertical: 30),

                      Expanded(
                        child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: 4 / 4,
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 20,
                                    crossAxisCount: 3),
                            itemCount: _.folderlist.length,
                            itemBuilder: (BuildContext ctx, index) {
                              return Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Get.to(() => const ViewPdfScreen(),
                                          arguments: _.folderlist[index]['id']);
                                    },
                                    child: Container(
                                      height: 80,
                                      width: 80,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        color: Color(0xffF7F8FC),
                                      ),
                                      child: Image.asset(AppImage.folder),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '${_.folderlist[index]['name']}',
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              );
                            }),
                      ),
                    ],
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
                  );
      },
    );
  }
}
