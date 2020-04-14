import 'dart:async';
import 'package:flutterapp/databases/fetch_products.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductsService{
  Firestore _firestore = Firestore.instance;
  String collection = 'products';

   Future<List<Product>> getFeaturedProducts() =>
      _firestore.collection(collection).getDocuments().then((snap){
        List<Product> featuredProducts = [];

        for(DocumentSnapshot item in snap.documents){
          featuredProducts.add(Product.fromSnapshot(item));
        }
        //snap.documents.map((snapshot) => featuredProducts.add(Product.fromSnapshot(snapshot)));
        return featuredProducts;
      });
}