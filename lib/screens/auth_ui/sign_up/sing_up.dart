import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ec_project/constants/constants.dart';
import 'package:flutter_ec_project/constants/routes.dart';
import 'package:flutter_ec_project/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:flutter_ec_project/screens/auth_ui/login/login.dart';
import 'package:flutter_ec_project/screens/home/home.dart';
import 'package:flutter_ec_project/widgets/primary_button/primary_button.dart';
import 'package:flutter_ec_project/widgets/top_titles/top_titles.dart';
import 'package:gap/gap.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isShowPassword = true;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopTitles(title: "Create Account", subtitle: "Welcome to Store"),
              const Gap(46.0),
              TextField(
                controller: name,
                decoration: InputDecoration(
                  hintText: "Name",
                  prefixIcon: Icon(Icons.person_outline),
                ),
              ),
              const Gap(12.0),
              TextField(
                controller: email,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "E-mail",
                  prefixIcon: Icon(Icons.email_outlined),
                ),
              ),
              const Gap(12.0),
              TextField(
                controller: phone,
                decoration: InputDecoration(
                  hintText: "Phone",
                  prefixIcon: Icon(Icons.phone_outlined),
                ),
              ),
              const Gap(12.0),
              TextField(
                controller: password,
                obscureText: isShowPassword,
                decoration: InputDecoration(
                  hintText: "Password",
                  prefixIcon: const Icon(Icons.password_sharp),
                  suffixIcon: CupertinoButton(onPressed: () {
                    setState(() {
                      isShowPassword = !isShowPassword;
                    });
                  },
                      child: Icon(
                        isShowPassword ? Icons.visibility : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                    )
                ),
              ),
              const Gap(48.0),
              PrimaryButton(
                title: "Create an Account",
                onPressed: () async {
                  bool isVaildated = signUpVaildation(email.text, password.text, name.text, phone.text);
                  if(isVaildated) {
                    bool isLogined = await FirebaseAuthHelper.instance.signUp(email.text, password.text, context);
                    if(isLogined) {
                      //PushandRemoveUntil은
                      Routes.instance.pushAndRemoveUntil(widget: const Home(), context: context);
                    }
                  }
                },
              ),
              const Gap(12.0),
              const Center(child: Text("I have already an account"),),
              Center(child: CupertinoButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                child: Text(
                  "Login",style: TextStyle(
                  color: Theme.of(context).primaryColor
                ),
                ),
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
