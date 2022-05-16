import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movie_booking_app/user_authentication/core/api/firebase_user_info_api.dart';
import 'package:movie_booking_app/user_authentication/core/models/user_model.dart';
import 'package:movie_booking_app/user_authentication/core/notifiers/user_notifier.dart';
import 'package:movie_booking_app/user_authentication/core/services/location_service.dart';
import 'package:movie_booking_app/user_authentication/meta/utils/utils.dart';
import 'package:movie_booking_app/user_authentication/meta/widget/primary_button.dart';
import 'package:provider/provider.dart';

import '../../app/shared/constants.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({Key? key}) : super(key: key);

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  final TextEditingController _ad1Controller = TextEditingController();
  final TextEditingController _ad2Controller = TextEditingController();
  final TextEditingController _landmarkController = TextEditingController();
  final TextEditingController _cityNameController = TextEditingController();
  final TextEditingController _stateNameController = TextEditingController();

  final FocusNode _mobileFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _firstNameFocusNode = FocusNode();
  final FocusNode _lastNameFocusNode = FocusNode();
  final FocusNode _dobFocusNode = FocusNode();
  final FocusNode _pincodeFocusNode = FocusNode();
  final FocusNode _ad1FocusNode = FocusNode();
  final FocusNode _ad2FocusNode = FocusNode();
  final FocusNode _landmarkFocusNode = FocusNode();
  final FocusNode _cityNameFocusNode = FocusNode();
  final FocusNode _stateNameFocusNode = FocusNode();

  String photoUrl = "";

  @override
  void initState() {
    Future.delayed(
      Duration.zero,
      () {
        final userProvider = Provider.of<UserNotifier>(context, listen: false);
        if (userProvider.user.user!.phoneNumber != null) {
          _mobileController.text = userProvider.user.user!.phoneNumber!;
        }
        if (userProvider.user.user!.email != null) {
          _emailController.text = userProvider.user.user!.email!;
        }
        if (userProvider.user.firstName != null) {
          _firstNameController.text = userProvider.user.firstName!;
        }
        if (userProvider.user.lastName != null) {
          _lastNameController.text = userProvider.user.lastName!;
        }
        if (userProvider.user.pincode != null) {
          _pincodeController.text = userProvider.user.pincode!;
        }
        if (userProvider.user.ad1 != null) {
          _ad1Controller.text = userProvider.user.ad1!;
        }
        if (userProvider.user.city != null) {
          _cityNameController.text = userProvider.user.city!;
        }
        if (userProvider.user.state != null) {
          _stateNameController.text = userProvider.user.state!;
        }
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    _mobileController.dispose();
    _mobileFocusNode.dispose();
    _emailController.dispose();
    _emailFocusNode.dispose();
    _firstNameController.dispose();
    _firstNameFocusNode.dispose();
    _lastNameController.dispose();
    _lastNameFocusNode.dispose();
    _dobController.dispose();
    _dobFocusNode.dispose();
    _pincodeController.dispose();
    _pincodeFocusNode.dispose();
    _ad1Controller.dispose();
    _ad1FocusNode.dispose();
    _ad2Controller.dispose();
    _ad2FocusNode.dispose();
    _landmarkController.dispose();
    _landmarkFocusNode.dispose();
    _cityNameController.dispose();
    _cityNameFocusNode.dispose();
    _stateNameController.dispose();
    _stateNameFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserNotifier>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kprimaryColor,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_sharp,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          "Edit Profile",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: size.width,
              height: 150,
              color: kprimaryColor.withOpacity(
                0.5,
              ),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      top: kdefaultPadding,
                      bottom: kdefaultPadding,
                    ),
                    child: const CircleAvatar(
                      radius: 40,
                      backgroundColor: kcanvasColor,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      showOptionsBottomSheet();
                    },
                    child: Text(
                      photoUrl.isEmpty ? "Add Photo" : "Change Photo",
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: kdefaultPadding + 10,
            ),
            _buildTitle(
              title: "Mobile Number",
            ),
            const SizedBox(
              height: kdefaultPadding,
            ),
            _buildInputField(
              id: 1,
              size: size,
              controller: _mobileController,
              focusNode: _mobileFocusNode,
              nextFocusNode: _emailFocusNode,
              hint: "Get tickets in whatsapp/sms",
              label: "",
              option: 0,
              isReadOnly: true,
              function: () {},
            ),
            const SizedBox(
              height: kdefaultPadding + 10,
            ),
            _buildTitle(
              title: "Email Address",
            ),
            const SizedBox(
              height: kdefaultPadding,
            ),
            _buildInputField(
              id: 2,
              size: size,
              controller: _emailController,
              focusNode: _emailFocusNode,
              nextFocusNode: _firstNameFocusNode,
              hint: "Email Id",
              label: "",
              option: 0,
              isReadOnly: true,
              function: () {},
            ),
            const SizedBox(
              height: kdefaultPadding * 2 + 10,
            ),
            _buildTitle(
              title: "Personal Details",
            ),
            const SizedBox(
              height: kdefaultPadding,
            ),
            _buildInputField(
              id: 3,
              size: size,
              controller: _firstNameController,
              focusNode: _firstNameFocusNode,
              nextFocusNode: _lastNameFocusNode,
              hint: "Enter first name here",
              label: "First Name",
              option: 1,
              isReadOnly: false,
              isNum: false,
            ),
            const SizedBox(
              height: kdefaultPadding + 10,
            ),
            _buildInputField(
              id: 4,
              size: size,
              controller: _lastNameController,
              focusNode: _lastNameFocusNode,
              nextFocusNode: _dobFocusNode,
              hint: "Enter last name here",
              label: "Last Name",
              option: 1,
              isReadOnly: false,
              isNum: false,
            ),
            const SizedBox(
              height: kdefaultPadding + 10,
            ),
            _buildInputField(
              id: 5,
              size: size,
              controller: _dobController,
              focusNode: _dobFocusNode,
              nextFocusNode: _pincodeFocusNode,
              hint: "DD/MM/YY",
              label: "Birthday (Optional)",
              option: 1,
              isReadOnly: true,
              function: () {},
            ),
            const SizedBox(
              height: kdefaultPadding * 2 + 10,
            ),
            _buildTitle(
              title: "Address (Optional)",
            ),
            const SizedBox(
              height: kdefaultPadding,
            ),
            _buildInputField(
              id: 6,
              size: size,
              controller: _pincodeController,
              focusNode: _pincodeFocusNode,
              nextFocusNode: _ad1FocusNode,
              hint: "Eg 560001",
              label: "Area Pincode",
              option: 1,
              isReadOnly: false,
              isNum: true,
            ),
            const SizedBox(
              height: kdefaultPadding + 10,
            ),
            _buildInputField(
              id: 7,
              size: size,
              controller: _ad1Controller,
              focusNode: _ad1FocusNode,
              nextFocusNode: _ad2FocusNode,
              hint: "Flat No., House No., Building",
              label: "Address Line 1",
              option: 1,
              isReadOnly: false,
              isNum: false,
            ),
            const SizedBox(
              height: kdefaultPadding + 10,
            ),
            _buildInputField(
              id: 8,
              size: size,
              controller: _ad2Controller,
              focusNode: _ad2FocusNode,
              nextFocusNode: _landmarkFocusNode,
              hint: "Area, Colony, Street, Sector, Village",
              label: "Address Line 2",
              option: 1,
              isReadOnly: false,
              isNum: false,
            ),
            const SizedBox(
              height: kdefaultPadding + 10,
            ),
            _buildInputField(
              id: 9,
              size: size,
              controller: _landmarkController,
              focusNode: _landmarkFocusNode,
              nextFocusNode: _ad2FocusNode,
              hint: "Eg KG Theater",
              label: "Landmark",
              option: 1,
              isReadOnly: false,
              isNum: false,
            ),
            const SizedBox(
              height: kdefaultPadding + 10,
            ),
            _buildInputField(
              id: 10,
              size: size,
              controller: _cityNameController,
              focusNode: _cityNameFocusNode,
              nextFocusNode: _ad2FocusNode,
              hint: "City",
              label: "Town/City",
              option: 1,
              isReadOnly: true,
            ),
            const SizedBox(
              height: kdefaultPadding + 10,
            ),
            _buildInputField(
              id: 11,
              size: size,
              controller: _stateNameController,
              focusNode: _stateNameFocusNode,
              nextFocusNode: _ad2FocusNode,
              hint: "State",
              label: "State",
              option: 1,
              isReadOnly: true,
            ),
            const SizedBox(
              height: kdefaultPadding,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        width: size.width,
        color: kprimaryColor.withOpacity(0.05),
        child: Container(
          margin: const EdgeInsets.all(
            10,
          ),
          child: PrimaryButton(
            text: "Save Changes",
            press: () async {
              if (_pincodeController.text.isNotEmpty) {
                if (_ad1Controller.text.isEmpty) {
                  Utils.snackBar(message: "Fill AD1", context: context);
                } else {
                  UserModel userModel = UserModel(
                    user: userProvider.user.user,
                    location: userProvider.user.location,
                    movieGeners: userProvider.user.movieGeners,
                    movieLanguages: userProvider.user.movieLanguages,
                    firstName: _firstNameController.text,
                    lastName: _lastNameController.text,
                    pincode: _pincodeController.text,
                    ad1: _ad1Controller.text,
                    city: _cityNameController.text,
                    state: _stateNameController.text,
                  );
                  userProvider.setUserModel(userModel: userModel);
                  await FirebaseUserInfoApi(db: FirebaseFirestore.instance)
                      .saveUserInfo(
                    id: userProvider.user.user!.uid,
                    userModel: UserModel(
                      location: userProvider.user.location,
                      movieGeners: userProvider.user.movieGeners,
                      movieLanguages: userProvider.user.movieLanguages,
                      firstName: _firstNameController.text,
                      lastName: _lastNameController.text,
                      pincode: _pincodeController.text,
                      ad1: _ad1Controller.text,
                      city: _cityNameController.text,
                      state: _stateNameController.text,
                    ),
                  );
                }
              } else {
                UserModel userModel = UserModel(
                  user: userProvider.user.user,
                  location: userProvider.user.location,
                  movieGeners: userProvider.user.movieGeners,
                  movieLanguages: userProvider.user.movieLanguages,
                  firstName: _firstNameController.text,
                  lastName: _lastNameController.text,
                );
                userProvider.setUserModel(userModel: userModel);
                await FirebaseUserInfoApi(db: FirebaseFirestore.instance)
                    .saveUserInfo(
                  id: userProvider.user.user!.uid,
                  userModel: UserModel(
                    location: userProvider.user.location,
                    movieGeners: userProvider.user.movieGeners,
                    movieLanguages: userProvider.user.movieLanguages,
                    firstName: _firstNameController.text,
                    lastName: _lastNameController.text,
                  ),
                );
              }
              Utils.snackBar(message: "Profile Saved", context: context);
            },
            color: kprimaryColor,
          ),
        ),
      ),
    );
  }

  showOptionsBottomSheet() {
    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(
            kdefaultPadding,
          ),
        ),
      ),
      builder: (context) {
        return SizedBox(
          height: photoUrl.isEmpty ? 150 : 210,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 150.0,
                ),
                child: Divider(
                  thickness: 4,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                height: kdefaultPadding,
              ),
              _buildOptions(
                option: "Take Photo",
                callBack: () {},
              ),
              _buildOptions(
                option: "Choose Photo",
                callBack: () {},
              ),
              if (photoUrl.isNotEmpty)
                _buildOptions(
                  option: "Delete Photo",
                  callBack: () {},
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildOptions({
    required String option,
    required VoidCallback callBack,
  }) {
    return ListTile(
      onTap: () {},
      leading: Icon(
        option == "Take Photo"
            ? Icons.camera_alt_rounded
            : option == "Choose Photo"
                ? Icons.photo
                : option == "Delete Photo"
                    ? Icons.delete_outline_rounded
                    : null,
        color: Colors.white,
      ),
      title: Text(
        option,
        style: const TextStyle(
          color: Colors.grey,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildInputField({
    required Size size,
    required TextEditingController controller,
    required FocusNode focusNode,
    required FocusNode nextFocusNode,
    required String hint,
    required String label,
    required int option,
    required bool isReadOnly,
    VoidCallback? function,
    bool? isNum,
    required int id,
  }) {
    return Column(
      children: [
        if (option == 1)
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(
              left: kdefaultPadding,
            ),
            child: Text(label,
                style: const TextStyle(
                  color: Colors.white,
                )),
          ),
        if (option == 1)
          const SizedBox(
            height: 5,
          ),
        Container(
          margin: const EdgeInsets.only(
            left: kdefaultPadding,
            right: kdefaultPadding,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: kdefaultPadding * 0.50,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          width: size.width,
          height: 50,
          child: TextField(
            style: const TextStyle(
              color: Colors.white,
            ),
            readOnly: isReadOnly,
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hint,
              hintStyle: const TextStyle(
                color: Colors.grey,
              ),
            ),
            onTap: isReadOnly && function != null ? function : null,
            focusNode: focusNode,
            onSubmitted: (value) {
              if (id == 6) {
                setCityandState(
                  pincode: value,
                );
              }
            },
            onEditingComplete: () {
              FocusScope.of(context).requestFocus(nextFocusNode);
            },
            textInputAction: TextInputAction.next,
            keyboardType: isReadOnly == false
                ? isNum == true
                    ? TextInputType.number
                    : TextInputType.name
                : null,
          ),
        ),
      ],
    );
  }

  setCityandState({
    required String pincode,
  }) async {
    try {
      final result = await LocationService().getInfoFromPin(
        pincode: pincode,
        context: context,
      );
      if (result.isEmpty) {
        Utils.snackBar(
          message: "Something went wrong",
          context: context,
        );
      } else {
        Map<String, dynamic> postOffice = result["PostOffice"][0];

        setState(() {
          _cityNameController.text = postOffice["Region"];
          _stateNameController.text = postOffice["State"];
        });
      }
    } catch (error) {
      Utils.snackBar(
        message: "Something went wrong",
        context: context,
      );
    }
  }

  Widget _buildTitle({
    required String title,
  }) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.only(
        left: kdefaultPadding,
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
