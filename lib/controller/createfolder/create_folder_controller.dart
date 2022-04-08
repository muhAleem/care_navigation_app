import 'package:care_navigation/utils/app_libraries.dart';

class CreateFolderController extends GetxController{
  bool isLoading=false;
  final folder = FirebaseFirestore.instance.collection("Folder");
  List folderlist = [];

  @override
  void onReady() {
    getFolder();
    isLoading = false;
    update();
    super.onReady();
  }

  Future<void> getFolder() async {
    Stream<QuerySnapshot> streambodytarget =
        folder.orderBy("createdAt", descending: true).snapshots();
    await streambodytarget.forEach((e) {
      folderlist.clear();
      for (var value in e.docs) {
        print(value.data());
        folderlist.add(value.data());
      }
      update();
    }).catchError((e) {
      print(e);
    });
  }

}