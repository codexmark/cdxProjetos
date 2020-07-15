import 'package:delivery_app/views/layout.dart';
import 'package:delivery_app/views/login/login_page.dart';
import 'package:delivery_app/views/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Start OneSignal connection
    OneSignal.shared.init('c35423d9-779c-4575-9241-748ceb914593');

    //OneSignal.shared.setInFocusDisplayType(OSNotificationDisplayType.none);

    // OneSignal.shared
    // .setNotificationReceivedHandler((OSNotification notification) {});

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Layout.primary(),
        accentColor: Layout.secondary(),
        textTheme: TextTheme(
          headline5: TextStyle(fontWeight: FontWeight.bold, fontSize: 48),
          headline6: TextStyle(fontSize: 24, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 14),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Layout.secondary(),
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: LoginPage.tag,
      routes: {
        LoginPage.tag: (context) => LoginPage(),
        HomePage.tag: (context) => HomePage(),
      },
    );
  }
}
