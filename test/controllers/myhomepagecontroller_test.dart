import 'package:test/test.dart';
import 'package:login_app/controllers/myhomepagecontroller.dart';

void main() {
  group('MyHomePageController', () {
    test('isValid() should not be true', () {
      final myHomepPgeVC = MyHomePageController();

      var isValid = myHomepPgeVC.isInputValid("", "");
      expect(isValid, false);

      isValid = myHomepPgeVC.isInputValid("username", "");
      expect(isValid, false);

      isValid = myHomepPgeVC.isInputValid("", "password");
      expect(isValid, false);

      isValid = myHomepPgeVC.isInputValid("username", " ");
      expect(isValid, false);

      isValid = myHomepPgeVC.isInputValid(" ", "password");
      expect(isValid, false);

      isValid = myHomepPgeVC.isInputValid("username", "password");
      expect(isValid, true);
    });

    test('isValid() should be true', () {
      final myHomepPgeVC = MyHomePageController();

      var isValid = myHomepPgeVC.isInputValid("username", "password");
      expect(isValid, true);

      isValid = myHomepPgeVC.isInputValid("abasf", "asdfasf");
      expect(isValid, true);
    });
  });
}
