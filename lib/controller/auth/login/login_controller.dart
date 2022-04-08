import 'package:care_navigation/utils/app_libraries.dart';
import 'package:care_navigation/view/home/dashboard_screen.dart';

import 'package:shared_preferences/shared_preferences.dart';

class LoginScreenController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  static final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final firestoreInstance = FirebaseFirestore.instance.collection('Users');

  SharedPreferences? prefs;
  bool isLoading = false;
  bool obscurePassword = true;
  bool rememberMe = false;

  void changeObscurePassword() {
    obscurePassword = !obscurePassword;
    update();
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

  @override
  void onReady() async {
    prefs = await SharedPreferences.getInstance();
    await loginUser();
    update();
    super.onReady();
  }

  Future<void> loginUser() async {
    isLoading = true;
    update();
    try {
      //FIREBASE FUNCTION TO LOGIN
      await firebaseAuth
          .signInWithEmailAndPassword(
              email: email.text, password: password.text)
          .then((result) async {
        var user = firebaseAuth.currentUser;
        if (user!.emailVerified) {
          isLoading = false;
          update();
          Get.to(const Dashboard());
        } else {
          isLoading = false;
          update();
          await user.sendEmailVerification();
          Get.snackbar('Error', 'please verify your email',
              backgroundColor: AppColors.red);
        }
      });
    } on FirebaseAuthException catch (q) {
      isLoading = false;
      update();
      Get.snackbar('Error', q.message.toString(),
          backgroundColor: AppColors.red);
    } on FirebaseException catch (e) {
      isLoading = false;
      update();
      Get.snackbar('Error', e.message.toString(),
          backgroundColor: AppColors.red);
    } catch (w) {
      isLoading = false;
      update();
      Get.snackbar('Error', w.toString(), backgroundColor: AppColors.red);
    }
  }
}
