import 'package:care_navigation/utils/app_libraries.dart';

class ForgetPasswordController extends GetxController {
  bool isLoading = false;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  void validate() {
    if (formkey.currentState!.validate()) {
      debugPrint("Validated");
    } else {
      debugPrint("object");
    }
  }

  bool validateAndSave() {
    final form = formkey.currentState;
    form!.save();
    if (form.validate()) {
      return true;
    } else {
      return false;
    }
  }
}
