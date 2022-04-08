import 'dart:collection';

import 'package:get/get.dart';

class DashboardController extends GetxController {

  int currentindex=0;
  ListQueue<int> navigationQueue =ListQueue();


  @override
  void onInit() {
    print('Dashboard Arrgument is ${Get.arguments}');
   
  }

  @override
  void onReady() {

    super.onReady();
  }


  void changeTabIndex(int index) {
    currentindex = index;

    if(index == currentindex){
      navigationQueue.clear();
      // navigationQueue.removeWhere((element) => element == index);
      navigationQueue.addLast(index);
      currentindex = index;
      update();
      print('Current Index is $currentindex');
    }
    update();
    checkdata();
  }

  void checkdata(){
    navigationQueue.forEach((element) {
      print('Add Data in Queue $element');
    });
  }

}
