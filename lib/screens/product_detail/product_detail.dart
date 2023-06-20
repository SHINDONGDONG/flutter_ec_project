import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ec_project/constants/constants.dart';
import 'package:flutter_ec_project/constants/routes.dart';
import 'package:flutter_ec_project/models/product_model/product.dart';
import 'package:flutter_ec_project/provider/app_provider.dart';
import 'package:flutter_ec_project/screens/cart_screen/cart_screen.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatefulWidget {
  final ProductModel singleProduct;
  const ProductDetails({Key? key, required this.singleProduct}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {

  int qty = 1;
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Routes.instance
                  .push(widget: const CartScreen(), context: context);
            },
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Image.network(
                  widget.singleProduct.image,
                  fit: BoxFit.contain,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.singleProduct.name,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          widget.singleProduct.isFavourite = !widget.singleProduct.isFavourite;
                        });
                        if(widget.singleProduct.isFavourite){
                          appProvider.addFavouriteProduct(widget.singleProduct);
                        }else{
                          appProvider.removeFavouriteProduct(widget.singleProduct);
                        }
                      },
                      icon: Icon(appProvider.getFavouriteProductList.contains(widget.singleProduct)
                          ? Icons.favorite
                          : Icons.favorite_border),
                    ),
                  ],
                ),

              Text(widget.singleProduct.description),
              const Gap(12.0),
              Row(
                children: [
                  CupertinoButton(
                    disabledColor: Colors.grey,
                    padding: EdgeInsets.zero,
                    onPressed: qty == 1 ? null :
                        () {
                      setState(() {
                        if(qty > 1) {
                          qty --;
                        }
                      });
                    },
                    child: CircleAvatar(
                      backgroundColor: qty == 1 ? Colors.red.shade300 : null,
                      child: const Icon(Icons.remove,),
                    ),
                  ),
                  const Gap(12),
                  Text(
                    qty.toString(),
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const Gap(12),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      setState(() {
                        qty ++;
                      });
                    },
                    child: const CircleAvatar(
                      child: Icon(Icons.add),
                    ),
                  ),
                ],
              ),
              // const Spacer(),
              const Gap(24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      AppProvider appProvider = Provider.of<AppProvider>(context,listen: false);
                      ProductModel productModel = widget.singleProduct.coptyWith(qty: qty);
                      appProvider.addCartProduct(productModel);
                      showMessage("added to cart");
                    },
                    child: const Text("Add to cart"),
                  ),
                  const Gap(20),
                  SizedBox(
                    height: 38,
                    width: 140,
                    child: ElevatedButton(
                      onPressed: () {
                        // Routes.instance.push(
                        //     widget: const FavouriteScreen(), context: context);
                      },
                      child: const Text("Buy"),
                    ),
                  ),
                ],
              ),
              const Gap(50),
            ],
          ),
        ),
      ),
    );
  }
}
