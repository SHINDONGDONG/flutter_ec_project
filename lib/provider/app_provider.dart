import 'package:flutter/material.dart';
import 'package:flutter_ec_project/models/product_model/product.dart';

class AppProvider with ChangeNotifier {

  //카트쪽 로직
  final Set<ProductModel> _cartProductList ={};

  void addCartProduct(ProductModel productModel) {
    _cartProductList.add(productModel);
    notifyListeners();
  }

  void removeCartProduct(ProductModel productModel){
    _cartProductList.remove(productModel);
    notifyListeners();
  }

  Set<ProductModel> get getCartProductList => _cartProductList;

  //////////////////즐겨찾기/////////////////////////
  final List<ProductModel> _favouriteProductList = [];

  void addFavouriteProduct(ProductModel productModel) {
    _favouriteProductList.add(productModel);
    notifyListeners();
  }

  void removeFavouriteProduct(ProductModel productModel) {
    _favouriteProductList.remove(productModel);
    notifyListeners();
  }
  List<ProductModel> get getFavouriteProductList => _favouriteProductList;


}


