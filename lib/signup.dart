import 'package:flutter/material.dart';
import 'package:login_page/login.dart';
import 'package:login_page/main.dart';
import 'txtfld.dart';
import 'Rbutton.dart';
import 'dart:io';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
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
  List<Color> passwd_clr = [
    Colors.black.withOpacity(0.5),
    Colors.red,
    Colors.green
  ];
  int inital_passwd_clr_len = 0;
  int inital_passwd_clr_caps = 0;
  int inital_passwd_clr_small = 0;
  int inital_passwd_clr_specialchar = 0;
  int inital_passwd_clr_noAsterisk = 0;

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

  void passwordValidator(password) {
    String pass = password;
    bool length_ok = false; //done
    bool CapAtLeast2 = false;
    bool SmallLet = false;
    bool specialChars = false;
    bool asterisk = false;

    if (pass.toString().length >= 5 && pass.toString().length <= 50) {
      length_ok = true;
    } else {
      length_ok = false;
    }
    CapAtLeast2 = hasTwoCapitals(pass);
    SmallLet = hasSmallLetter(pass);
    specialChars = hasSpecialCharacter(pass);
    asterisk = hasNoAsterisk(pass);
    if (length_ok) {
      inital_passwd_clr_len = 2;
    } else {
      inital_passwd_clr_len = 1;
    }
    if (CapAtLeast2) {
      inital_passwd_clr_caps = 2;
    } else {
      inital_passwd_clr_caps = 1;
    }
    if (SmallLet) {
      inital_passwd_clr_small = 2;
    } else {
      inital_passwd_clr_small = 1;
    }
    if (specialChars) {
      inital_passwd_clr_specialchar = 2;
    } else {
      inital_passwd_clr_specialchar = 1;
    }
    if (asterisk) {
      inital_passwd_clr_noAsterisk = 2;
    } else {
      inital_passwd_clr_noAsterisk = 1;
    }
  }

  bool hasTwoCapitals(String password) {
    final regex = RegExp(r'[A-Z]{2,2}');
    return regex.hasMatch(password);
  }

  bool hasSmallLetter(String password) {
    final RegExp regex = RegExp(r"[a-z]");
    return regex.hasMatch(password);
  }

  bool hasSpecialCharacter(String password) {
    final RegExp regex =
        RegExp(r"[!@#$%^&().,-_=+{}\|;':<>/?]"); // Excludes asterisk
    return regex.hasMatch(password);
  }

  bool hasNoAsterisk(String password) {
    final RegExp regex = RegExp(r"\*");
    return !regex.hasMatch(password); // Using negation for "no asterisk"
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Sign up",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          const SizedBox(
            width: 15,
          ),
          CircleAvatar(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                child: const Icon(Icons.exit_to_app_rounded),
                onTap: () {},
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          CircleAvatar(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                child: const Icon(Icons.help_center_rounded),
                onTap: () {},
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: height,
          width: width,
          color: Colors.pink.withOpacity(0.4),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // SizedBox(
                //   height: height / 16,
                // ),
                const Text(
                  "Sign up",
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

                const SizedBox(
                  height: 10,
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
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: height / 5,
                  width: width / 2.2,
                  //color: Colors.yellow,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      padedText(
                        text: "Note: Password Guidance",
                        color: Colors.white,
                      ),
                      padedText(
                        text: "-Between 5 and 50 charcaters.",
                        color: passwd_clr[inital_passwd_clr_len],
                      ),
                      padedText(
                        text: "-Must contain at least two capital letters",
                        color: passwd_clr[inital_passwd_clr_caps],
                      ),
                      padedText(
                        text: "-Must contain at least one small letter",
                        color: passwd_clr[inital_passwd_clr_small],
                      ),
                      padedText(
                        text:
                            "-Must contain at least one special character(@,#,...) except '*'",
                        color: passwd_clr[inital_passwd_clr_specialchar],
                      ),
                      padedText(
                        text: "-Must not contain '*'",
                        color: passwd_clr[inital_passwd_clr_noAsterisk],
                      ),
                    ],
                  ),
                ),
                RtBB(
                    widget: const Text("Sign up"),
                    onPressed: () {
                      setState(() {
                        emailValidator(emailController.text);
                        passwordValidator(passwordController.text);
                      });
                    }),
                SizedBox(
                  height: height / 60,
                ),
                InkWell(
                  child: const Text("Login instead!"),
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyHomePage(
                                  title: "Login",
                                )));
                  },
                ),
                SizedBox(
                  height: height / 8,
                ),
                // SizedBox(
                //   height: height / 8,
                // ),
              ],
            ),
          ),
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
