// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_ec_project/provider/app_provider.dart';
// import 'package:flutter_ec_project/widgets/primary_button/primary_button.dart';
// import 'package:gap/gap.dart';
// import 'package:provider/provider.dart';
//
// class AccountScreen extends StatelessWidget {
//   const AccountScreen({Key? key}) : super(key: key);
//
//
//   @override
//   Widget build(BuildContext context) {
//     AppProvider appProvider = Provider.of<AppProvider>(context);
//
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: Text("Account", style: TextStyle(color: Colors.black.withOpacity(0.6),),),
//       ),
//       body: Flex(
//         direction: Axis.vertical,
//         children: [
//           Expanded(
//             flex: 1,
//             child: Container(
//               alignment: Alignment.center,
//               child: Column(
//                 children: [
//                   appProvider.getUserInformation.image == null ?
//                   Icon(
//                     Icons.person_outline,
//                     size: 150,
//                   ) : Image.network(appProvider.getUserInformation.image!),
//                   Text(
//                     appProvider.getUserInformation.name,
//                     style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//                   ),
//                   Text(
//                     appProvider.getUserInformation.email,
//                   ),
//                   const Gap(12),
//                   SizedBox(
//                     width: 130,
//                     child: PrimaryButton(title: "Edit Profile", onPressed: () {}),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Expanded(
//             flex: 1,
//             child: Container(
//               child: Column(
//                 children: [
//                   ListTile(
//                     onTap: (){},
//                     leading: Icon(Icons.shopping_bag),
//                     title: Text("Your Orders"),
//                   ),
//                   ListTile(
//                     onTap: (){},
//                     leading: Icon(Icons.favorite_outline),
//                     title: Text("Favourite"),
//                   ),
//                   ListTile(
//                     onTap: (){},
//                     leading: Icon(Icons.info),
//                     title: Text("About us"),
//                   ),
//                   ListTile(
//                     onTap: (){},
//                     leading: Icon(Icons.support_outlined),
//                     title: Text("Support"),
//                   ),
//                   ListTile(
//                     onTap: (){
//                       FirebaseAuth.instance.signOut()
// ;                    },
//                     leading: Icon(Icons.exit_to_app),
//                     title: Text("Log out"),
//                   ),
//                   Text("Verson 1.0.0"),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ec_project/provider/app_provider.dart';
import 'package:flutter_ec_project/widgets/primary_button/primary_button.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Account",
          style: TextStyle(
            color: Colors.black.withOpacity(0.6),
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      appProvider.getUserInformation.image == null
                          ? Icon(
                        Icons.person_outline,
                        size: 150,
                      )
                          : Image.network(appProvider.getUserInformation.image!),
                      Text(
                        appProvider.getUserInformation.name,
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        appProvider.getUserInformation.email,
                      ),
                      const Gap(12),
                      SizedBox(
                        width: 130,
                        child: PrimaryButton(
                          title: "프로필 편집",
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      ListTile(
                        onTap: () {},
                        leading: Icon(Icons.shopping_bag),
                        title: Text("주문 내역"),
                      ),
                      ListTile(
                        onTap: () {},
                        leading: Icon(Icons.favorite_outline),
                        title: Text("즐겨찾기"),
                      ),
                      ListTile(
                        onTap: () {},
                        leading: Icon(Icons.info),
                        title: Text("회사 소개"),
                      ),
                      ListTile(
                        onTap: () {},
                        leading: Icon(Icons.support_outlined),
                        title: Text("고객 지원"),
                      ),
                      ListTile(
                        onTap: () {
                          FirebaseAuth.instance.signOut();
                        },
                        leading: Icon(Icons.exit_to_app),
                        title: Text("로그아웃"),
                      ),
                      Text("버전 1.0.0"),
                      const Gap(20),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
