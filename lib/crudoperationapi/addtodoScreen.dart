import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../provider/provider.dart';

class AddScreen extends StatelessWidget {
   AddScreen({super.key});
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(
        // leading: Container(height: 20,width: 5, color: Colors.white,),
        //  actions: [Container(height: 20,width: 5, color: Colors.white)],
        backgroundColor: Colors.grey,title: Text("ADD TODO"),),
      body: Form( key: formKey ,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<Mainprovider>(
              builder: (context,value,child) {
                return TextFormField(

                   controller: value.titlecontroller,
                  style: const TextStyle(
                      color: Colors.white,
                      decorationColor:Colors.white30,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person, color: Colors.black),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white12, width: 3)),
                    labelText: "Name", hintStyle: TextStyle(color: Colors.black),
                    // border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.only(top: 4),
                  ),  validator: (value) {
                  if (value!.isEmpty) {
                    return "This field is Required";
                  } else {

                  }
                },


                );
              }
            ), Consumer<Mainprovider>(
              builder: (context,value,child) {
                return TextFormField(

                   controller: value.titlecontroller,
                  style: const TextStyle(
                      color: Colors.white,
                      decorationColor:Colors.white30,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person, color: Colors.black),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white12, width: 3)),
                    labelText: "Name", hintStyle: TextStyle(color: Colors.black),
                    // border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.only(top: 4),
                  ),  validator: (value) {
                  if (value!.isEmpty) {
                    return "This field is Required";
                  } else {

                  }
                },
                  // onChanged: (value){
                  //   if(value.length==10) {
                  //     SystemChannels.textInput.invokeMethod('TextInput.hide');
                  //   }
                  // },

                );
              }
            ),

            SizedBox(
              height: 100,
            ),
            InkWell(onTap: () {
              {
                final FormState? form = formKey.currentState;
                if(form!.validate()) {

                }
              }
              },
              child: Container(
                height: 50,
                width: 100,
                color: Colors.tealAccent,
                child: Center(child: Text("save",style: TextStyle(color: Colors.black),)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
