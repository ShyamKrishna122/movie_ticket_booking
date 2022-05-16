import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_booking_app/user_authentication/meta/utils/utils.dart';
import 'package:movie_booking_app/user_authentication/meta/widget/primary_button.dart';
import 'package:provider/provider.dart';

import '../../../app/shared/constants.dart';
import '../../../core/notifiers/user_notifier.dart';
import '../home_view.dart';

class RequestOTPView extends StatefulWidget {
  const RequestOTPView({
    Key? key,
    required this.verificationId,
    required this.phoneNumber,
  }) : super(key: key);

  final String verificationId;
  final String phoneNumber;

  @override
  State<RequestOTPView> createState() => _RequestOTPViewState();
}

class _RequestOTPViewState extends State<RequestOTPView> {
  FocusNode? pin2FocusNode;
  FocusNode? pin3FocusNode;
  FocusNode? pin4FocusNode;
  FocusNode? pin5FocusNode;
  FocusNode? pin6FocusNode;

  String otp = "";

  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
    pin5FocusNode = FocusNode();
    pin6FocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pin2FocusNode!.dispose();
    pin3FocusNode!.dispose();
    pin4FocusNode!.dispose();
    pin5FocusNode!.dispose();
    pin6FocusNode!.dispose();
  }

  void nextField(String value, FocusNode? focusNode) {
    if (value.length == 1) {
      otp += value;
      focusNode!.requestFocus();
    }
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: kcanvasColor,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          'OTP',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: kdefaultPadding * 5,
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(
              top: kdefaultPadding + 10,
            ),
            child: const Text(
              "Verification Code",
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
            alignment: Alignment.center,
            child: const Text(
              "We have sent the code verification to",
              style: TextStyle(
                color: kprimaryColor,
                fontSize: 16,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: const Text(
              "your mobile number",
              style: TextStyle(
                color: kprimaryColor,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(
            height: kdefaultPadding - 10,
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(
              top: kdefaultPadding + 10,
            ),
            child: Text(
              widget.phoneNumber,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(
            height: kdefaultPadding,
          ),
          buildTimer(context),
          SizedBox(
            height: size.height * 0.10,
          ),
          Form(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 50,
                  child: TextFormField(
                    autofocus: true,
                    obscureText: true,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 15,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          15,
                        ),
                        borderSide: const BorderSide(
                          color: kprimaryColor,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          15,
                        ),
                        borderSide: const BorderSide(
                          color: kprimaryColor,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          15,
                        ),
                        borderSide: const BorderSide(
                          color: kprimaryColor,
                        ),
                      ),
                    ),
                    onChanged: (value) {
                      nextField(value, pin2FocusNode);
                    },
                  ),
                ),
                SizedBox(
                  width: 50,
                  child: TextFormField(
                    focusNode: pin2FocusNode,
                    obscureText: true,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 15,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          15,
                        ),
                        borderSide: const BorderSide(
                          color: kprimaryColor,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          15,
                        ),
                        borderSide: const BorderSide(
                          color: kprimaryColor,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          15,
                        ),
                        borderSide: const BorderSide(
                          color: kprimaryColor,
                        ),
                      ),
                    ),
                    onChanged: (value) => nextField(value, pin3FocusNode),
                  ),
                ),
                SizedBox(
                  width: 50,
                  child: TextFormField(
                    focusNode: pin3FocusNode,
                    obscureText: true,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 15,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          15,
                        ),
                        borderSide: const BorderSide(
                          color: kprimaryColor,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          15,
                        ),
                        borderSide: const BorderSide(
                          color: kprimaryColor,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          15,
                        ),
                        borderSide: const BorderSide(
                          color: kprimaryColor,
                        ),
                      ),
                    ),
                    onChanged: (value) => nextField(value, pin4FocusNode),
                  ),
                ),
                SizedBox(
                  width: 50,
                  child: TextFormField(
                    focusNode: pin4FocusNode,
                    obscureText: true,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 15,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          15,
                        ),
                        borderSide: const BorderSide(
                          color: kprimaryColor,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          15,
                        ),
                        borderSide: const BorderSide(
                          color: kprimaryColor,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          15,
                        ),
                        borderSide: const BorderSide(
                          color: kprimaryColor,
                        ),
                      ),
                    ),
                    onChanged: (value) {
                      nextField(value, pin5FocusNode);
                    },
                  ),
                ),
                SizedBox(
                  width: 50,
                  child: TextFormField(
                    focusNode: pin5FocusNode,
                    obscureText: true,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 15,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          15,
                        ),
                        borderSide: const BorderSide(
                          color: kprimaryColor,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          15,
                        ),
                        borderSide: const BorderSide(
                          color: kprimaryColor,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          15,
                        ),
                        borderSide: const BorderSide(
                          color: kprimaryColor,
                        ),
                      ),
                    ),
                    onChanged: (value) {
                      nextField(value, pin6FocusNode);
                    },
                  ),
                ),
                SizedBox(
                  width: 50,
                  child: TextFormField(
                    focusNode: pin6FocusNode,
                    obscureText: true,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 15,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          15,
                        ),
                        borderSide: const BorderSide(
                          color: kprimaryColor,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          15,
                        ),
                        borderSide: const BorderSide(
                          color: kprimaryColor,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          15,
                        ),
                        borderSide: const BorderSide(
                          color: kprimaryColor,
                        ),
                      ),
                    ),
                    onChanged: (value) {
                      if (value.length == 1) {
                        otp += value;
                        pin6FocusNode!.unfocus();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Container(
            margin: const EdgeInsets.only(
              left: kdefaultPadding + 10,
              right: kdefaultPadding + 10,
              bottom: kdefaultPadding + 15,
            ),
            child: PrimaryButton(
              text: 'Submit',
              press: () {
                if (otp.length == 6) {
                  signInWithPhoneNumber();
                } else if (otp.length < 6) {
                  Utils.snackBar(
                    message: "Enter complete otp",
                    context: context,
                  );
                }
              },
              color: kprimaryColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTimer(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween(begin: 30.0, end: 0.0),
      duration: const Duration(seconds: 30),
      builder: (_, dynamic value, child) => value.toInt() != 0
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "This code will expire in ",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  value.toInt() < 10
                      ? "00:0${value.toInt()}"
                      : "00:${value.toInt()}",
                  style: const TextStyle(color: kprimaryColor),
                ),
              ],
            )
          : Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {},
                child: const Text(
                  "Resend code",
                  style: TextStyle(
                    color: kprimaryColor,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
    );
  }

  void signInWithPhoneNumber() async {
    bool error = false;
    User? user;
    AuthCredential credential;
    try {
      credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationId,
        smsCode: otp,
      );
      user = (await _auth.signInWithCredential(credential)).user!;
    } catch (e) {
      Utils.snackBar(
        message: "Failed to sign in: " + e.toString(),
        context: context,
      );

      error = true;
    }
    if (!error && user != null) {
      Provider.of<UserNotifier>(context, listen: false).setUserData(
        user: user,
      );
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) {
            return const HomeView();
          },
        ),
      );
    }
  }
}
