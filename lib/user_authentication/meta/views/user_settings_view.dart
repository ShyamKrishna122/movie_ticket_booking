import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:movie_booking_app/movie_management/screens/home_screen/tabs/ticket_tab/ticket_tab.dart';
import 'package:movie_booking_app/streams/screens/dashboard_screen.dart';
import 'package:movie_booking_app/user_authentication/core/services/firebase_auth_service.dart';
import 'package:movie_booking_app/user_authentication/meta/views/edit_profile_view.dart';
import 'package:provider/provider.dart';

import '../../app/shared/constants.dart';
import '../widget/primary_button.dart';
import 'authentication/login_view.dart';

class UserSettingsView extends StatelessWidget {
  const UserSettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<FirebaseAuthService>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kprimaryColor,
        title: ListTile(
          title: const Text(
            "Hey!!",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          subtitle: InkWell(
            key: const ValueKey("EditProfileView"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const EditProfileView(),
              ));
            },
            child: const Text(
              "Edit Profile",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          ListTile(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const TicketTab(),
              ));
            },
            leading: const Icon(
              EvaIcons.shoppingBag,
              color: Colors.white,
            ),
            title: const Text(
              "Purchase History",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            subtitle: Text(
              "View all your bookings & purchases",
              style: TextStyle(
                color: Colors.grey.shade500,
              ),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.white,
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const DashboardScreen(),
              ));
            },
            leading: const Icon(
              EvaIcons.tv,
              color: Colors.white,
            ),
            title: const Text(
              "Stream Library",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            subtitle: Text(
              "Rented,Purchased & downloaded movies",
              style: TextStyle(
                color: Colors.grey.shade500,
              ),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.white,
            ),
          ),
          const Spacer(),
          Container(
            margin: const EdgeInsets.all(20),
            child: PrimaryButton(
              key: const ValueKey("SignOutButton"),
              text: "Sign Out",
              press: () async {
                await user.userSignOut();
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => const LoginView(),
                    ),
                    (route) => false);
              },
              color: kprimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
