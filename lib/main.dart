import 'package:flutter/material.dart';
import 'package:localfeatures/screens/dashboard/dashboard_page.dart';
import 'package:localfeatures/screens/homescreen/homescreen_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const CheckAuth());
  }
}

class CheckAuth extends StatefulWidget {
  const CheckAuth({Key? key}) : super(key: key);

  @override
  State<CheckAuth> createState() => _CheckAuthState();
}

class _CheckAuthState extends State<CheckAuth> {
  bool isAuth = false;
  Future _checkTokenData() async {
    final storage = await SharedPreferences.getInstance();
    var token = storage.getString("auth");
    if (token != null) {
      setState(() {
        isAuth = true;
      });
    }
  }

  @override
  void initState() {
    _checkTokenData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (isAuth) {
      return const DashboardPage();
    } else {
      return const HomescreenPage();
    }

    //return Container();
  }
}
