import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate {
  final searchList = [
    'T-shirts',
    'Formals',
    'Informals',
    'Dress',
    'Shoes',
    'Accessories'
  ];

  final recentSearches = [
    'Formals',
    'Dress',
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.arrow_menu,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults similar to catelogue page... like what happens when user clicks on a tile
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentSearches
        : searchList.where((text) => text.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: (){
          showResults(context);
        },
        leading: Icon(Icons.category),
        title: RichText(
            text: TextSpan(
          text: suggestionList[index].substring(0, query.length),
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          children: [
            TextSpan(
                text: suggestionList[index].substring(query.length),
                style: TextStyle(
                  color: Colors.grey,
                ))
          ],
        ),
        ),
      ),
      itemCount: suggestionList.length,
    );
  }
}
