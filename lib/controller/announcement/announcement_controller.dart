import 'package:care_navigation/utils/app_libraries.dart';

class AnnouncementController extends GetxController{
  bool isLoading=false;
  final announcement = FirebaseFirestore.instance.collection("Announcement");
  List announcementlist = [];

  @override
  void onReady() {
    getAnnouncement();
    isLoading = false;
    update();
    super.onReady();
  }

  Future<void> getAnnouncement() async {
    Stream<QuerySnapshot> streambodytarget =
        announcement.orderBy("createdAt", descending: true).snapshots();
    await streambodytarget.forEach((e) {
      announcementlist.clear();
      for (var value in e.docs) {
        print(value.data());
        announcementlist.add(value.data());
      }
      update();
    }).catchError((e) {
      print(e);
    });
  }
}