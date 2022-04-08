import 'package:care_navigation/utils/app_libraries.dart';
import 'package:care_navigation/view/auth/login/login_screen.dart';


import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final firebaseUser = FirebaseAuth.instance.currentUser.obs;
  
  @override
  void onInit() {
    super.onInit();
  }

  // CHECKING DUPLICATE EMAIL
  Future<List<String>> checkDuplicateEmail(String email) async {
    try {
      return await _auth.fetchSignInMethodsForEmail(email);
    } on FirebaseAuthException catch (e) {
      rethrow;
    }
  }

  void changePassword(String currentPassword, String newPassword) async {
    final cred = EmailAuthProvider.credential(
        email: _auth.currentUser!.email!, password: currentPassword);

    _auth.currentUser!.reauthenticateWithCredential(cred).then((value) {
      _auth.currentUser!.updatePassword(newPassword).then((_) {
        logoutfun();

        Get.snackbar('Success', 'Password Updated Successfully');
      }).catchError((error) {
        Get.snackbar('WARNING', 'Something went wrong');
      });
    }).catchError((err) {
      // LoggingService().warning('Re authentication Exception', err.toString());
      // CustomAlertDialog.showAlertDialog(
      //     title: 'warning',
      //     message: 'errorOccurred',
      //     backgroundColor: Colors.white);
      Get.snackbar('Error', 'Please Enter correct old password');
    });
  }

  void saveUserState(String uid) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('uid', uid);
  }

  Future getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('uid');
  }

  Future<void> logoutfun() async {
    // await LoggingService().firebaseLogEvent(FirebaseLoggingServiceRecord(
    //     logId: LoggingConstant.userLoggedOutFromSystem));
    await FirebaseAuth.instance.signOut().then((value) async {
      
      Get.offAll(() => const LoginScreen());
    });
  }
}
