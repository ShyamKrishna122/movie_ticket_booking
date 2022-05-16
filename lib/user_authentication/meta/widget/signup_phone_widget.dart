import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:movie_booking_app/user_authentication/meta/utils/utils.dart';
import 'package:movie_booking_app/user_authentication/meta/views/authentication/request_otp_view.dart';
import 'package:movie_booking_app/user_authentication/meta/widget/primary_button.dart';

import '../../app/shared/constants.dart';

class SignupPhoneNumberWidget extends StatefulWidget {
  const SignupPhoneNumberWidget({Key? key}) : super(key: key);

  @override
  State<SignupPhoneNumberWidget> createState() =>
      _SignupPhoneNumberWidgetState();
}

class _SignupPhoneNumberWidgetState extends State<SignupPhoneNumberWidget> {
  TextEditingController phoneNumberController = TextEditingController();

  bool _isLoading = false;

  String countryCode = "";
  String _verificationId = "";
  int? forceResendingToken;
  bool showOtpScreen = false;

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    phoneNumberController.dispose();
    super.dispose();
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> saveForm() async {
    final isValid = _formKey.currentState!.validate();

    if (!isValid) {
      return;
    } else {
      setState(() {
        _isLoading = true;
      });
      _formKey.currentState!.save();
      await phoneSignIn();
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> phoneSignIn() async {
    try {
      await _auth.verifyPhoneNumber(
          phoneNumber: countryCode + phoneNumberController.text.trim(),
          timeout: const Duration(
            seconds: 30,
          ),
          forceResendingToken: forceResendingToken,
          verificationCompleted: verificationCompleted,
          verificationFailed: verificationFailed,
          codeSent: codeSent,
          codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
      showOtpScreen = true;
    } catch (e) {
      Utils.snackBar(
        message: "Failed to Verify Phone Number: $e",
        context: context,
      );
      showOtpScreen = false;
    }
  }

  verificationCompleted(PhoneAuthCredential phoneAuthCredential) async {
    User? user;
    bool error = false;
    try {
      user = (await _auth.signInWithCredential(phoneAuthCredential)).user!;
    } catch (e) {
      error = true;
    }
    if (!error && user != null) {
      //String id = user.uid;
      //here you can store user data in backend
      // Navigator.pushReplacement(context,
      //     MaterialPageRoute(builder: (context) => HomeScreen(userId: id)));
    }
  }

  verificationFailed(FirebaseAuthException authException) {
    Utils.snackBar(
      message: authException.message!,
      context: context,
    );
  }

  codeSent(String? verificationId, [int? forceResendingToken]) async {
    Utils.snackBar(
      message: 'Please check your phone for the verification code.',
      context: context,
    );

    this.forceResendingToken = forceResendingToken;
    _verificationId = verificationId!;
  }

  codeAutoRetrievalTimeout(String verificationId) {
    _verificationId = verificationId;
  }

  String? phoneNumberValidator(String? value) {
    if (value!.length < 10) {
      return 'Phone number must be longer than 10 characters';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(
              top: kdefaultPadding + 10,
              left: kdefaultPadding,
            ),
            child: const Text(
              "Phone Number",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(
              horizontal: kdefaultPadding * 0.50,
            ),
            decoration: BoxDecoration(
              color: kprimaryColor.withOpacity(0.05),
              borderRadius: BorderRadius.circular(40),
            ),
            margin: const EdgeInsets.only(
              left: kdefaultPadding - 10,
              right: kdefaultPadding - 10,
            ),
            child: IntlPhoneField(
              onChanged: (value) {
                countryCode = value.countryCode;
              },
              disableLengthCheck: true,
              controller: phoneNumberController,
              dropdownIconPosition: IconPosition.trailing,
              dropdownIcon: const Icon(
                Icons.arrow_drop_down,
                color: kprimaryColor,
              ),
              dropdownTextStyle: const TextStyle(
                color: Colors.white,
              ),
              initialCountryCode: 'IN',
              flagsButtonPadding: const EdgeInsets.only(
                left: 10,
              ),
              style: const TextStyle(
                color: Colors.white,
              ),
              decoration: const InputDecoration(
                hintText: "Phone Number",
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.grey),
                errorStyle: TextStyle(
                  height: 0,
                ),
              ),
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.number,
              validator: phoneNumberValidator,
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
          ),
          const SizedBox(
            height: kdefaultPadding + 15,
          ),
          !_isLoading
              ? Container(
                  margin: const EdgeInsets.only(
                    left: kdefaultPadding - 10,
                    right: kdefaultPadding - 10,
                  ),
                  child: PrimaryButton(
                    text: "Request OTP",
                    press: () async {
                      if (phoneNumberController.text.isNotEmpty) {
                        await saveForm();
                        if (showOtpScreen) {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return RequestOTPView(
                                verificationId: _verificationId,
                                phoneNumber: countryCode +
                                    phoneNumberController.text.trim(),
                              );
                            },
                          ));
                        }
                      } else {
                        Utils.snackBar(
                          message: "Enter phone number",
                          context: context,
                        );
                      }
                    },
                    color: kprimaryColor,
                  ),
                )
              : const CircularProgressIndicator(),
        ],
      ),
    );
  }
}
