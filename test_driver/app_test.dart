import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group("Movie app ui Test", () {
    final emailField = find.byValueKey("email-field");
    final passwordField = find.byValueKey("password-field");
    final signInButton = find.byValueKey("LoginButton");
    final profileButton = find.byValueKey("ProfileButton");
    final signOutButton = find.byValueKey("SignOutButton");
    final create = find.byValueKey("Create");
    final createEmailField = find.byValueKey("CreateEmailField");
    final createPasswordField = find.byValueKey("CreatePasswordField");
    final createCOnfirmPasswordField =
        find.byValueKey("CreateConfirmPasswordField");
    final signupButton = find.byValueKey("SignupButton");
    final SerializableFinder? signupView = find.byType("SignUpView");
    final SerializableFinder? pickCityView = find.byType("PickCityView");
    final SerializableFinder? homeView = find.byType("HomeView");
    final SerializableFinder? snackbar = find.byType("SnackBar");
    final SerializableFinder? userProfileView = find.byType("UserSettingsView");
    final SerializableFinder? loginView = find.byType("LoginView");

    late FlutterDriver? driver;
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver!.close();
      }
    });

    test(
        "login fails with incorrect email and password, provides snackbar feedback",
        () async {
      await driver!.tap(emailField);
      await driver!.enterText("test@gmail.com");
      await driver!.tap(passwordField);
      await driver!.enterText("test123456");
      await driver!.tap(signInButton);
      await driver!.waitFor(snackbar!);
      await driver!.waitUntilNoTransientCallbacks();
      assert(homeView == null);
    });

    test("logs in with correct email and password", () async {
      await driver!.tap(emailField);
      await driver!.enterText("shyamkrish122001@gmail.com");
      await driver!.tap(passwordField);
      await driver!.enterText("shyam@123");
      await driver!.tap(signInButton);
      await driver!.waitFor(homeView!);
      await driver!.waitUntilNoTransientCallbacks();
    });

    test("logs the user out of the app", () async {
      await driver!.waitFor(homeView!);
      await driver!.waitFor(profileButton);
      await driver!.tap(profileButton);
      await driver!.waitFor(userProfileView!);
      await driver!.waitFor(signOutButton);
      await driver!.tap(signOutButton);
      await driver!.waitFor(loginView!);
      await driver!.waitUntilNoTransientCallbacks();
    });

    test("create user account,when passwords not match", () async {
      await driver!.tap(emailField);
      await driver!.enterText("test123@gmail.com");
      await driver!.tap(passwordField);
      await driver!.enterText("shyam@1234");
      await driver!.tap(signInButton);
      await driver!.waitFor(snackbar!);
      await driver!.waitFor(create);
      await driver!.tap(create);
      await driver!.waitFor(signupView!);
      await driver!.tap(createEmailField);
      await driver!.enterText("test123@gmail.com");
      await driver!.tap(createPasswordField);
      await driver!.enterText("shyam@123");
      await driver!.tap(createCOnfirmPasswordField);
      await driver!.enterText("shyam@124");
      await driver!.tap(signupButton);
      await driver!.waitFor(snackbar);
      await driver!.waitUntilNoTransientCallbacks();
      assert(pickCityView == null);
    });
    test("create user account", () async {
      await driver!.tap(createEmailField);
      await driver!.enterText("hari@gmail.com");
      await driver!.tap(createPasswordField);
      await driver!.enterText("shyam@123");
      await driver!.tap(createCOnfirmPasswordField);
      await driver!.enterText("shyam@123");
      await driver!.waitFor(signupButton);
      await driver!.tap(signupButton);
      await driver!.waitFor(pickCityView!);
      await driver!.waitUntilNoTransientCallbacks();
    });
  });
}
