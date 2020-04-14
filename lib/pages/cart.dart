import 'package:flutter/material.dart';
import 'package:flutterapp/components/cart_products.dart';
import 'package:flutterapp/components/search.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.black45,
        title: Text("Shopping Cart"),
        actions: <Widget>[
          new IconButton(
              icon: Icon(Icons.search),
              color: Colors.white70,
              onPressed: () {
                showSearch(context: context, delegate: CustomSearchDelegate());
              }),
          //new IconButton(icon: Icon(Icons.shopping_cart), onPressed: (){}),
        ],
      ),

      //body for cart page
      body: new CartProducts(),

      bottomNavigationBar: new Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(child: ListTile(
              title: new Text("Total : "),
              subtitle: new Text("\$230"),
            )),

            Expanded(
                child: MaterialButton(onPressed: () {},
                  child: new Text("Checkout",
                    style: TextStyle(color: Colors.white),),
                  color: Colors.black45,
            )),
          ],
        ),
      ),
    );
  }
}
