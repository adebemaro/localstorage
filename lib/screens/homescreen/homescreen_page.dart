import 'dart:convert';
import 'dart:io';

import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:input_form_field/input_form_field.dart';
import 'package:http/http.dart' as http;
import 'package:localfeatures/helper/local_storage.dart';
import 'package:localfeatures/screens/dashboard/dashboard_page.dart';

class HomescreenPage extends StatefulWidget {
  const HomescreenPage({Key? key}) : super(key: key);

  @override
  State<HomescreenPage> createState() => _HomescreenPageState();
}

class _HomescreenPageState extends State<HomescreenPage> {
  loginRequest() async {
    try {
      var data = {
        "email": _emailcontroller.text,
        "password": _passwordcontroller.text,
      };
      final response =
          await http.post(Uri.parse("https://reqres.in/api/login"), body: data);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        LocalStorage().storeToken(data['token']);

        // MaterialPageRoute(
        //   builder: (context) {
        //     return DashboardPage();
        //   },
        // );
        print(data['token']);
      } else {
        // print("object");
        print(response.body);
      }
    } on SocketException {
      print("no internet");
    }
  }

  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    return Scaffold(
        body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Welcome Back",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
          ),
          const Gap(20),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: InputFormField(
              textEditingController: _emailcontroller,
              labelText: "Email",
              hintText: "Hint Text",
            ),
          ),
          const Gap(5),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: InputFormField(
              textEditingController: _passwordcontroller,
              labelText: "Password",
              hintText: "*****",
              obscuringCharacter: "*",
              password: EnabledPassword(
                showPasswordIcon: const Icon(
                  Icons.visibility_off_sharp,
                  color: Color.fromARGB(255, 113, 162, 211),
                ),
                hidePasswordIcon: const Icon(
                  Icons.visibility,
                  color: Color.fromARGB(255, 7, 185, 255),
                ),
              ),
              bottomMargin: 10, // Optional
            ),
          ),
          AnimatedButton(
            child: isLoading
                ? const CircularProgressIndicator()
                : const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

            onPressed: () {
              loginRequest();
            },
            width: 350,
            color: Colors.blue,
            //shadowDegree: ShadowDegree.dark,
            enabled: true,
            shape: BoxShape.rectangle,
          ),
        ],
      ),
    ));
  }
}
