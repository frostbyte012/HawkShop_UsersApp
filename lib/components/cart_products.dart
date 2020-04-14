import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartProducts extends StatefulWidget {
  @override
  _CartProductsState createState() => _CartProductsState();
}

class _CartProductsState extends State<CartProducts> {
  var products_on_cart = [
    {
      "name": "Blazzer",
      "picture": "images/products/blazer1.jpeg",
      "price": 75,
      "size": "M",
      "color": "Black",
      "quantity": 1,
    },
    {
      "name": "Red Dress",
      "picture": "images/products/dress1.jpeg",
      "price": 55,
      "size": "L",
      "color": "Red",
      "quantity": 1,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products_on_cart.length,
      // ignore: missing_return
      itemBuilder: (context, index) {
        return SingleCartProduct(
          cart_prod_name: products_on_cart[index]["name"],
          cart_prod_color: products_on_cart[index]["color"],
          cart_prod_qty: products_on_cart[index]["quantity"],
          cart_prod_size: products_on_cart[index]["size"],
          cart_prod_price: products_on_cart[index]["price"],
          cart_prod_picture: products_on_cart[index]["picture"],
        );
      },
    );
  }
}

class SingleCartProduct extends StatelessWidget {
  final cart_prod_name;
  final cart_prod_picture;
  final cart_prod_price;
  final cart_prod_size;
  final cart_prod_color;
  final cart_prod_qty;

  SingleCartProduct(
      {this.cart_prod_name,
      this.cart_prod_picture,
      this.cart_prod_price,
      this.cart_prod_size,
      this.cart_prod_color,
      this.cart_prod_qty});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(

        // leading section
        leading: Image.asset(
          cart_prod_picture,
          width: 75.0,
          height: 75.0,
        ),

        // title section
        title: Text(cart_prod_name),

        // subtitle section
        subtitle: Column(
          children: <Widget>[
            //Row inside Column
            Row(
              children: <Widget>[
                // product size :
                Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Text("Size : ")),
                Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Text(cart_prod_size)),

                // product color :
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
                  child: Text("Color :"),
                ),
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Text(cart_prod_color),
                ),

//                // product quantity
//                Padding(
//                  padding: const EdgeInsets.fromLTRB(8.0, 4.0, 4.0, 4.0),
//                  child: Text("Qty : "),
//                ),
//                Padding(
//                  padding: const EdgeInsets.all(2.0),
//                  child: Text("1"), // ***************** error here ****************
//                ),
              ],
            ),

            // product prize section :
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                "\$$cart_prod_price",
                style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),

//        trailing: Column(
//           children: <Widget>[
//             IconButton(icon: Icon(Icons.arrow_drop_up), alignment: Alignment.topLeft, onPressed: (){},),
//             new Text("$cart_prod_qty"),
//             IconButton(icon: Icon(Icons.arrow_drop_down), alignment: Alignment.bottomLeft, onPressed: (){},),
//           ],
//        ),
      ),
    );
  }
//
//  void AddQuantity(){
//    cart_prod_qty = cart_prod_qty + 1;
//  }
}
