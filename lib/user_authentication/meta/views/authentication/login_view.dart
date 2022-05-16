import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movie_booking_app/user_authentication/app/routes/app.routes.dart';
import 'package:movie_booking_app/user_authentication/app/shared/constants.dart';
import 'package:movie_booking_app/user_authentication/meta/widget/social_auth_widget.dart';

import '../../widget/email_widget.dart';
import '../../widget/phone_number_widget.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool isEmail = true;
  TextEditingController phoneNumberController = TextEditingController();

  @override
  void dispose() {
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(
                top: kdefaultPadding + 10,
                left: kdefaultPadding,
              ),
              child: const Text(
                "Login Account",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(
              height: kdefaultPadding - 10,
            ),
            Container(
              margin: const EdgeInsets.only(
                left: kdefaultPadding,
              ),
              child: const Text(
                "Hello, welcome back to your account",
                style: TextStyle(
                  color: kprimaryColor,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(
              height: kdefaultPadding + 10,
            ),
            Container(
              width: size.width,
              height: size.height * 0.06,
              margin: const EdgeInsets.only(
                left: kdefaultPadding + 5,
                right: kdefaultPadding + 5,
                bottom: kdefaultPadding + 10,
              ),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    kdefaultPadding,
                  ),
                ),
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      if (!isEmail) {
                        setState(() {
                          isEmail = true;
                        });
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.only(
                        left: 10,
                      ),
                      alignment: Alignment.center,
                      width: size.width / 2 - 40,
                      child: isEmail == true
                          ? Card(
                              elevation: 10,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    15,
                                  ),
                                ),
                              ),
                              margin: const EdgeInsets.only(
                                top: 5,
                                bottom: 5,
                              ),
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.5),
                              child: const Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Email",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            )
                          : const Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Email",
                                style: TextStyle(
                                  color: kprimaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () {
                      if (isEmail) {
                        setState(
                          () {
                            isEmail = false;
                          },
                        );
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.only(
                        right: 10,
                      ),
                      width: size.width / 2 - 40,
                      alignment: Alignment.center,
                      child: isEmail == false
                          ? Card(
                              elevation: 10,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    15,
                                  ),
                                ),
                              ),
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.5),
                              margin: const EdgeInsets.only(
                                top: 5,
                                bottom: 5,
                              ),
                              child: const Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Phone Number",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            )
                          : const Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Phone Number",
                                style: TextStyle(
                                  color: kprimaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),
            if (isEmail == true) const EmailWidget(),
            if (isEmail == false) const PhoneNumberWidget(),
            const SizedBox(
              height: kdefaultPadding * 3 + 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    left: kdefaultPadding,
                  ),
                  height: 3,
                  width: 100,
                  color: Colors.white60,
                ),
                const Text(
                  'or sign in with',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    right: kdefaultPadding,
                  ),
                  height: 3,
                  color: Colors.white60,
                  width: 100,
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const SocialAuthWidget(),
            const Spacer(),
            Container(
              margin: const EdgeInsets.only(
                bottom: kdefaultPadding,
              ),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not registered yet?',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  InkWell(
                    key: ValueKey("Create"),
                    onTap: () {
                      Navigator.of(context).pushReplacementNamed(signUpRoute);
                    },
                    child: Text(
                      ' Sign Up',
                      style: const TextStyle(
                        color: kprimaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onTap() {
    Navigator.of(context).pushReplacementNamed(signUpRoute);
  }
}
