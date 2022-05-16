import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:movie_booking_app/user_authentication/meta/widget/primary_button.dart';

import '../../app/shared/constants.dart';

class PhoneNumberWidget extends StatefulWidget {
  const PhoneNumberWidget({Key? key}) : super(key: key);

  @override
  State<PhoneNumberWidget> createState() => _PhoneNumberWidgetState();
}

class _PhoneNumberWidgetState extends State<PhoneNumberWidget> {
  TextEditingController phoneNumberController = TextEditingController();

  @override
  void dispose() {
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
            ),
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.number,
          ),
        ),
        const SizedBox(
          height: kdefaultPadding + 15,
        ),
        Container(
          margin: const EdgeInsets.only(
            left: kdefaultPadding - 10,
            right: kdefaultPadding - 10,
          ),
          child: PrimaryButton(
            text: "Request OTP",
            press: () {
              //Navigator.of(context).push();
            },
            color: kprimaryColor,
          ),
        ),
      ],
    );
  }
}
