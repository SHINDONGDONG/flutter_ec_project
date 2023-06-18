import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ec_project/models/product_model/product.dart';

class SingleCartItemState extends StatefulWidget {
  final ProductModel singleProduct;

  const SingleCartItemState({Key? key, required this.singleProduct}) : super(key: key);

  @override
  State<SingleCartItemState> createState() => _SingleCartItemState();
}

class _SingleCartItemState extends State<SingleCartItemState> {
  int qty = 0;

  @override
  Widget build(BuildContext context) {
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
                  child: Row(
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
                            onPressed: () {},
                            child: const Text(
                              "Add to wishlist",
                              style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold),
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
                )),
          )
        ],
      ),
    );
  }
}
