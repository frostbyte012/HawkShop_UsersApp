import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';

//my package imports
import 'package:flutterapp/components/products.dart';
import 'package:flutterapp/components/search.dart';
import 'package:flutterapp/components/settings.dart';
import 'package:flutterapp/pages/cart.dart';
import 'package:flutterapp/pages/globals.dart';
import 'package:flutterapp/pages/login.dart';
import 'package:flutterapp/pages/profile.dart';
import 'package:flutterapp/provider/app_provider.dart';
import 'package:flutterapp/provider/userprovider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:settings_ui/settings_ui.dart';

import 'catelogue.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
  TextEditingController _searchController = TextEditingController();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _searchController = TextEditingController();
  final GoogleSignIn _googleSignIn = new GoogleSignIn();
  final _Key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    AppProvider appProvider = Provider.of<AppProvider>(context);

    Widget image_carousel = new Container(
      height: 200.0,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/c1.jpg'),
          AssetImage('images/m1.jpeg'),
          AssetImage('images/m2.jpg'),
          AssetImage('images/w1.jpeg'),
          AssetImage('images/w3.jpeg'),
          AssetImage('images/w4.jpeg'),
          AssetImage('images/IMG_1266.jpg')
        ],
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 4.0,
        indicatorBgPadding: 7.0,
        dotBgColor: Colors.transparent,
      ),
    );

    return Scaffold(
      key: _Key,
      appBar: new AppBar(
        backgroundColor: Colors.black45,
        title: Text("HawkShop", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        actions: <Widget>[
           IconButton(
              icon: Icon(Icons.search, color: Colors.white),
              onPressed: () {
                showSearch(context: context, delegate: CustomSearchDelegate());
              }),
           IconButton(
              icon: Icon(Icons.shopping_cart, color: Colors.white),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Cart()));
              })
        ],
      ),
      drawer: new Drawer(

        child: ListView(
          children: <Widget>[
            // header
            new UserAccountsDrawerHeader(
              accountName: Text(user.user.displayName.toString()),
              accountEmail: Text(user.user.email.toString()),
              currentAccountPicture: GestureDetector(
                  child: new CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Icon(Icons.person, color: Colors.white,),
                  )
              ),
              decoration: new BoxDecoration(
                  color: Colors.black45
              ),
            ),

            // body
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => new HomePage()));
              },
              child: ListTile(
                title: Text('Home Page'),
                leading: Icon(Icons.home, color: Colors.black,),
              ),
            ),

            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => new Profile()));
              },
              child: ListTile(
                title: Text('My Account'),
                leading: Icon(Icons.person),
              ),
            ),

            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => new Catelogue()));
              },
              child: ListTile(
                title: Text('Catelogue'),
                leading: Icon(Icons.category, color: Colors.blueGrey,),
              ),
            ),

            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => new Cart()));
              },
              child: ListTile(
                title: Text('Shopping Cart'),
                leading: Icon(Icons.shopping_cart, color: Colors.blueGrey,),
              ),
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Favourites'),
                leading: Icon(Icons.favorite, color: Colors.redAccent,),
              ),
            ),

            Divider(),

            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => new Settings()));
              },
              child: ListTile(
                title: Text('Settings'),
                leading: Icon(Icons.settings, color: Colors.blueAccent,),
              ),
            ),
//
//            InkWell(
//              onTap: () {},
//              child: ListTile(
//                title: Text('About'),
//                leading: Icon(Icons.help, color: Colors.blueAccent,),
//              ),
//            ),

            InkWell(
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _googleSignIn.signOut();
                  user.signOut();
                });
                Fluttertoast.showToast(msg: "User Logged Out!!!");
                changeScreenReplacement(context, Login());
              },
              child: ListTile(
                title: Text('LogOut'),
                leading: Icon(Icons.remove_from_queue, color: Colors.blueAccent,),
              ),
            ),
          ],
        ),
      ),

      body: new ListView(  // changed from ListView to Column
        children: <Widget>[
          // image carousel begins here
          image_carousel,

          Divider(color: Colors.black45,),
          // padding widget
          Center(
            child: new Padding(padding: const EdgeInsets.all(8.0),
              child: new Text('Recent Products : ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
            ),
          ),

          Divider(color: Colors.black45,),
          // grid view
          Container(
            height: 295.0,
            width: 160,
            child: Products(),
          )

        ],
      ),
    );
  }
}
