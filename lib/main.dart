import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/connectionScreen.dart';
import 'screens/homeScreen.dart';
import 'screens/userDetailScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Mali',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/userDetail_page': (context) => UserDetailPage(),
        '/connectionPage': (context) => ConnectionPage(),
      },
    );
  }
}
