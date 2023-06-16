import 'dart:core';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_ec_project/constants/constants.dart';
import 'package:flutter_ec_project/models/product_model/product.dart';
import 'package:flutter_ec_project/widgets/top_titles/top_titles.dart';
import 'package:gap/gap.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

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
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      children: categoriesList
                          .map(
                            (e) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                color: Colors.white,
                                elevation: 6,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: SizedBox(
                                    height: 100,
                                    width: 100,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.network(e)),
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
            GridView.builder(
              padding: const EdgeInsets.only(left: 20,right: 20),
                shrinkWrap: true,
                itemCount: bestProducts.length,
                gridDelegate:
                    //그리드의 갯수
                    const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        //위아래
                        mainAxisSpacing: 20,
                        //양옆
                        crossAxisSpacing: 20,
                        childAspectRatio: 0.9,
                    ),
                itemBuilder: (ctx, index) {
                  ProductModel singleProduct = bestProducts[index];
                  return Container(
                    decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Image.network(
                          singleProduct.image,
                          width: 60,
                          height: 60,
                        ),
                        const Gap(12),
                        Text(
                          singleProduct.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("Price : \$${singleProduct.price}"),
                        const Gap(12),
                        SizedBox(
                          width: 140,
                          height: 45,
                          child: OutlinedButton(
                            onPressed: () {},
                            child: const Text("Buy"),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}

List<String> categoriesList = [
  "https://cdn.pixabay.com/photo/2014/12/21/23/40/steak-575806_1280.png",
  "https://cdn.pixabay.com/photo/2022/01/19/07/18/pizza-6948995_1280.png",
  "https://png.pngtree.com/png-clipart/20190413/ourmid/pngtree-cartoon-hamburg-fries-design-material-png-image_861555.jpg",
  "https://static.vecteezy.com/system/resources/previews/004/608/055/non_2x/seblak-indonesian-food-free-vector.jpg",
  "https://w7.pngwing.com/pngs/188/638/png-transparent-bell-pepper-computer-icons-paprika-vegetable-food-vector-icons-chili-pepper.png"
];

List<ProductModel> bestProducts = [
  ProductModel(
    id: '1',
    name: 'banana',
    email: 'Email',
    price: '1512',
    description: 'this is banana',
    isFavourite: false,
    status: 'pending',
    image:
        'https://cdn.pixabay.com/photo/2014/12/21/23/40/steak-575806_1280.png',
  ),
  ProductModel(
    id: '2',
    name: 'banana',
    email: 'Email',
    price: '1512',
    description: 'this is banana',
    isFavourite: false,
    status: 'pending',
    image:
    'https://cdn.pixabay.com/photo/2022/01/19/07/18/pizza-6948995_1280.png',
  ),
  ProductModel(
    id: '3',
    name: 'banana',
    email: 'Email',
    price: '1512',
    description: 'this is banana',
    isFavourite: false,
    status: 'pending',
    image:
    'https://png.pngtree.com/png-clipart/20190413/ourmid/pngtree-cartoon-hamburg-fries-design-material-png-image_861555.jpg',
  ),
  ProductModel(
    id: '1',
    name: 'banana',
    email: 'Email',
    price: '1512',
    description: 'this is banana',
    isFavourite: false,
    status: 'pending',
    image:
    'https://cdn.pixabay.com/photo/2014/12/21/23/40/steak-575806_1280.png',
  ),
  ProductModel(
    id: '2',
    name: 'banana',
    email: 'Email',
    price: '1512',
    description: 'this is banana',
    isFavourite: false,
    status: 'pending',
    image:
    'https://cdn.pixabay.com/photo/2022/01/19/07/18/pizza-6948995_1280.png',
  ),
  ProductModel(
    id: '3',
    name: 'banana',
    email: 'Email',
    price: '1512',
    description: 'this is banana',
    isFavourite: false,
    status: 'pending',
    image:
    'https://png.pngtree.com/png-clipart/20190413/ourmid/pngtree-cartoon-hamburg-fries-design-material-png-image_861555.jpg',
  ),
];