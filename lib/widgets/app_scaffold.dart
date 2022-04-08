
import 'package:care_navigation/utils/app_libraries.dart';

class CommonScaffold extends StatelessWidget {
  final Widget? bodyData;
  final bool showFAB;
  final bool showAppBar;
  final bool extendBodyBehindAppBar;
  final double appbarelevation;
  final bool showDrawer;
  final String? appbarTitle;
  final Color? backGroundColors;
  final Color? appbarcolor;
  final Color? backarrow;
  final List<Widget>? actions;
  final Key? scaffoldKey;
  final bool showBottomNav;
  final IconData floatingIcon;
  final bool centerDocked;
  final bool automaticallyImplyLeading;
  final Widget? leading;

  const CommonScaffold({
    Key? key,
    this.bodyData,
    this.automaticallyImplyLeading = true,
    this.backarrow,
    this.appbarelevation = 0.0,
    this.appbarcolor,
    this.appbarTitle,
    this.leading,
    this.actions,
    this.showFAB = false,
    this.showDrawer = false,
    this.showAppBar = false,
    this.extendBodyBehindAppBar = false,
    this.backGroundColors,
    this.scaffoldKey,
    this.showBottomNav = false,
    this.centerDocked = false,
    this.floatingIcon = Icons.add,
  }) : super(key: key);
// Widget myBottomBar() => BottomAppBar(
//         clipBehavior: Clip.antiAlias,
//         child: Container(
//           height:60,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: <Widget>[
//               ReusableIconButton(
//                 icon: Icon(
//                   Icons.home_outlined,
//                   size: 20,
//                   color:
//                       Get.currentRoute
//                       == Routes.homeRoutes
//                       ? AppColors.indigo
//                       :
//                       Colors.grey,
//                 ),
//                 btntxt: Text(
//                   "Home",
//                   style:Get.currentRoute
//                       == Routes.homeRoutes ?
//                    GoogleFonts.mochiyPopOne(color: AppColors.indigo,fontWeight: FontWeight.bold,fontSize: 9) :
//                  GoogleFonts.mochiyPopOne(color: Colors.grey,fontSize: 9,fontWeight: FontWeight.w600)
//                 ),
//                 onPressed: () {
//                   if (Get.currentRoute != Routes.homeRoutes) {
//                     Get.toNamed(Routes.homeRoutes);
//                   }
//                 },
//               ),
//               ReusableIconButton(
//                 icon:  Icon(
//                   Icons.attach_money,
//                   size: 20,
//                   color:
//                       Get.currentRoute
//                       == Routes.rMp1oViPb3EdvcJ5kxoqe52RuaiK6YiUYo
//                       ? AppColors.indigo
//                       :
//                       Colors.grey,
//                 ),
//                 btntxt:  Text(
//                     "Transaction",
//                     textAlign: TextAlign.center,
//                      style:Get.currentRoute
//                       == Routes.rMp1oViPb3EdvcJ5kxoqe52RuaiK6YiUYo ?
//                    GoogleFonts.mochiyPopOne(color: AppColors.indigo,fontWeight: FontWeight.bold,fontSize: 9) :
//                  GoogleFonts.mochiyPopOne(color: Colors.grey,fontSize: 9,fontWeight: FontWeight.w600)
//                 ),
                
//                 onPressed: () {
//                    if (Get.currentRoute != Routes.rMp1oViPb3EdvcJ5kxoqe52RuaiK6YiUYo) {
//                     Get.toNamed(Routes.rMp1oViPb3EdvcJ5kxoqe52RuaiK6YiUYo);
//                   }
//                 },
//               ),
//               ReusableIconButton(
//                 icon:  Icon(
//                   Icons.person_outline,
//                   size: 20,
//                  color:
//                       Get.currentRoute
//                       == Routes.myaccountRoutes
//                       ? AppColors.indigo
//                       :
//                       Colors.grey,
//                 ),
//                 btntxt:  Text(
//                     "Account",
//                      style:Get.currentRoute
//                       == Routes.myaccountRoutes ?
//                    GoogleFonts.mochiyPopOne(color: AppColors.indigo,fontWeight: FontWeight.bold,fontSize: 9) :
//                  GoogleFonts.mochiyPopOne(color: Colors.grey,fontSize: 9,fontWeight: FontWeight.w600)
//                 ),
                
//                 onPressed: () {
//                    if (Get.currentRoute != Routes.myaccountRoutes) {
//                     Get.toNamed(Routes.myaccountRoutes);}
//                 }
//               ),
              
//             ],
//           ),
//         ),
//       );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      key: scaffoldKey,
      appBar: showAppBar
          ? AppBar(
              iconTheme: IconThemeData(
                color: backarrow ?? const Color(0xff1A1B1E),
              ),
              elevation: appbarelevation,
              automaticallyImplyLeading: automaticallyImplyLeading,
              // leading: InkWell(child: Icon(Icons.keyboard_arrow_left),onTap:(){
              //   Get.back(result: true);
              // }),
              leading: leading,
              backgroundColor: appbarcolor,
              title: Text(
                appbarTitle!,
                style: const TextStyle(
                    fontSize: 18.0,
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w500),
              ),
              actions: actions,
              centerTitle: true,
            )
          : null,
      //drawer: showDrawer ? ClipDrawer() : null,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      body: OrientationBuilder(builder: (context, orientation) {
        return Container(
          decoration: BoxDecoration(
            color: backGroundColors ?? const Color(0xffffffff),
          ),
          width: (MediaQuery.of(context).size.width.ceil()).toDouble(),
          height: (MediaQuery.of(context).size.height.ceil()).toDouble(),
          child: bodyData,
        );
      }),
      floatingActionButton: showFAB ? const SizedBox() : null,
      floatingActionButtonLocation: centerDocked
          ? FloatingActionButtonLocation.centerDocked
          : FloatingActionButtonLocation.endFloat,
      //bottomNavigationBar: showBottomNav ? myBottomBar() : null,
    );
  }
}