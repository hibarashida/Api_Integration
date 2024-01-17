import 'dart:convert';

import 'package:apidemo/productsmdcls.dart';
import 'package:apidemo/provider/provider.dart';
import 'package:apidemo/singlecategory.dart';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'package:provider/provider.dart';

import 'button.dart';
import 'cartdeatils.dart';
import 'categoryApi.dart';
import 'crudoperationapi/addtodoScreen.dart';
import 'crudoperationapi/listing.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider( create: (context) => Mainprovider(),)
    ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:  Details(),
      ),
    );
  }
}

 String stringresponse='';
 Map mapResponse=Map();


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {



  Future apicall()async{
    http.Response response;
    response = await http.get(Uri.parse("https://fakestoreapi.com/products/1")) ;
    if(response.statusCode==200){
      setState(() {
      mapResponse.clear();
        // stringresponse = response.body;
        mapResponse=json.decode(response.body);
        print(response.body);
        print(mapResponse.length);
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
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Center(child: Text("API Demo")),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: 1,
          // itemCount:mapResponse.length ,
          itemBuilder: (context,index) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              height: 300,
              width: 200,
              color: Colors.tealAccent,
              child: Column(
                children: [
                  SizedBox(  width: 100,
                      height: 100,
                      child: Image.network(mapResponse["image"])),
                  // mapResponse==null?Container():
                  Text(mapResponse["title"].toString()),
                  Text(mapResponse["price"].toString()),
                  Text(mapResponse["description"].toString()),
                  Text(mapResponse["category"].toString()),
                ],
              )
            );
          }
        ),
      ),
    );
  }
}
