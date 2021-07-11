
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:recipeapp/Screens/recipeview.dart';
import 'package:recipeapp/firebase/authentication.dart';
import 'Login_and_signup/login.dart';
import 'Login_and_signup/signup.dart';
import 'Screens/explorer.dart';
import 'constants/list.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([
   //This line is used for hiding the bottom bar
  ]);

  runApp(Homescreen());

}

class Homescreen extends StatelessWidget{
  @override

  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      Provider<AuthenticationService>(create: (_) => AuthenticationService(FirebaseAuth.instance),),
      StreamProvider(create: (context) => context.read<AuthenticationService>().authStateChanges, initialData: null,  )
    ],
    child: MaterialApp(

        debugShowCheckedModeBanner: false,
        title: 'Recipe App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => AuthenticationWrapper(),
          // When navigating to the "/second" route, build the SecondScreen widget.
          '/login': (context) => LoginPage(),
          '/signup': (context) => SignupPage(),

        }

    )


    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({
    Key? key,
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  final firebaseUser =   context.watch<User?>();

  if(firebaseUser != null){
    return Homeview();
  }
    return LoginPage();
  }

}


