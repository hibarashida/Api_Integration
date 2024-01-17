import 'package:apidemo/provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class cart extends StatelessWidget {
  const cart({super.key});

  @override
  Widget build(BuildContext context) {
    Mainprovider provider=Provider.of<Mainprovider>(context,listen: false);
    provider.getcart();
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.lightBlue),
      // backgroundColor: CupertinoColors.tertiaryLabel,
      body:ListView.builder(
          itemCount: provider.cart.length,
          itemBuilder: (context,index) {
            return Container(margin:EdgeInsets.symmetric(horizontal: 10,vertical: 10) ,
              color: Colors.pink,
              width: 500,
              child: Column(
                children: [
                  Text(provider.cart[index].id.toString()),
                  Text(provider.cart[index].userId.toString()),
                  Text(provider.cart[index].date.toString()),
                  SizedBox(width: 200,height: 100,
                    child: ListView.builder(
                      itemCount: provider.cart[index].products.length,
                      itemBuilder: (context, index1) {
                        return Column(
                          children: [
                            Text("ProductId : "+provider.cart[index].products[index1].productId.toString(),style: TextStyle(color: Colors.white)),
                            Text("quantity : "+provider.cart[index].products[index1].quantity.toString(),style: TextStyle(color: Colors.white)),
                          ],
                        );

                      },),
                  ),
                ],
              ),
            );
          }
      ),

    );
  }
}