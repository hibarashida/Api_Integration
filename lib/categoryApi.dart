import 'package:apidemo/provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    Mainprovider provider=Provider.of<Mainprovider>(context,listen: false);
    provider.getcategory();
    return Scaffold(
      // backgroundColor: CupertinoColors.tertiaryLabel,
      body:ListView.builder(
        itemCount: provider.category.length,
        itemBuilder: (context,index) {
          return Container(
            color: Colors.white,
            width: 500,
            child: Column(
              children: [
                Image.network(provider.category[index].image,scale: 10),
                Text(provider.category[index].id.toString()),
                Text(provider.category[index].description.toString()),
                Text(provider.category[index].title.toString()),
                Text(provider.category[index].price.toString()),
              ],
            ),
          );
        }
      ),

    );
  }
}
