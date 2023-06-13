import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ec_project/constants/routes.dart';
import 'package:flutter_ec_project/screens/auth_ui/sign_up/sing_up.dart';
import 'package:flutter_ec_project/widgets/primary_button/primary_button.dart';
import 'package:flutter_ec_project/widgets/top_titles/top_titles.dart';
import 'package:gap/gap.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isShowPassword = true;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TopTitles(title: "Login",subtitle: "Welcome back To E Commerce App",
            ),
            const Gap(46.0),
            TextFormField(
              decoration: const InputDecoration(
                hintText: "E-Mail",
                prefixIcon: Icon(
                  Icons.email_outlined,
                ),
              ),
            ),
            const Gap(12.0),
            TextFormField(
              obscureText: isShowPassword,
              decoration: InputDecoration(
                hintText: "Password",
                prefixIcon: const Icon(
                  Icons.password_sharp,
                ),
                suffixIcon: CupertinoButton(
                  onPressed: (){
                    setState(() {
                      isShowPassword = !isShowPassword;
                    });
                  },
                  padding: EdgeInsets.zero,
                  child: Icon(
                    isShowPassword ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            const Gap(36.0),
            PrimaryButton(title: "Login", onPressed: (){
            }),
            const Gap(12.0),
            const Center(child: Text("Dont't have an account?"),),
            const Gap(12.0),
            Center(
              child: CupertinoButton(
                child: Text(
                  "Create an account",
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                onPressed: () {
                  Routes.instance.push(widget: const SignUp(), context: context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
