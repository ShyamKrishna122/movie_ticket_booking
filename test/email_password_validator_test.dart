import 'package:flutter_test/flutter_test.dart';
import 'package:movie_booking_app/user_authentication/meta/utils/validator.dart';

void main() {
  test('Empty Email Test', () {
    var result = FieldValidator.validateEmail('');
    expect(result, 'Enter Email!');
  });

  test('Invalid Email Test', () {
    var result = FieldValidator.validateEmail('shyam123');
    expect(result, 'Enter Valid Email!');
  });

  test('Valid Email Test', () {
    var result = FieldValidator.validateEmail('shyam@gmail.com');
    expect(result, null);
  });

  test('Empty Password Test', () {
    var result = FieldValidator.validatePassword('');
    expect(result, 'Enter Password!');
  });

  test('Invalid Password Test', () {
    var result = FieldValidator.validatePassword('123');
    expect(result, 'Password must be more than 6 character');
  });

  test('Valid Password Test', () {
    var result = FieldValidator.validatePassword('shyam12345');
    expect(result, null);
  });
}
