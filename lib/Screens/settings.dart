import 'package:flutter/material.dart';
import 'package:recipeapp/firebase/authentication.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: 40,),
          GestureDetector(
              onTap: (){Navigator.pop(context);},
              child: Icon(Icons.arrow_back)),
          SizedBox(height: 80,),
          Container(
            child: Center(
              child: ElevatedButton(child: Text('Sign Out'),
                onPressed: (){
                context.read<AuthenticationService>().signOut();
                Navigator.pushNamed(context, "/");
                }
                ,

              ),
            ),
          ),
        ],
      ),
    );
  }
}
