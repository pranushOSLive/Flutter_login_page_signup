import 'package:flutter/material.dart';
import 'package:flutter_logs/flutter_logs.dart';
import 'package:login_page/signup.dart';
import 'txtfld.dart';
import 'Rbutton.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({Key? key}) : super(key: key);

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  bool abscureText = false;
  List emailErrorInfomation = [
    " ",
    "Invalid email",
    "please enter email",
    "valid email",
  ];
  int emailstatus = 0;

  Map<String, dynamic> emailValidator(email) {
    dynamic text = email;
    Map<String, dynamic> res = {"status": "", "err": ""};
    bool containsAt = false;
    for (var i = 0; i < email.toString().length; i++) {
      if (text[i] == "@") {
        containsAt = true;
      }
    }
    if (text == "") {
      emailstatus = 2;
      return {"status": 2, "err": "No email provided!"};
    } else if (text != "" && containsAt == false) {
      emailstatus = 1;
    } else {
      emailstatus = 3;
    }

    return res;
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      height: height,
      width: width,
      color: Colors.pink.withOpacity(0.4),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: height / 16,
            ),
            const Text(
              "Login",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: height / 20,
            ),
            Rtxtf(
              focus: true,
              controller: emailController,
              type: TextInputType.text,
              // Here obscureText set to ture because it's field type wad password.
              obscureText: false,
              hint: "email",
            ),
            SizedBox(
              width: width / 2.2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  padedText(
                      text: emailErrorInfomation[emailstatus],
                      color: emailstatus == 3 ? Colors.green : Colors.red),
                ],
              ),
            ),
            SizedBox(
              height: height / 20,
            ),
            Rtxtf(
              focus: false,
              wid: InkWell(
                onTap: () {
                  setState(() {
                    if (abscureText == true) {
                      abscureText = false;
                    } else {
                      abscureText = true;
                    }
                  });
                },
                child: const Icon(Icons.remove_red_eye_outlined),
              ),
              controller: passwordController,
              type: TextInputType.text,
              // Here obscureText set to ture because it's field type wad password.
              obscureText: abscureText,
              hint: "password",
            ),
            SizedBox(
              width: width / 2.2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  padedText(
                      text: "enter password",
                      color: emailstatus == 3 ? Colors.green : Colors.red),
                ],
              ),
            ),
            SizedBox(
              height: height / 30,
            ),
            RtBB(
                widget: Text("Login"),
                onPressed: () {
                  setState(() {
                    emailValidator(emailController.text);
                  });
                }),
            SizedBox(
              height: height / 50,
            ),
            InkWell(
              child: const Text("Sign up instead!"),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const Signup()));
              },
            ),
            SizedBox(
              height: height / 8,
            ),
            SizedBox(
              height: height / 8,
            ),
            SizedBox(
              height: height / 8,
            ),
          ],
        ),
      ),
    );
  }
}

class padedText extends StatelessWidget {
  Color color;
  String text;
  padedText({
    Key? key,
    required this.text,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 2.0, 0.0, 0.0),
      child: Text(
        text,
        textAlign: TextAlign.left,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 12,
          color: color,
        ),
      ),
    );
  }
}
