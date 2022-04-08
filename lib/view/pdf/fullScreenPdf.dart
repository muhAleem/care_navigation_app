import 'package:care_navigation/constants/app_colors.dart';
import 'package:care_navigation/constants/app_text.dart';
import 'package:care_navigation/widgets/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class FullScreenView extends StatelessWidget {
  final String? name;

  const FullScreenView({Key? key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      showAppBar: true,
      appbarcolor: AppColors.white,
      automaticallyImplyLeading: true,
      appbarTitle: AppText.viewfullpdf,
      leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.chevron_left,
            color: AppColors.black,
            size: 40,
          )),
      bodyData: SizedBox(
        height: Get.height,
        width: Get.width,
        child: SfPdfViewer.network(
          name!,
        ),
      ),
    );
  }
}
