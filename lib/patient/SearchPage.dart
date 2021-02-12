import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  String searchWord;
  SearchPage(this.searchWord);
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    searchController.text = widget.searchWord;
    return SafeArea(
      child: Scaffold(
          body: TextField(
        controller: searchController,
        autofocus: true,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(5),
            hintText: "Search your symptoms..",
            prefixIcon: IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                onPressed: null),
            suffixIcon: Icon(
              Icons.filter_list_outlined,
              color: Colors.blue,
            ),
            border: OutlineInputBorder(borderSide: BorderSide.none)),
      )),
    );
  }
}
