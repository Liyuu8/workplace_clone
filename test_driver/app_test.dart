import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import 'isolates_workaround.dart';

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

      // https://gitmemory.com/issue/flutter/flutter/24703/668736589
      // https://stackoverflow.com/questions/64797858/flutter-driver-hangs-at-splash-screen

      FlutterDriver driver;
      IsolatesWorkaround workaround;

      // Connect to the Flutter driver before running any tests.
      setUpAll(() async {
        print('Connecting driver');
        driver = await FlutterDriver.connect();
        print('Driver connected');

        if (driver.appIsolate.isPaused) {
          print('Waiting for IsolatesWorkaround to resume isolates');
          workaround = IsolatesWorkaround(driver);
          await workaround.resumeIsolates();
          print('Isolates resumed');
        }

        print('Waiting for first frame to rasterize');
        await driver.waitUntilFirstFrameRasterized();
        print('First frame rasterized');
      });

      // Close the connection to the driver after the tests have completed.
      tearDownAll(() async {
        if (driver != null) {
          await driver.close();
          await workaround?.tearDown();
        }
      });

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
          assert(homeScreen == null);
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
    timeout: Timeout(const Duration(seconds: 180)),
  );
}
