import 'package:care_navigation/utils/app_libraries.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  
    Scaffold(
      appBar: AppBar(backgroundColor: AppColors.blue100,
      elevation: 0.0,
          // The search area here
          title: Container(
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5)),
        child: const Center(
          child: TextField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                // suffixIcon: IconButton(
                //   icon: const Icon(Icons.clear),
                //   onPressed: () {
                //   Get.back();
                //   },
                // ),
                hintText: 'Search...',
                border: InputBorder.none),
          ),
        ),
      )),
    );
  }
}