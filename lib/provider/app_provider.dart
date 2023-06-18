import 'package:flutter/material.dart';
import 'package:flutter_ec_project/models/product_model/product.dart';

class AppProvider with ChangeNotifier {
  Set<ProductModel> _cartProductList ={};

  void addCartProduct(ProductModel productModel) {
    _cartProductList.add(productModel);
    notifyListeners();
  }

  void removeCartProduct(ProductModel productModel){
    _cartProductList.remove(productModel);
    notifyListeners();
  }

  Set<ProductModel> get getCartProductList => _cartProductList;
}