import 'package:apidemo/provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Productsmdcls extends StatelessWidget {
  const Productsmdcls({super.key});

  @override
  Widget build(BuildContext context) {
    Mainprovider provider = Provider.of<Mainprovider>(context,listen: false);
    return  Scaffold(
      backgroundColor: Colors.tealAccent,
      appBar: AppBar(backgroundColor: Colors.deepPurple),
      body: Center(
        child:ListView.builder(

          itemCount: provider.products.length,
          itemBuilder: (context,index) {
            print("dkjcnbdkjdcbjkehc"+provider.products.length.toString());
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              width: 100,
              decoration:  BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10),border: Border.all(width: 1,color: Colors.black)),
              child: Column(
                children: [
                  Image.network(provider.products[index].image,scale: 10),
                  Text(provider.products[index].id.toString()),
                  Text(provider.products[index].description.toString()),
                  Text(provider.products[index].title.toString()),
                  Text(provider.products[index].price.toString()),
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}
