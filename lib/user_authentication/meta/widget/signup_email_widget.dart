import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_booking_app/user_authentication/core/services/firebase_auth_service.dart';
import 'package:movie_booking_app/user_authentication/meta/utils/utils.dart';
import 'package:movie_booking_app/user_authentication/meta/views/pick_city_view.dart';
import 'package:movie_booking_app/user_authentication/meta/widget/primary_button.dart';
import 'package:provider/provider.dart';

import '../../app/shared/constants.dart';
import '../../core/notifiers/user_notifier.dart';

class SignUpEmailWidget extends StatefulWidget {
  const SignUpEmailWidget({Key? key}) : super(key: key);

  @override
  _SignUpEmailWidgetState createState() => _SignUpEmailWidgetState();
}

class _SignUpEmailWidgetState extends State<SignUpEmailWidget> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _confirmPasswordFocusNode = FocusNode();

  bool isHidden = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordController.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _passwordController.addListener(() {
      setState(() {});
    });
    _confirmPasswordController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> saveForm() async {
    final isValid = _formKey.currentState!.validate();

    if (!isValid) {
      return;
    } else {
      if (_passwordController.text == _confirmPasswordController.text) {
        _formKey.currentState!.save();
        await registerUser();
      } else {
        Utils.snackBar(message: "something went wrong", context: context);
      }
    }
  }

  registerUser() async {
    try {
      final user = Provider.of<FirebaseAuthService>(context, listen: false);

      if (await user.createUserWithEmailPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim())) {
        if (user.user != null) {
          Provider.of<UserNotifier>(context, listen: false).setUserData(
            user: user.user,
          );
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) {
                return const PickCityView(
                  option: 0,
                );
              },
            ),
          );
          _emailController.clear();
          _passwordController.clear();
          _confirmPasswordController.clear();
        } else {
          _emailController.clear();
          _passwordController.clear();
          _confirmPasswordController.clear();
        }
      }
    } on FirebaseAuthException catch (e) {
      showErrorDialog(e.message);
    }
  }

  showErrorDialog(String? errorMessage) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Error!!'),
          content: Text(errorMessage!),
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

  String? pwdValidator(String? value) {
    if (value!.length < 7) {
      return 'Password must be longer than 6 characters';
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
              "Email",
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
            child: TextFormField(
              key: ValueKey("CreateEmailField"),
              style: const TextStyle(
                color: Colors.white,
              ),
              decoration: const InputDecoration(
                hintText: "Email",
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.grey),
                prefixIcon: Icon(
                  Icons.email_rounded,
                  color: kprimaryColor,
                ),
              ),
              controller: _emailController,
              focusNode: _emailFocusNode,
              onEditingComplete: () =>
                  FocusScope.of(context).requestFocus(_passwordFocusNode),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
            ),
          ),
          const SizedBox(
            height: kdefaultPadding + 10,
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
            child: TextFormField(
              key: ValueKey("CreatePasswordField"),
              validator: pwdValidator,
              style: const TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                hintText: "Password",
                border: InputBorder.none,
                hintStyle: const TextStyle(color: Colors.grey),
                prefixIcon: const Icon(
                  Icons.lock,
                  color: kprimaryColor,
                ),
                errorStyle: const TextStyle(
                  height: 0,
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isHidden = !isHidden;
                    });
                  },
                  icon: Icon(
                    isHidden ? Icons.visibility_off : Icons.visibility,
                    color: kprimaryColor,
                  ),
                ),
              ),
              controller: _passwordController,
              focusNode: _passwordFocusNode,
              onEditingComplete: () => FocusScope.of(context)
                  .requestFocus(_confirmPasswordFocusNode),
              textInputAction: TextInputAction.next,
              obscureText: isHidden,
              keyboardType: TextInputType.visiblePassword,
            ),
          ),
          const SizedBox(
            height: kdefaultPadding + 10,
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
            child: TextFormField(
              key: ValueKey("CreateConfirmPasswordField"),
              validator: pwdValidator,
              style: const TextStyle(
                color: Colors.white,
              ),
              decoration: const InputDecoration(
                hintText: "Confirm Password",
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.grey),
                prefixIcon: Icon(
                  Icons.lock,
                  color: kprimaryColor,
                ),
                errorStyle: TextStyle(
                  height: 0,
                ),
              ),
              controller: _confirmPasswordController,
              focusNode: _confirmPasswordFocusNode,
              onEditingComplete: () => FocusScope.of(context).unfocus(),
              textInputAction: TextInputAction.done,
              obscureText: isHidden,
              keyboardType: TextInputType.visiblePassword,
            ),
          ),
          const SizedBox(
            height: kdefaultPadding + 10,
          ),
          Container(
            margin: const EdgeInsets.only(
              left: kdefaultPadding - 10,
              right: kdefaultPadding - 10,
            ),
            child: PrimaryButton(
              key: ValueKey("SignupButton"),
              text: "Sign Up",
              press: () async {
                await saveForm();
              },
              color: kprimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
