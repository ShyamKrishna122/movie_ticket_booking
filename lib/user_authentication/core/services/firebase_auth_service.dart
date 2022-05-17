import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

enum Status { Uninitialized, Authenticated, Unauthenticated }

class FirebaseAuthService extends ChangeNotifier {
  final FirebaseAuth auth;
  User? _user;
  User? get user => _user;
  Status _status = Status.Uninitialized;
  Status get status => _status;
  FirebaseAuthService.instance({required this.auth}) {
    auth.userChanges().listen(onAuthStateChanged);
  }

  Status changeState(Status status) {
    _status = status;
    notifyListeners();
    return _status;
  }

  Future onAuthStateChanged(User? user) async {
    if (user == null) {
      changeState(Status.Unauthenticated);
      _status = Status.Unauthenticated;
    } else {
      _user = user;
      changeState(Status.Authenticated);
      _status = Status.Authenticated;
    }
    notifyListeners();
  }

  String _error = "";
  String get error => _error;

  Future signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      changeState(Status.Authenticated);
      _status = Status.Authenticated;
      notifyListeners();
      return true;
    } on FirebaseAuthException catch (e) {
      changeState(Status.Unauthenticated);
      _status = Status.Unauthenticated;
      _error = e.code;
      notifyListeners();
      return false;
    }
  }

  Future createUserWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      changeState(Status.Authenticated);
      _status = Status.Authenticated;
      notifyListeners();

      return true;
    } catch (e) {
      changeState(Status.Unauthenticated);
      _status = Status.Unauthenticated;
      notifyListeners();
      return false;
    }
  }

  Future userSignOut() async {
    await auth.signOut();
    _status = Status.Unauthenticated;
    notifyListeners();
  }
}
