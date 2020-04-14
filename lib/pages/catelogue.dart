import 'package:flutter/material.dart';
import 'package:flutterapp/components/horizontal_list_view.dart';
import 'package:flutterapp/components/search.dart';

class Catelogue extends StatefulWidget {
  @override
  _CatelogueState createState() => _CatelogueState();
}

class _CatelogueState extends State<Catelogue> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.black45,
        title: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Text("Catelogue")),
        actions: <Widget>[
          new IconButton(
              icon: Icon(Icons.search, color: Colors.white70),
              onPressed: () {
                showSearch(context: context, delegate: CustomSearchDelegate());
              }),
        ],
      ),

      body: CatelogueView(),
    );
  }
}
