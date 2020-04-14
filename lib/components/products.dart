import 'package:flutter/material.dart';
import 'package:flutterapp/pages/product_details.dart';
import 'package:flutterapp/provider/app_provider.dart';
import 'package:provider/provider.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {

   @override
  Widget build(BuildContext context) {
     final product_list = Provider.of<AppProvider>(context);

     return GridView.builder(
        itemCount: product_list.featureProducts.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Single_prod(
              product_name: product_list.featureProducts[index].name,
              product_id: product_list.featureProducts[index].id,
              product_category: product_list.featureProducts[index].category,
              product_brand: product_list.featureProducts[index].brand,
              product_price: product_list.featureProducts[index].price,
              product_quantity: product_list.featureProducts[index].quantity,
              product_colors: product_list.featureProducts[index].colors,
              product_onSale: product_list.featureProducts[index].onSale,
              product_featured: product_list.featureProducts[index].featured,
              product_picture: product_list.featureProducts[index].picture,
              product_sizes: product_list.featureProducts[index].sizes,
            ),
          );
        });
  }
}

class Single_prod extends StatelessWidget {
  final product_name;
  final product_id;
  final product_category;
  final product_price;
  final product_brand;
  final product_quantity;
  final product_colors;
  final product_onSale;
  final product_featured;
  final product_picture;
  final product_sizes;

  Single_prod(
      { this.product_name,
        this.product_id,
        this.product_category,
        this.product_brand,
        this.product_price,
        this.product_quantity,
        this.product_colors,
        this.product_onSale,
        this.product_featured,
        this.product_picture,
        this.product_sizes
        });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: new Text("Hero_1"),
        child: Material(
          child: InkWell(
            onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                builder: (context) => ProductDetails(
                    prod_details_name: product_name,
                    prod_details_id: product_id,
                    prod_details_category:product_category,
                    prod_details_brand: product_brand,
                    prod_details_price: product_price,
                    prod_details_quantity: product_quantity,
                    prod_details_colors: product_colors,
                    prod_details_onSale: product_onSale,
                    prod_details_featured: product_featured,
                    prod_details_picture: product_picture,
                    prod_details_sizes: product_sizes.toString()
                )
              )
            ),
            child: GridTile(
                footer: Container(
                  color: Colors.white70,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(product_name, style: TextStyle(color: Colors.black45, fontWeight: FontWeight.bold, fontSize: 16.0)),
                      ),

                     // new Text("\$${product_oldprice }", style: TextStyle(color: Colors.black45, fontWeight: FontWeight.bold, decoration: TextDecoration.lineThrough)),

                      new Text(" \$${product_price}", style: TextStyle(color: Colors.black45, fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
                child: Image.network(
                  product_picture,
                    //width:100,height:100
                  //fit: BoxFit.cover,
                ),
            ),
          ),
        ),
      ),
    );
  }
}
