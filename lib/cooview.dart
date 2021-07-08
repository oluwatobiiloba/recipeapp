import 'package:flutter/material.dart';

import 'data.dart';

class CookView extends StatelessWidget {
  final InbuiltRecipes recipe;

  CookView({required this.recipe});
  @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        brightness: Brightness.light,
        elevation: 0,
        leading: Padding(
            padding: EdgeInsets.only(left: 20),
            child: GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back_ios,color: Colors.black,))),
        actions: [
          Padding(padding: EdgeInsets.only(right: 14,),
              child: Icon(
                Icons.share,
                color: Colors.black ,
              )),
          Padding(padding: EdgeInsets.fromLTRB(12,0,20,0),
            child: Icon(
              Icons.favorite_border_outlined,
              color: Colors.black,
            ),)

        ],
      ),
      body: Center(child: Text('COMING SOON',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 50),)),

    );
  }
}
