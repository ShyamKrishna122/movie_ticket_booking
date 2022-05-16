import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_booking_app/user_authentication/app/routes/app.routes.dart';
import 'package:movie_booking_app/user_authentication/core/services/firebase_auth_service.dart';
import 'package:movie_booking_app/user_authentication/meta/utils/utils.dart';
import 'package:movie_booking_app/user_authentication/meta/utils/validator.dart';
import 'package:movie_booking_app/user_authentication/meta/views/home_view.dart';
import 'package:movie_booking_app/user_authentication/meta/views/pick_city_view.dart';
import 'package:movie_booking_app/user_authentication/meta/widget/primary_button.dart';
import 'package:provider/provider.dart';

import '../../app/shared/constants.dart';
import '../../core/notifiers/user_notifier.dart';

class EmailWidget extends StatefulWidget {
  const EmailWidget({Key? key}) : super(key: key);

  @override
  _EmailWidgetState createState() => _EmailWidgetState();
}

class _EmailWidgetState extends State<EmailWidget> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  bool isHidden = true;

  bool _isLoading = false;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> saveForm() async {
    final isValid = _formKey.currentState!.validate();

    if (!isValid) {
      return;
    } else {
      _formKey.currentState!.save();
      setState(() {
        _isLoading = true;
      });
      await loginUser();
    }
  }

  Future<void> loginUser() async {
    final user = Provider.of<FirebaseAuthService>(context, listen: false);
    if (!await user.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim())) {
      setState(() {
        _emailController.clear();
        _passwordController.clear();
        _isLoading = false;
      });
      Utils.snackBar(
        message: user.error,
        context: context,
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) {
            return HomeView();
          },
        ),
      );
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

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
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
              key: ValueKey("email-field"),
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
              validator: (value) {
                return FieldValidator.validateEmail(value!);
              },
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
              key: ValueKey("password-field"),
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
              onEditingComplete: () => FocusScope.of(context).unfocus(),
              textInputAction: TextInputAction.done,
              obscureText: isHidden,
              keyboardType: TextInputType.visiblePassword,
              validator: (value) {
                return FieldValidator.validatePassword(value!);
              },
            ),
          ),
          const SizedBox(
            height: kdefaultPadding,
          ),
          Container(
            alignment: Alignment.centerRight,
            margin: const EdgeInsets.only(
              right: 10,
            ),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(forgotPasswordRoute);
              },
              child: const Text(
                'Forgot Password?',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: kdefaultPadding + 10,
          ),
          !_isLoading
              ? Container(
                  margin: const EdgeInsets.only(
                    left: kdefaultPadding - 10,
                    right: kdefaultPadding - 10,
                  ),
                  child: PrimaryButton(
                    key: ValueKey("LoginButton"),
                    text: "Log In",
                    press: () async {
                      await saveForm();
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
