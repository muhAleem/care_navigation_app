import 'package:care_navigation/utils/app_libraries.dart';

class AssessmentController extends GetxController {
  bool isLoading = false;
  List assessmentlist = [];
  final assessment = FirebaseFirestore.instance.collection("Assessment");

  @override
  void onReady() {
    getAssessment();
    isLoading = false;
    update();
    super.onReady();
  }

  Future<void> getAssessment() async {
    Stream<QuerySnapshot> streambodytarget =
        assessment.orderBy("createdAt", descending: true).snapshots();
    await streambodytarget.forEach((e) {
      assessmentlist.clear();
      for (var value in e.docs) {
        print(value.data());
        assessmentlist.add(value.data());
      }
      update();
    }).catchError((e) {
      print(e);
    });
  }
}
