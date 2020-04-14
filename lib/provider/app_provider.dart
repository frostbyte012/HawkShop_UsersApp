import 'package:flutter/material.dart' ;
import 'package:flutterapp/databases/fetch_products.dart';
import 'package:flutterapp/databases/products.dart';


class AppProvider with ChangeNotifier{
  List<Product> _featureProducts = [];
  ProductsService _productsService = ProductsService();

  AppProvider(){
    _getFeaturedProducts();
  }

  //getter
  List<Product> get featureProducts => _featureProducts;

  //methods
  void _getFeaturedProducts() async{
    _featureProducts = await _productsService.getFeaturedProducts();
    notifyListeners();
  }
}