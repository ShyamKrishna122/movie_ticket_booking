import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_booking_app/user_authentication/app/shared/constants.dart';
import 'package:movie_booking_app/user_authentication/meta/utils/utils.dart';

import '../../widget/primary_button.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  TextEditingController emailController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    emailFocusNode.dispose();
    super.dispose();
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> saveForm() async {
    final isValid = _formKey.currentState!.validate();

    if (!isValid) {
      return;
    } else {
      _formKey.currentState!.save();
      try {
        Utils.snackBar(
          message:
              "verification has been sent to ${emailController.text.trim()}",
          context: context,
        );
        await _auth.sendPasswordResetEmail(email: emailController.text.trim());
        Navigator.of(context).pop();
      } on FirebaseAuthException catch (e) {
        showErrorDialog(
          e.message!,
        );
      }
      emailController.clear();
    }
  }

  showErrorDialog(String errorMessage) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Error!!'),
          content: Text(errorMessage),
          actions: [
            TextButton(
              child: const Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: kdefaultPadding,
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: kdefaultPadding * 3,
                ),
                const SizedBox(
                  height: kdefaultPadding * 3,
                ),
                const Text(
                  "Forgot Password",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: kprimaryColor,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: kdefaultPadding * 1.5,
                ),
                Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(
                    horizontal: kdefaultPadding * 0.75,
                  ),
                  decoration: BoxDecoration(
                    color: kprimaryColor.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: TextFormField(
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    decoration: const InputDecoration(
                      hintText: "Email",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      border: InputBorder.none,
                      errorStyle: TextStyle(
                        height: 0,
                      ),
                    ),
                    controller: emailController,
                    focusNode: emailFocusNode,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.emailAddress,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Fill this field';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: kdefaultPadding * 1,
                ),
                PrimaryButton(
                  text: "Send Request",
                  press: () {
                    saveForm();
                  },
                  color: kprimaryColor,
                ),
                const Spacer(
                  flex: 2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
