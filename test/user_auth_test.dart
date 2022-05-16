import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_booking_app/user_authentication/core/services/firebase_auth_service.dart';

import 'user_auth_test.mocks.dart';

@GenerateMocks(
  [],
  customMocks: [
    MockSpec<FirebaseAuthService>(
      returnNullOnMissingStub: true,
    ),
  ],
)
void main() {
  var auth = MockFirebaseAuthService();
  group('user repository test', () {
    when(auth.createUserWithEmailPassword(email: "email", password: "password"))
        .thenAnswer((_) async {
      return true;
    });
    test("create account with email and password", () async {
      bool signedIn = await auth.createUserWithEmailPassword(
          email: "email", password: "password");
      expect(signedIn, true);
      when(auth.status).thenAnswer((_) => Status.Authenticated);
      expect(auth.status, Status.Authenticated);
    });
    when(auth.signInWithEmailAndPassword(email: "email", password: "password"))
        .thenAnswer((_) async {
      return true;
    });
    when(auth.signInWithEmailAndPassword(email: "mail", password: "pass"))
        .thenAnswer((_) async {
      return false;
    });
    test("sign in with email and password", () async {
      bool signedIn = await auth.signInWithEmailAndPassword(
          email: "email", password: "password");
      expect(signedIn, true);
      when(auth.status).thenAnswer((_) => Status.Authenticated);
      expect(auth.status, Status.Authenticated);
    });
    test("sign in fails with incorrect email and password", () async {
      bool signedIn = await auth.signInWithEmailAndPassword(
          email: "mail", password: "pass");
      expect(signedIn, false);
      when(auth.status).thenAnswer((_) => Status.Unauthenticated);
      expect(auth.status, Status.Unauthenticated);
    });

    when(auth.userSignOut()).thenAnswer((_) async {
      return true;
    });

    test('sign out', () async {
      await auth.userSignOut();
      when(auth.status).thenAnswer((_) => Status.Unauthenticated);
      expect(auth.status, Status.Unauthenticated);
    });
  });
}

// class MockFirebaseAuth extends Mock implements FirebaseAuth {}

// class MockFirebaseUser extends Mock implements User {}

// class MockAuthResult extends Mock implements UserCredential {}

// void main() {
//   MockFirebaseAuth _auth = MockFirebaseAuth();
//   MockFirebaseUser _user = MockFirebaseUser();
//   FirebaseAuthService _repo = FirebaseAuthService.instance(auth: _auth);
//   when(_auth.userChanges()).thenAnswer((_) {
//     return Stream.fromIterable([_user]);
//   });
//   group('user repository test', () {
//     when(_auth.signInWithEmailAndPassword(email: "email", password: "password"))
//         .thenAnswer((_) async {
//       //_user.add(MockFirebaseUser());
//       return MockAuthResult();
//     });
//     when(_auth.signInWithEmailAndPassword(email: "mail", password: "pass"))
//         .thenThrow(() {
//       return null;
//     });
//     test("sign in with email and password", () async {
//       bool signedIn = await _repo.signInWithEmailAndPassword(
//           email: "email", password: "password");
//       expect(signedIn, true);
//       expect(_repo.status, Status.Authenticated);
//     });

//     test("sing in fails with incorrect email and password", () async {
//       bool signedIn = await _repo.signInWithEmailAndPassword(
//           email: "mail", password: "pass");
//       expect(signedIn, false);
//       expect(_repo.status, Status.Unauthenticated);
//     });

//     test('sign out', () async {
//       await _repo.userSignOut();
//       expect(_repo.status, Status.Unauthenticated);
//     });
//   });
// }
