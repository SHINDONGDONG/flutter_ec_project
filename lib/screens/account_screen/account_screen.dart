import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ec_project/widgets/primary_button/primary_button.dart';
import 'package:gap/gap.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Account", style: TextStyle(color: Colors.black.withOpacity(0.6),),),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Icon(
                    Icons.person_outline,
                    size: 150,
                  ),
                  Text(
                    "Sabir bugti",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "shin@gmail.com",
                  ),
                  const Gap(12),
                  SizedBox(
                    width: 130,
                    child: PrimaryButton(title: "Edit Profile", onPressed: () {}),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: Column(
                children: [
                  ListTile(
                    onTap: (){},
                    leading: Icon(Icons.shopping_bag),
                    title: Text("Your Orders"),
                  ),
                  ListTile(
                    onTap: (){},
                    leading: Icon(Icons.favorite_outline),
                    title: Text("Favourite"),
                  ),
                  ListTile(
                    onTap: (){},
                    leading: Icon(Icons.info),
                    title: Text("About us"),
                  ),
                  ListTile(
                    onTap: (){},
                    leading: Icon(Icons.support_outlined),
                    title: Text("Support"),
                  ),
                  ListTile(
                    onTap: (){
                      FirebaseAuth.instance.signOut()
;                    },
                    leading: Icon(Icons.exit_to_app),
                    title: Text("Log out"),
                  ),
                  Text("Verson 1.0.0"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
