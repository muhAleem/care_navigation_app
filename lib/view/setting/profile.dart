import 'package:care_navigation/constants/app_assets.dart';
import 'package:care_navigation/controller/setting/profile_controller.dart';
import 'package:care_navigation/utils/app_libraries.dart';

class UpdateInformationScreen extends StatelessWidget {
  const UpdateInformationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      showAppBar: true,
      appbarcolor: AppColors.white,
      automaticallyImplyLeading: true,
      appbarTitle: "Edit Profile",
      bodyData: bodyData(context),
    );
  }

  Widget bodyData(context) {
    return GetBuilder<UpdateInForamtionController>(
        init: UpdateInForamtionController(),
        builder: (_) {
          return _.isLoading
              ? Center(
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: Center(
                      child: LoadingAnimationWidget.threeArchedCircle(
                          color: AppColors.commonColor, size: 70),
                    ),
                  ),
                )
              : SizedBox(
                  height: Get.height,
                  width: Get.width,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: Get.height / 1.2,
                          width: Get.width,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(50.0),
                              bottomRight: Radius.circular(50.0),
                              topLeft: Radius.circular(50.0),
                              bottomLeft: Radius.circular(50.0),
                            ),
                            color: Colors.white,
                          ),
                          child: SingleChildScrollView(
                            child: Form(
                              key: _.formkey,
                              child: Column(
                                children: [
                                  Image.asset(AppImage.appicon)
                                      .marginOnly(bottom: 30),
                                  _.pic.text == '' || _.pic.text.isEmpty
                                      ? GestureDetector(
                                          onTap: () {
                                            _.uploadImage();
                                          },
                                          child: CircleAvatar(
                                            radius: 60,
                                            backgroundImage: _.imageFile != null
                                                ? FileImage(_.imageFile!)
                                                    as ImageProvider
                                                : const AssetImage(
                                                    "assets/images/avatar.jpg"),
                                          ).marginOnly(top: 10.0),
                                        )
                                      : GestureDetector(
                                          onTap: () {
                                            _.uploadImage();
                                          },
                                          child: CircleAvatar(
                                            radius: 60,
                                            backgroundImage: _.imageUrl != null
                                                ? NetworkImage(_.imageUrl)
                                                    as ImageProvider
                                                : NetworkImage(_.pic.text),
                                          ).marginOnly(top: 10.0),
                                        ),
                                  CommonTextField(
                                    controller: _.username,
                                    // bordercolor: const Color(0xffD2D2D2),
                                    // fillcolor: const Color(0xffF8F7FB),
                                    isTextHidden: false,
                                    prefixIcon: Icons.account_circle_sharp,
                                    validator: (value) {
                                      return (value!.isEmpty)
                                          ? 'First Name can not be empty'
                                          : null;
                                    },
                                  ).marginOnly(top: 40, right: 25, left: 25),
                                  CommonTextField(
                                    controller: _.phone,
                                    isTextHidden: false,
                                    prefixIcon: Icons.phone,
                                    validator: (value) {
                                      return (value!.isEmpty)
                                          ? 'Phone Number can not be empty'
                                          : null;
                                    },
                                  ).marginOnly(top: 40, right: 25, left: 25),
                                  CommonTextField(
                                    readOnly: true,
                                    controller: _.email,
                                    // bordercolor: Color(0xffD2D2D2),
                                    // fillcolor: Color(0xffF8F7FB),
                                    prefixIcon: Icons.email,
                                    isTextHidden: false,
                                  ).marginOnly(top: 20, right: 25, left: 25),
                                  MaterialButton(
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                                shape:
                                                    const RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(20.0),
                                                  ),
                                                ),
                                                backgroundColor: Colors.white,
                                                content: SizedBox(
                                                  height: 200,
                                                  width: 500,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: const [
                                                          Text(
                                                            'Are you sure?',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 17,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          CircularButtons(
                                                            backgroundColor:
                                                                AppColors
                                                                    .commonColor,
                                                            text: 'Yes',
                                                            height: 50,
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.3,
                                                            textColor:
                                                                Colors.white,
                                                            textStyle:
                                                                const TextStyle(
                                                                    fontSize:
                                                                        14,
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                            onPressed:
                                                                () async {
                                                              {
                                                                if (_
                                                                        .username
                                                                        .text
                                                                        .isEmpty ||
                                                                    _.email.text
                                                                        .isEmpty) {
                                                                  Get.snackbar(
                                                                      "Error",
                                                                      "Fill all fields",
                                                                      backgroundColor:
                                                                          Colors
                                                                              .red);
                                                                } else {
                                                                  await _.updateUsersData(
                                                                      _.docId);
                                                                }
                                                              }

                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            borderColor:
                                                                AppColors
                                                                    .commonColor,
                                                          ),
                                                          CircularButtons(
                                                            backgroundColor:
                                                                Colors.grey,
                                                            text: 'No',
                                                            height: 50,
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.3,
                                                            textColor:
                                                                Colors.white,
                                                            textStyle:
                                                                const TextStyle(
                                                                    fontSize:
                                                                        14,
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            borderColor:
                                                                Colors.grey,
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ));
                                          });
                                      // _.updateUsersData();
                                    },
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0))),
                                    elevation: 5.0,
                                    minWidth: 230,
                                    height: 55,
                                    color: AppColors.commonColor,
                                    child: const Text('SAVE',
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white)),
                                  ).marginOnly(
                                      top: 40, right: 52, left: 52, bottom: 52),
                                ],
                              ),
                            ),
                          ),
                        ).marginOnly(
                          top: 30,
                          right: 20,
                          left: 20,
                        ),
                      ],
                    ),
                  ),
                );
        });
  }
}
