import 'dart:convert';
import 'dart:developer';

import 'package:apidemo/productsmdcls.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

import '../Modelclass/cartmodelclass.dart';
import '../Modelclass/modelclass.dart';

class Mainprovider extends ChangeNotifier{
  Map mapproduct=Map();
  List<Welcome>products=[];
  List<Welcome>category=[];
  List<Welcome1>cart=[];


  void apicall()async{
    http.Response response;
    response=await http.get(Uri.parse("https://fakestoreapi.com/products"));
    if(response.statusCode==200){
      mapproduct=json.decode(response.body);
      products=mapproduct[''];

    }
  }


  String stringresponse='';
  Map mapResponse=Map();


  Future apicallMulti(BuildContext ctx)async{
    http.Response response;
    response = await http.get(Uri.parse("https://fakestoreapi.com/products")) ;
    if(response.statusCode==200){
      log(response.body+"kdsnfk");
      products=(json.decode(response.body) as List).map((i) => Welcome.fromJson(i)).toList();
       // print(products.isEmpty.toString()+"kldfmasds");
        // print(products[0].title+"kldfmasds111");
      Navigator.push(ctx, MaterialPageRoute(builder: (context) => Productsmdcls(),));
      }else{
      print("ststus error");
    }
  }
  
  Future getcategory()async{
    http.Response response;
    response=await http.get(Uri.parse("https://fakestoreapi.com/products/category/jewelery"));
    if(response.statusCode==200){
      log(response.body+"fghjk");
      category=(json.decode(response.body)as List).map((a) => Welcome.fromJson(a)).toList();
     print(category.isEmpty.toString()+"kldfmasds");
    }
    notifyListeners();
    
  }
  Future getcart()async{
    http.Response response;
    response=await http.get(Uri.parse("https://fakestoreapi.com/carts?userId=1"));
    if(response.statusCode==200){
      log(response.body+"fghjk");
      cart=(json.decode(response.body)as List).map((a) => Welcome1.fromJson(a)).toList();
     print(cart.isEmpty.toString()+"kldfmasds");
     notifyListeners();
    }
    notifyListeners();

  }

//  ---------------------------------------crud operation------------

TextEditingController titlecontroller = TextEditingController();
TextEditingController descriptioncontroller = TextEditingController();




}