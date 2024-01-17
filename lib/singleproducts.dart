import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class Products extends StatefulWidget {
  const Products({super.key});
  @override
  State<Products> createState() => _ProductsState();
  }
 String Stringrespones='';
 Map maprespones=Map();
 Map datarespones=Map();
 List listrespones=[];


  class _ProductsState extends State<Products> {
  Future apiget()async{
    http.Response response;
    response = await http.get(Uri.parse("https://reqres.in/api/users?page=2"));
     if(response.statusCode==200){
      setState(() {
        // Stringrespones=response.body;
        maprespones=json.decode(response.body);
        // datarespones=maprespones["data"];
        listrespones=maprespones["data"];
      });
    }
  }
  @override
  void initState() {
    apiget();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(backgroundColor: Colors.black),
      body: Center(
        child: ListView.builder(
          itemCount: listrespones.length,
          itemBuilder: (context,index) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              height: 200,
              width: 150,
              color: Colors.deepPurpleAccent,
              child:Center(child:
                  Column(
                    children: [
                      Image.network(listrespones[index]["avatar"]),
                      Text(listrespones[index]["id"].toString()),
                      Text(listrespones[index]["email"].toString()),
                      Text(listrespones[index]["first_name"].toString()),
                      Text(listrespones[index]["last_name"].toString()),
                    ],
                  )
              ) ,
            );
          }
        ),
      ),
    );
  }
}
