import 'package:care_navigation/constants/app_assets.dart';

import 'package:care_navigation/controller/pdf/view_pdf.dart';
import 'package:care_navigation/utils/app_libraries.dart';
import 'package:care_navigation/view/pdf/fullScreenPdf.dart';

import '../../constants/app_assets.dart';

class ViewPdfScreen extends StatelessWidget {
  const ViewPdfScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      showAppBar: true,
      appbarcolor: AppColors.white,
      automaticallyImplyLeading: true,
      appbarTitle: AppText.viewpdf,
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
    return GetBuilder<ViewPdfController>(
      init: ViewPdfController(),
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
                  Expanded(
                    child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 4 / 4,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20,
                                crossAxisCount: 3),
                        itemCount: _.pdfist.length,
                        itemBuilder: (BuildContext ctx, index) {
                          return Column(
                            children: [
                              Container(
                                height: 80,
                                width: 80,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Color(0xffF7F8FC),
                                ),
                                child: InkWell(
                                    onTap: () {
                                      Get.to(() => FullScreenView(name: _.pdfist[index]['imagePath'],));
                                    
                                    },
                                    child: Image.asset(AppImage.pdf)),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                '${_.pdfist[index]['pdftitle']}',
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                              )
                            ],
                          );
                        }),
                  ),
                ],
              );
      },
    );
  }
}
