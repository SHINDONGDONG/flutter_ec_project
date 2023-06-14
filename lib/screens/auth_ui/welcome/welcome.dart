import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ec_project/constants/asset_images.dart';
import 'package:flutter_ec_project/constants/routes.dart';
import 'package:flutter_ec_project/screens/auth_ui/login/login.dart';
import 'package:flutter_ec_project/screens/auth_ui/sign_up/sing_up.dart';
import 'package:flutter_ec_project/widgets/primary_button/primary_button.dart';
import 'package:flutter_ec_project/widgets/top_titles/top_titles.dart';
import 'package:gap/gap.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TopTitles(
                title: "Welcome2", subtitle: "Buy any item from using app2"),
            Center(
              child: Image.asset(
                AssetsImages.instance.welcomeImage,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CupertinoButton(
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  child: const Icon(
                    Icons.facebook,
                    size: 35,
                    color: Colors.blue,
                  ),
                ),
                const Gap(12),
                CupertinoButton(
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  child: Image.asset(
                    AssetsImages.instance.googleLogo,
                    scale: 30,
                  ),
                ),
              ],
            ),
            const Gap(30),
            PrimaryButton(
              title: 'Login',
              onPressed: () {
                Routes.instance.push(widget: const Login(), context: context);
              },
            ),
            const Gap(10),
            PrimaryButton(
              title: 'Sign Up',
              onPressed: () {
                Routes.instance.push(widget: const SignUp(), context: context);
              },
            ),
          ],
      ),
    ),
        ));
  }
}
