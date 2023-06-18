import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ec_project/constants/routes.dart';
import 'package:flutter_ec_project/firebase_helper/firebase_store/firebase_firestore.dart';
import 'package:flutter_ec_project/models/category_model/category_model.dart';
import 'package:flutter_ec_project/models/product_model/product.dart';
import 'package:flutter_ec_project/screens/category_view/caregory_view.dart';
import 'package:flutter_ec_project/screens/product_detail/product_detail.dart';
import 'package:flutter_ec_project/widgets/top_titles/top_titles.dart';
import 'package:gap/gap.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categoriesList = [];
  List<ProductModel> productsList = [];

  bool isLoading = false;
  @override
  void initState() {
    getCategoryList();
    super.initState();
  }

  void getCategoryList() async {
    setState(() {
      isLoading = true;
    });
    categoriesList = await FirebaseFirestoreHelper.instance.getCategories();
    productsList = await FirebaseFirestoreHelper.instance.getBestProducts();
    //리스트를 셔플해서 출력해준다.
    productsList.shuffle();
    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TopTitles(title: "E commerce", subtitle: ""),
                  TextField(
                    decoration: InputDecoration(hintText: "Search..."),
                  ),
                ],
              ),
            ),
            const Gap(12),
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                "Categories",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: categoriesList.isEmpty
                    ? const Center(
                        child: Text("Categories is Empty"),
                      )
                    : SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                      children: categoriesList
                          .map(
                            (e) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CupertinoButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  Routes.instance.push(
                                      widget: CategoryView(
                                          categoryModel: e,),
                                      context: context);
                                },
                                child: Card(
                                  color: Colors.white,
                                  elevation: 3,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: SizedBox(
                                      height: 100,
                                      width: 100,
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.network(e.image)),
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList()),
                )),
            const Padding(
              padding: EdgeInsets.only(top: 12,left: 12),
              child: Text(
                "Best Products",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            const Gap(12),
            productsList.isEmpty
                ? const Center(
                    child: Text("Best Product is empty"),
                  )
                : Padding(
                    padding: const EdgeInsets.all(12.0),
              child: GridView.builder(
                padding: const EdgeInsets.only(left: 20,right: 20),
                  shrinkWrap: true,
                  primary: false,
                  itemCount: productsList.length,
                  gridDelegate:
                      //그리드의 갯수
                      const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          //위아래
                          mainAxisSpacing: 20,
                          //양옆
                          crossAxisSpacing: 20,
                          childAspectRatio: 0.7,
                      ),
                  itemBuilder: (ctx, index) {
                    ProductModel singleProduct = productsList[index];
                    return Container(
                      decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.network(
                            singleProduct.image,
                            width: 100,
                            height: 100,
                          ),
                          const Gap(12),
                          Center(
                            child: Text(
                              singleProduct.name,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text("Price : \$${singleProduct.price}"),
                          const Gap(12),
                          SizedBox(
                            width: 140,
                            height: 45,
                            child: OutlinedButton(
                              onPressed: () {
                                      Routes.instance.push(
                                          widget: ProductDetails(
                                            singleProduct: singleProduct,
                                          ),
                                          context: context);
                                    },
                              child: const Text(
                                "Buy",
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          const Gap(12.0),
          ],
        ),
      ),
    );
  }
}
