
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipeapp/Screens/recipeview.dart';
import 'Login_and_signup/login.dart';
import 'Screens/explorer.dart';
import 'constants/list.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([
   //This line is used for hiding the bottom bar
  ]);

  runApp(Homescreen());

}

class Homescreen extends StatelessWidget{
  @override

  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Recipe App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Homeview(),

    );
  }
}


