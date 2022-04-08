import 'package:care_navigation/utils/app_libraries.dart';


class NoticeBoardController extends GetxController {
  bool isLoading = false;
  TextEditingController comment = TextEditingController();

  final notice = FirebaseFirestore.instance.collection("Notice");
  final comments = FirebaseFirestore.instance.collection("Comment");
  final user = FirebaseFirestore.instance.collection("Users");
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController pic = TextEditingController();
  List noticelist = [];
  
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  void onReady() async{
    await getNotices();
    await getDataFromFirebase();

    isLoading = false;
    update();
    super.onReady();
  }

  Future<void> getDataFromFirebase() async {
    var document = await FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    username.text = document["username"]!.toString();
    email.text = document["email"]!.toString();
    pic.text = document["userpic"]!.toString();
    phone.text = document["phone"]!.toString();
    email.text = FirebaseAuth.instance.currentUser!.email.toString();

    update();
  }

  Future<void> getNotices() async {
    Stream<QuerySnapshot> streambodytarget =
        notice.orderBy("createdAt", descending: true).snapshots();
    await streambodytarget.forEach((e) {
      noticelist.clear();
      for (var value in e.docs) {
        print(value.data());
        noticelist.add(value.data());
      }
      update();
    }).catchError((e) {
      print(e);
    });
  }

  Future<void> addData() async {
    isLoading = true;
    update();
    try {
      var data = comments.doc();
      User? user = auth.currentUser;
      var docSnap = await data.get();

      data.set({
        'id': docSnap.reference.id,
        'userid': user!.uid,
        'username': username.text,
        'comment': comment.text,
        'imageurl': pic.text,
        'email': email.text,
        'phone': phone.text,
        'createdAt': DateTime.now(),
      }).then((value) {
        isLoading = false;
        update();
        print ("the current user is ${FirebaseAuth.instance.currentUser!.email}");
        Get.snackbar(
          'Success',
          'Comment added successfully',
        );
        comment.clear();
      });
    } on FirebaseException catch (e) {
      isLoading = false;
      update();
      Get.snackbar(
        'Error',
        e.message.toString(),
      );
    }
  }
}
