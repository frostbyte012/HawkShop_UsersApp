import 'package:flutter/material.dart';
import 'package:flutterapp/components/search.dart';
import 'package:flutterapp/pages/home.dart';
import 'package:flutterapp/components/products.dart';

class ProductDetails extends StatefulWidget {
  final prod_details_name;
  final prod_details_id;
  final prod_details_category;
  final prod_details_price;
  final prod_details_brand;
  final prod_details_quantity;
  final prod_details_colors;
  final prod_details_onSale;
  final prod_details_featured;
  final prod_details_picture;
  final prod_details_sizes;

  ProductDetails({
    this.prod_details_name,
    this.prod_details_id,
    this.prod_details_category,
    this.prod_details_brand,
    this.prod_details_price,
    this.prod_details_quantity,
    this.prod_details_colors,
    this.prod_details_onSale,
    this.prod_details_featured,
    this.prod_details_picture,
    this.prod_details_sizes
  });

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.black45,
        title: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => new HomePage()));
            },
            child: Text("HawkShop")),
        actions: <Widget>[
          new IconButton(
              icon: Icon(Icons.search, color: Colors.white70),
              onPressed: () {
                showSearch(context: context, delegate: CustomSearchDelegate());
              }),
        ],
      ),

      // body
      body: new ListView(
        children: <Widget>[
          new Container(
            height: 280.0,
            child: GridTile(
              child: Container(
                color: Colors.white70,
                child: Image.network(
                  widget.prod_details_picture,
                ),
              ),
              footer: new Container(
                color: Colors.white70,
                child: ListTile(
                  leading: new Text(
                    widget.prod_details_name,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                  title: new Row(
                    children: <Widget>[

                      Expanded(
                          child: Center(
                            child: new Text(
                        "Price: \$${widget.prod_details_price}",
                        style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // **************The first buttons***********
          Row(
            children: <Widget>[
              // The size button
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    
                  },
                  color: Colors.white,
                  textColor: Colors.blueGrey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: new Text("Size")),
                      Expanded(child: new Icon(Icons.arrow_drop_down)),
                    ],
                  ),
                ),
              ),

              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return new AlertDialog(
                          title: new Text("Color"),
                          content: Text(widget.prod_details_colors.toString()),
                          actions: <Widget>[
                            new MaterialButton(
                              onPressed: () {
                                Navigator.of(context).pop(context);
                              },
                              child: new Text("Close"),
                            )
                          ],
                        );
                      },
                    );
                  },
                  color: Colors.white,
                  textColor: Colors.blueGrey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: new Text("Color")),
                      Expanded(child: new Icon(Icons.arrow_drop_down)),
                    ],
                  ),
                ),
              ),

              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: new Text("Quantity"),
                            content: new Text("Pick a number"),
                            actions: <Widget>[
                              new MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop(context);
                                },
                                child: new Text("Close"),
                              ),
                            ],
                          );
                        });
                  },
                  color: Colors.white,
                  textColor: Colors.blueGrey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: new Text("Qty")),
                      Expanded(child: new Icon(Icons.arrow_drop_down)),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // ********The second button********
          Row(
            children: <Widget>[
              // The size button
              Expanded(
                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.black45,
                  textColor: Colors.white70,
                  elevation: 0.2,
                  child: new Text("Buy now"),
                ),
              ),
              new IconButton(
                  icon: Icon(Icons.add_shopping_cart),
                  color: Colors.black45,
                  onPressed: () {}),
              new IconButton(
                  icon: Icon(Icons.favorite_border),
                  color: Colors.black45,
                  onPressed: () {})
            ],
          ),

          Divider(
            color: Colors.black45,
          ),
          new ListTile(
            title: new Text(
              "Product Details : ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: new Text(
                "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
          ),

          Divider(),
          new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text(
                  "Product name : ",
                  style: TextStyle(
                      color: Colors.black45, fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: new Text(widget.prod_details_name),
              )
            ],
          ),

          new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text(
                  "Product Brand : ",
                  style: TextStyle(
                      color: Colors.black45, fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: new Text("Never Heard Before"),
              )
            ],
          ),

          new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text(
                  "Product Condition : ",
                  style: TextStyle(
                      color: Colors.black45, fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: new Text("Can't Even Imagine"),
              )
            ],
          ),

          Divider(color: Colors.black45),
          Padding(
              padding: const EdgeInsets.all(10.0),
              child: new Text(
                "Similar Products : ",
                style: TextStyle(
                    color: Colors.black87, fontWeight: FontWeight.bold),
              )),
          // similar products
//          Container(
//            height: 360.0,
//            child: SimilarProducts(),
//          ),
        ],
      ),
    );
  }
}

class SimilarProducts extends StatefulWidget {
  @override
  _SimilarProductsState createState() => _SimilarProductsState();
}

class _SimilarProductsState extends State<SimilarProducts> {
  var product_list = [
    {
      "name": "Blazzer",
      "picture": "images/products/blazer1.jpeg",
      "old_price": 85,
      "price": 75,
    },
    {
      "name": "Red Dress",
      "picture": "images/products/dress1.jpeg",
      "old_price": 60,
      "price": 55,
    },
    {
      "name": "Blazzer",
      "picture": "images/products/blazer2.jpeg",
      "old_price": 80,
      "price": 76,
    },
    {
      "name": "Black Dress",
      "picture": "images/products/dress2.jpeg",
      "old_price": 65,
      "price": 60,
    },
    {
      "name": "Jeans",
      "picture": "images/products/pants1.jpg",
      "old_price": 45,
      "price": 40,
    },
    {
      "name": "Trousers",
      "picture": "images/products/pants2.jpeg",
      "old_price": 35,
      "price": 30,
    },
    {
      "name": "Skirts",
      "picture": "images/products/skt1.jpeg",
      "old_price": 18,
      "price": 15,
    },
    {
      "name": "Plain Skirts",
      "picture": "images/products/skt2.jpeg",
      "old_price": 15,
      "price": 13,
    },
    {
      "name": "Black Heels",
      "picture": "images/products/hills1.jpeg",
      "old_price": 25,
      "price": 22,
    },
    {
      "name": "Red Heels",
      "picture": "images/products/hills2.jpeg",
      "old_price": 25,
      "price": 21,
    },
    {
      "name": "Shoes",
      "picture": "images/products/shoe1.jpg",
      "old_price": 20,
      "price": 16,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Single_prod(
            product_name: product_list[index]['name'],
            product_picture: product_list[index]['picture'],
         //   product_oldprice: product_list[index]['old_price'],
            product_price: product_list[index]['price'],
          );
        });
  }
}
