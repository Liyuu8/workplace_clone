import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group(
    "Flutter Auth App Test",
    () {
      // TODO:
      // final signUpButton = find.text('SIGN UP');
      final logInButton = find.text('LOG IN');
      final enterEmailText = find.text('Enter Your Business Email');
      final emailField = find.byValueKey('email_field');
      final enterPasswordText = find.text('Enter Your Password');
      final passwordField = find.byValueKey('password_field');
      final continueButton = find.text('CONTINUE');
      // TODO:
      // final creatingAccountText = find.text('Creating account...');
      final loggingInText = find.text('Logging in...');
      // TODO:
      // final signUpCompletedText = find.byValueKey('sign_up_completed_text');
      // final signUpFailedText = find.byValueKey('sign_up_failed_text');
      final logInCompletedText = find.byValueKey('log_in_completed_text');
      final logInFailedText = find.byValueKey('log_in_failed_text');
      final homeScreen = find.byType("HomeScreen");

      FlutterDriver driver;
      setUpAll(() async => driver = await FlutterDriver.connect());
      tearDownAll(() async => driver != null ? driver.close() : null);

      test(
        "log in fails with incorrect email and password",
        () async {
          await driver.tap(logInButton);
          await driver.waitFor(enterEmailText);
          await driver.tap(emailField);
          await driver.enterText("test_user@sample.com");
          await driver.tap(continueButton);
          await driver.waitFor(enterPasswordText);
          await driver.tap(passwordField);
          await driver.enterText("incorrect_test_user");
          await driver.tap(continueButton);
          await driver.waitForAbsent(loggingInText);
          assert(logInFailedText != null);
          await driver.tap(continueButton);
          await driver.waitUntilNoTransientCallbacks();
        },
      );

      test(
        "logs in with correct email and password",
        () async {
          await driver.waitFor(enterPasswordText);
          await driver.tap(passwordField);
          await driver.enterText("correct_test_user");
          await driver.tap(continueButton);
          await driver.waitForAbsent(loggingInText);
          assert(logInCompletedText != null);
          await driver.tap(continueButton);
          await driver.waitUntilNoTransientCallbacks();
          assert(homeScreen != null);
        },
      );
    },
    timeout: Timeout(const Duration(seconds: 120)),
  );
}
