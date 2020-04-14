import 'package:flutter/material.dart';
import 'package:flutterapp/pages/product_details.dart';
import 'package:flutterapp/provider/app_provider.dart';
import 'package:provider/provider.dart';

class CatelogueView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      CustomScrollView(
        primary: false,
        slivers: <Widget>[
          SliverPadding(
            padding: const EdgeInsets.all(20.0),
            sliver: SliverGrid.count(
                mainAxisSpacing: 1, //horizontal space
                crossAxisSpacing: 1, //vertical space
                crossAxisCount: 2, //number of images for a row
                children: <Widget>[
                  Category(
                    image_location: 'images/cats/tshirt.png',
                    image_caption: 'T-shirts',
                  ),

                  Category(
                    image_location: 'images/cats/dress.png',
                    image_caption: 'Dress',
                  ),

                  Category(
                    image_location: 'images/cats/formal.png',
                    image_caption: 'Formals',
                  ),

                  Category(
                    image_location: 'images/cats/informal.png',
                    image_caption: 'Informals',
                  ),

                  Category(
                    image_location: 'images/cats/jeans.png',
                    image_caption: 'Jeans',
                  ),

                  Category(
                    image_location: 'images/cats/accessories.png',
                    image_caption: 'Accessories',
                  ),

                  Category(
                    image_location: 'images/cats/shoe.png',
                    image_caption: 'Shoes',
                  ),

                ],
            ),
          ),
        ],
      );
  }
}

class Category extends StatelessWidget {
  final String image_location;
  final String image_caption;

  Category({
    this.image_location,
    this.image_caption
});
  @override
  Widget build(BuildContext context) {
    final products_list = Provider.of<AppProvider>(context);
    return Padding(padding: const EdgeInsets.all(10.0),
    child: InkWell(
      // TODO :: Use logic of similar products here
      onTap: () { Navigator.of(context).push(new MaterialPageRoute(
          // ignore: missing_return
          builder: (context) {
            for(var i=0; i<products_list.featureProducts.length;i++){
              if(image_caption.compareTo(products_list.featureProducts[i].name) != null){
                return ProductDetails(
                    prod_details_name: products_list.featureProducts[i].name,
                    prod_details_id: products_list.featureProducts[i].id,
                    prod_details_category: products_list.featureProducts[i].category,
                    prod_details_brand: products_list.featureProducts[i].brand,
                    prod_details_price: products_list.featureProducts[i].price,
                    prod_details_quantity: products_list.featureProducts[i].quantity,
                    prod_details_colors: products_list.featureProducts[i].colors,
                    prod_details_onSale: products_list.featureProducts[i].onSale,
                    prod_details_featured: products_list.featureProducts[i].featured,
                    prod_details_picture: products_list.featureProducts[i].picture,
                    prod_details_sizes: products_list.featureProducts[i].sizes
                );
              }
            // ignore: missing_return
            }
          }));},
      child: Container(
        width: 100.0,
        child: ListTile(
          title: Image.asset(image_location, width: 75.0, height: 75.0,),
          subtitle: Container(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(image_caption),
            ),
          ),
        ),
      ),
    ),
    );
  }
}
