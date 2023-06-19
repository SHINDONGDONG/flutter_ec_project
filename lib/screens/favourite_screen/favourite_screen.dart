import 'package:flutter/material.dart';
import 'package:flutter_ec_project/provider/app_provider.dart';
import 'package:flutter_ec_project/screens/favourite_screen/widget/single_favourite_item.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
  final AppProvider appProvider = Provider.of<AppProvider>(context);
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: black,
        title: const Text(
          "Favourite Screen",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: appProvider.getFavouriteProductList.isEmpty
          ? const Center(
        child: Text("Empty"),
      )
          : ListView.builder(
          itemCount: appProvider.getFavouriteProductList.length,
          padding: const EdgeInsets.all(12),
          itemBuilder: (ctx, index) {
            return SingleFavouriteItemState(singleProduct: appProvider.getFavouriteProductList[index]);
          }),
    );
  }
}
