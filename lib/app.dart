import 'package:care_navigation/utils/app_libraries.dart';
import 'package:care_navigation/view/get_started/get_started.dart';



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: AppText.appName,
        theme: ThemeData(
          primaryColor: Colors.black,
          fontFamily: 'Roboto',
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        defaultTransition: Get.defaultTransition,
        showPerformanceOverlay: false,
        enableLog: true,
        home: const GetStarted());
  }
}
