/*
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_ec_project/constants/constants.dart';
import 'package:flutter_ec_project/models/category_model/category_model.dart';
import 'package:flutter_ec_project/models/product_model/product.dart';
import 'package:flutter_ec_project/screens/home/home.dart';


class FirebaseFirestoreHelper {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  static FirebaseFirestoreHelper instance = FirebaseFirestoreHelper();
  Future<List<CategoryModel>> getCategories() async {
    try {

      //firebase store에서의 categories를 get해옴.
      QuerySnapshot<Map<String,dynamic>> querySnapshot =
          await _firebaseFirestore.collection("categories").get();

      //get한 categories를 json에서 data로 바꾼다.
      List<CategoryModel> categoriesList = querySnapshot.docs
      .map((e) => CategoryModel.fromJson(e.data()))
      .toList();

      return categoriesList;

    } catch (e){
      showMessage(e.toString());
      return [];
    }
  }

  Future<List<ProductModel>> getbestProducts() async {
    try{
      QuerySnapshot<Map<String,dynamic>> querySnapshot =
          await _firebaseFirestore.collectionGroup("products").get();

      List<ProductModel> productModelList = querySnapshot.docs
      .map((e) => ProductModel.fromJson(e.data()))
      .toList();
      return productModelList;
    }catch (e) {
      showMessage(e.toString());
      return [];
    }
  }
}*/


// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_ec_project/constants/constants.dart';
import 'package:flutter_ec_project/models/category_model/category_model.dart';
import 'package:flutter_ec_project/models/product_model/product.dart';

class FirebaseFirestoreHelper {
  static FirebaseFirestoreHelper instance = FirebaseFirestoreHelper();
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  Future<List<CategoryModel>> getCategories() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
      await _firebaseFirestore.collection("categories").get();

      List<CategoryModel> categoriesList = querySnapshot.docs
          .map((e) => CategoryModel.fromJson(e.data()))
          .toList();

      return categoriesList;
    } catch (e) {
      showMessage(e.toString());
      return [];
    }
  }

  Future<List<ProductModel>> getBestProducts() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
      await _firebaseFirestore.collectionGroup("products").get();

      List<ProductModel> productModelList = querySnapshot.docs
          .map((e) => ProductModel.fromJson(e.data()))
          .toList();

      return productModelList;
    } catch (e) {
      showMessage(e.toString());
      return [];
    }
  }

  Future<List<ProductModel>> getCategoryViewProduct(String id) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
      await _firebaseFirestore
          .collection("categories")
          .doc(id)
          .collection("products")
          .get();

      List<ProductModel> productModelList = querySnapshot.docs
          .map((e) => ProductModel.fromJson(e.data()))
          .toList();

      return productModelList;
    } catch (e) {
      showMessage(e.toString());
      return [];
    }
  }
}