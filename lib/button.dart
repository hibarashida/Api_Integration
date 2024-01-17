import 'package:apidemo/provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Api1 extends StatelessWidget {
  const Api1({super.key});

  @override
  Widget build(BuildContext context) {
    Mainprovider provider = Provider.of<Mainprovider>(context);

    return Scaffold(
      body: Center(
        child: InkWell(onTap: () {
          provider.apicallMulti(context);
        },
          child: Container(
            height: 300,
            width: 300,
            color: Colors.yellow,
            child: Center(child: Text("hello")),

          ),
        ),
      ),

    );
  }
}
