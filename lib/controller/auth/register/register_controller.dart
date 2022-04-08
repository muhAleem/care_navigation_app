import 'package:care_navigation/utils/app_libraries.dart';

class RegisterController extends GetxController {
  bool isLoading = false;
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  final GlobalKey<FormState> formk = GlobalKey<FormState>();
  bool obscurePassword = true;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  bool obscureConfirmPassword = true;
  void changeConfirmObscurePassword() {
    obscureConfirmPassword = !obscureConfirmPassword;
    update();
  }

  void changeObscurePassword() {
    obscurePassword = !obscurePassword;
    update();
  }

  Future<void> signupfunction() async {
    if (password.text == confirmpassword.text) {
      try {
        isLoading = true;
        update();
        await firebaseAuth
            .createUserWithEmailAndPassword(
                email: email.text, password: password.text)
            .then((result) async {
          var user = result.user!;
          await user.sendEmailVerification();
          await FirebaseFirestore.instance.collection("Users").doc().set({
            "id": result.user!.uid,
            "email": email.text,
            "userpic": "",
            "username": username.text,
            "phone": phone.text
          });
        }).then((value) async {
          isLoading = false;
          update();
          Get.back();
          Get.snackbar(
            'Success',
            'Please check your E-mail for verification',
            backgroundColor: AppColors.transparentColor,
          );
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
    } else {
      Get.snackbar('Error', 'Confirm password does not matched',
          backgroundColor: AppColors.red);
    }
  }

  bool validateUser() {
    final form = formk.currentState;
    form!.save();
    if (form.validate()) {
      return true;
    } else {
      return false;
    }
  }
}
