import 'dart:io';

import 'package:care_navigation/utils/app_libraries.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class UpdateInForamtionController extends GetxController {
  bool isLoading = false;
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController pic = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  String pictureController3 = "";
  String picture = '';
  String firstName = '';
  String lastName = '';
  String mail = '';
  XFile? xFile;
  final ImagePicker picker = ImagePicker();
  PickedFile? pickedFile;
  File? imageFile;
  final clientprofiledb = FirebaseFirestore.instance.collection("Users");
  String imageUrl = "";
  String docId = "";

  @override
  void onReady() {
    getDataFromFirebase();
    super.onReady();
  }

  bool validateAndSaveUser() {
    final form = formkey.currentState;
    form!.save();
    if (form.validate()) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> getDataFromFirebase() async {
    var userdata = await FirebaseFirestore.instance
        .collection('Users')
        .where('id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    for (var element in userdata.docs) {
      print('Image Data ${element.get('userpic')}');
      docId = element.reference.id;
      email.text = element.get('email');
      phone.text = element.get('phone');
      username.text = element.get('username');
      imageUrl = element.get('userpic').toString() == 'null'
          ? ""
          : element.get('userpic');
    }
    update();
  }

  Future updateUsersData(String docId) async {
    try {
      if (imageFile != null) {
        String fileName = DateTime.now().microsecondsSinceEpoch.toString();
        Reference reference =
            FirebaseStorage.instance.ref().child("/images").child(fileName);
        UploadTask uploadTask = reference.putFile(imageFile!);
        try {
          TaskSnapshot snapshot = await uploadTask;
          imageUrl = await snapshot.ref.getDownloadURL();
          if (imageUrl != "") {
            await FirebaseFirestore.instance
                .collection("Users")
                .doc(docId)
                .update({
              "username": username.text,
              "userpic": imageUrl,
              "email": email.text,
              "phone": phone.text
            }).then((value) {
              Get.snackbar("Success", "Information Updated Successfully",
                  backgroundColor: Colors.green);
            });
          }
        } catch (e) {
          print("Image Error ${e.toString()}");
          Get.snackbar('error', e.toString());
        }
      } else {
        FirebaseFirestore.instance.collection("Users").doc(docId).update({
          "username": username.text,
          "email": email.text,
          "phone": phone.text,
        }).then((value) {
          // Get.back();
          Get.snackbar("Success", "Information Updated Successfully",
              backgroundColor: Colors.green);
        });
      }
      update();
    } catch (e) {
      Get.snackbar('error', e.toString());
    }
  }

  uploadImage() async {
    final pickFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickFile != null) {
      imageFile = File(pickFile.path);
      update();
      // await sendImage();
    }
  }
}
