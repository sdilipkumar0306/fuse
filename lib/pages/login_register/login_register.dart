import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fuse/util/common_utils.dart';
import 'package:fuse/util/ui/clock/my_clock.dart';
import 'package:fuse/util/ui/images_ui.dart';
import 'package:fuse/util/ui/service_constants.dart';
import 'package:fuse/util/ui/ui_constants.dart';
import 'package:fuse/util/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginRegisterUI extends StatefulWidget {
  const LoginRegisterUI({Key? key}) : super(key: key);

  @override
  _LoginRegisterUIState createState() => _LoginRegisterUIState();
}

class _LoginRegisterUIState extends State<LoginRegisterUI> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(duration: const Duration(seconds: 2), vsync: this)..repeat(reverse: true);
  late final Animation<Offset> _offsetAnimation =
      Tween<Offset>(begin: Offset.zero, end: const Offset(0, 0.05)).animate(CurvedAnimation(parent: _controller, curve: Curves.ease));

  bool showText = false;
  bool isSignIn = true;
  bool isButtonClicked = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  Size size = const Size(0, 0);
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {
          CommonService.closeKeyboard(context);
        },
        child: Container(
            width: size.width,
            height: size.height,
            decoration: const BoxDecoration(image: DecorationImage(alignment: Alignment.topCenter, image: AssetImage("assets/images/background.png"))),
            child: Stack(
              children: [
                Positioned(
                  left: size.width * 0.05,
                  top: -20,
                  child: SlideTransition(
                    position: _offsetAnimation,
                    child: const Padding(padding: EdgeInsets.all(8.0), child: MyImages(image: "assets/images/light-1.png")),
                  ),
                ),
                Positioned(
                  left: size.width * 0.35,
                  top: -20,
                  child: SlideTransition(
                    position: _offsetAnimation,
                    child: const Padding(padding: EdgeInsets.all(8.0), child: MyImages(image: "assets/images/light-2.png")),
                  ),
                ),
                Positioned(
                    right: size.width * 0.05,
                    top: 35,
                    child: Column(
                      children: [
                        AnalogClock(
                            datetime: DateTime.now(),
                            height: 120,
                            width: 120,
                            isLive: true,
                            decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                            showAllNumbers: true,
                            showDigitalClock: true),
                        verticalSpace(5),
                        Text(
                          UiConstants.appName,
                          style: GoogleFonts.cevicheOne(color: Colors.white, fontSize: 45),
                        )
                      ],
                    )),
                Positioned(bottom: 0, child: loginWidget()),
              ],
            )),
      ),
    ));
  }

  Widget loginWidget() {
    return SizedBox(
      width: size.width,
      height: size.height,
      child: SingleChildScrollView(
        reverse: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom / 1.8),
              child: Column(children: [
                if (!isSignIn)
                  SizedBox(
                    width: 300,
                    child: MyTextField(
                      controller: nameController,
                      textFieldColor: UiConstants.mainPageColor,
                      textColor: Colors.white,
                      prefixIcon: const Icon(Icons.person, color: Colors.white),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(35), borderSide: const BorderSide(color: Colors.transparent)),
                      // focusBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(35)),
                      hintText: "Enter Name...",
                    ),
                  ),
                verticalSpace(10),
                SizedBox(
                  width: 300,
                  child: MyTextField(
                    controller: emailController,
                    textFieldColor: UiConstants.mainPageColor,
                    textColor: Colors.white,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(35), borderSide: const BorderSide(color: Colors.transparent)),
                    // focusBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(35)),
                    prefixIcon: const Icon(Icons.email, color: Colors.white),
                    hintText: "Enter Email...",
                  ),
                ),
                verticalSpace(isSignIn ? 20 : 10),
                SizedBox(
                  width: 300,
                  child: MyTextField(
                    controller: passwordController,
                    textFieldColor: UiConstants.mainPageColor,
                    textColor: Colors.white,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(35), borderSide: const BorderSide(color: Colors.transparent)),
                    // focusBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(35)),
                    prefixIcon: const Icon(Icons.security_rounded, color: Colors.white),
                    suffixIcon: IconButton(
                        onPressed: () {
                          showText = !showText;
                          notMounted(mounted, setState);
                        },
                        icon: Icon(showText ? Icons.visibility : Icons.visibility_off, color: Colors.white)),
                    hintText: "Enter password...",
                    showtext: showText,
                  ),
                ),
              ]),
            ),
            verticalSpace(15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    (isSignIn) ? "LogIn" : "SignUp",
                    style: GoogleFonts.cevicheOne(color: Colors.black, fontSize: 40),
                  ),
                  horizontalSpace(15),
                  isButtonClicked
                      ? Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(shape: BoxShape.circle, color: UiConstants.mainPageColor),
                          padding: const EdgeInsets.all(3),
                          child: const CircularProgressIndicator(color: Colors.white))
                      : Container(
                          decoration: BoxDecoration(shape: BoxShape.circle, color: UiConstants.mainPageColor),
                          child: IconButton(
                              splashRadius: 10,
                              onPressed: () {
                                isButtonClicked = true;
                                notMounted(mounted, setState);

                                Timer(const Duration(seconds: 2), () {
                                  isButtonClicked = false;
                                  notMounted(mounted, setState);
                                });
                              },
                              icon: const Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              )))
                ],
              ),
            ),
            verticalSpace(isSignIn ? 10 : 6),
            if (isSignIn)
              Container(
                height: 40,
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.symmetric(horizontal: 40),
                width: size.width,
                child:
                    TextButton(onPressed: () {}, child: MyText("Forget Password!", style: GoogleFonts.marckScript(fontSize: 18, fontWeight: FontWeight.bold))),
              ),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MyText(isSignIn ? "New user?" : "Alredy have a Account.", style: GoogleFonts.rancho(fontSize: 18, fontWeight: FontWeight.bold)),
                    TextButton(
                        onPressed: () {
                          isSignIn = !isSignIn;
                          showText = false;
                          isButtonClicked = false;
                          nameController.clear();
                          emailController.clear();
                          passwordController.clear();
                          notMounted(mounted, setState);
                        },
                        child: MyText(isSignIn ? "SignUp" : "SignIn", style: GoogleFonts.baskervville(fontSize: 18, fontWeight: FontWeight.bold)))
                  ],
                )),
            verticalSpace(isSignIn ? 20 : 10),
          ],
        ),
      ),
    );
  }
}
