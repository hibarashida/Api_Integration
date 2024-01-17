import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

List listcategory = [];

class _CategoriesState extends State<Categories> {
  Future apicall() async {
    http.Response response;
    response = await http
        .get(Uri.parse("https://fakestoreapi.com/products/categories"));
    if (response.statusCode == 200) {
      setState(() {
        // stringresponse = response.body;
        listcategory = json.decode(response.body);
        print(response.body);
      });
    }
  }

  @override
  void initState() {
    apicall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: listcategory.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              height: 100,
              width: 300,
              color: Colors.brown,
              child: Center(
                  child: Text(
                listcategory[index].toString(),
                style: TextStyle(color: Colors.white),
              )),
            );
          }),
    );
  }
}
