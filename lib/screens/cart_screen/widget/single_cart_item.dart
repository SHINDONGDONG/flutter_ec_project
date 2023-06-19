import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ec_project/constants/constants.dart';
import 'package:flutter_ec_project/models/product_model/product.dart';
import 'package:flutter_ec_project/provider/app_provider.dart';
import 'package:provider/provider.dart';

class SingleCartItemState extends StatefulWidget {
  final ProductModel singleProduct;

  const SingleCartItemState({Key? key, required this.singleProduct}) : super(key: key);

  @override
  State<SingleCartItemState> createState() => _SingleCartItemState();
}

class _SingleCartItemState extends State<SingleCartItemState> {
  late int qty;

  @override
  void initState() {
    qty = widget.singleProduct.qty?? 1;
    setState(() {

    });
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context, listen: false);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.red, width: 3),
      ),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 140,
              child: Image.network(
                widget.singleProduct.image,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: SizedBox(
                child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.singleProduct.name,
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                CupertinoButton(
                                  onPressed: qty==0 ? null : () {
                                    setState(() {
                                      if (qty > 0) {
                                        qty--;
                                      }
                                    });
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: qty == 0 ? Colors.red.shade300 : null,
                                    maxRadius: 13,
                                    child: const Icon(Icons.remove),
                                  ),
                                ),
                                Text(
                                  qty.toString(),
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                CupertinoButton(
                                  child: const CircleAvatar(
                                    maxRadius: 13,
                                    child: Icon(Icons.add),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      qty++;
                                    });
                                  },
                                ),
                              ],
                            ),
                            CupertinoButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                if(!appProvider.getFavouriteProductList.contains(widget.singleProduct)) {
                                  appProvider.addFavouriteProduct(widget.singleProduct);
                                  showMessage("Added to wishlist");
                                }else {
                                  appProvider.removeFavouriteProduct(widget.singleProduct);
                                  showMessage("Removed to wishlist");
                                }

                              },
                              child: Text(
                                appProvider.getFavouriteProductList.contains(widget.singleProduct)
                                ? "Remove to wishlist"
                                : "Add to wishlist",
                                style: const TextStyle(
                                    fontSize: 12.0, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "\$${widget.singleProduct.price}",
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {

                        appProvider.removeCartProduct(widget.singleProduct);
                        showMessage("Removed from cart!");
                      },
                      child: CircleAvatar(
                        maxRadius: 13,
                        child: Icon(Icons.delete,size: 17,),
                      ),
                    ),
                  ],
                ),
                  ),
            ),
          )
        ],
      ),
    );
  }
}
