import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  var searchText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: searchText,
                decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.orange, width: 2.0)),
                    labelText: 'Search',
                    floatingLabelStyle:
                        TextStyle(color: Colors.red, fontSize: 15),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1.0),
                    )),
              ),
            ),
          ),
          Container(),
        ],
      ),
    );
  }
}
