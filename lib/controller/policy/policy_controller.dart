import 'package:care_navigation/utils/app_libraries.dart';

class PolicyController extends GetxController{
  bool isLoading=false;
  List policylist = [];
   final policy = FirebaseFirestore.instance.collection("Policy");

  @override
  void onReady() {
    getPolicy();
    isLoading = false;
    update();
    super.onReady();
  }

  Future<void> getPolicy() async {
    Stream<QuerySnapshot> streambodytarget =
        policy.orderBy("createdAt", descending: true).snapshots();
    await streambodytarget.forEach((e) {
      policylist.clear();
      for (var value in e.docs) {
        print(value.data());
        policylist.add(value.data());
      }
      update();
    }).catchError((e) {
      print(e);
    });
  }
}