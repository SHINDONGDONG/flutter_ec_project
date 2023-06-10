import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ec_project/constants/asset_images.dart';
import 'package:gap/gap.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(kToolbarHeight + 12),
          Text(
            'Welcome',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Gap(12),
          Text(
            'Buy any item from using app',
          ),
          Center(
            child: Image.asset(
              AssetsImages.instance.welcomeImage,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoButton(
                onPressed: (){},
                padding: EdgeInsets.zero,
                child: const Icon(Icons.facebook,
                size: 35,
                color: Colors.blue,
                ),
              ),
              const Gap(12),
              CupertinoButton(
                onPressed: (){},
                padding: EdgeInsets.zero,
                child: Image.asset(
                  AssetsImages.instance.googleLogo,
                  scale: 30,
                ),
              ),
            ],
          ),
          const Gap(10),
          SizedBox(
            height: 45,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Login'),
            ),
          ),
        ],
      ),
    ));
  }
}
