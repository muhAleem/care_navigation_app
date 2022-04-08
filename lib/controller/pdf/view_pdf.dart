import 'dart:async';
import 'package:care_navigation/utils/app_libraries.dart';

class ViewPdfController extends GetxController {
  bool isLoading = true;
  final pdf = FirebaseFirestore.instance.collection("PdfData");
  List pdfist = [];
  int? pages = 0;
  

  String imagePath = '';

  @override
  Future<void> onInit() async {
    if (Get.arguments != null) {
      await getImage(Get.arguments);
    }
    super.onInit();
  }

  @override
  void onReady() {
    isLoading = false;
    update();
    super.onReady();
  }

  Future<void> getImage(String docId) async {
    pdfist.clear();
    var data = await pdf.where('titleId', isEqualTo: docId).get();
    for (var element in data.docs) {
      imagePath = element.get('imagePath');
      pdfist.add(element.data());
      print('The data is ${element.data()}');
    }
    update();
  }
}
