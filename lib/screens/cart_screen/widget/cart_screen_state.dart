import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingleCartItemState extends StatefulWidget {
  const SingleCartItemState({Key? key}) : super(key: key);

  @override
  State<SingleCartItemState> createState() => _SingleCartItemState();
}

class _SingleCartItemState extends State<SingleCartItemState> {
  int qty = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.red, width: 3),
      ),
      child: Container(
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 140,
                child: Image.network(
                  "https://www.pngplay.com/wp-content/uploads/8/USB-Pen-Drive-PNG-Clipart-Background.png",
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: SizedBox(
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Flash",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                CupertinoButton(
                                  child: CircleAvatar(
                                    backgroundColor: qty == 0 ? Colors.red.shade300 : null,
                                    maxRadius: 13,
                                    child: const Icon(Icons.remove),
                                  ),
                                  onPressed: qty==0 ? null : () {
                                    setState(() {
                                      if (qty > 0) {
                                        qty--;
                                      }
                                    });
                                  },
                                ),
                                Text(
                                  qty.toString(),
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                CupertinoButton(
                                  child: CircleAvatar(
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
                              child: Text(
                                "Add to wishlist",
                                style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "\$233",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
