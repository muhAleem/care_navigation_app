

import 'package:care_navigation/utils/app_libraries.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        statusBarColor: AppColors.transparentColor,
        statusBarIconBrightness: Brightness.dark
    ),
  );
  // await initServices();[]
  runApp( const MyApp());
}