import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipeapp/firebase/authentication.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatefulWidget{
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      //backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              child: Container(
                child: Stack(
                  children: [

                    Container(
                      padding: EdgeInsets.fromLTRB(20.0, 250.0, 0.0, 0.0),
                      child: Row(
                        children: [

                          Text(
                            "Signup",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 80,
                            ),
                          ),
                          Text(
                            ".",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,color: Colors.blue,
                              fontSize: 80,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top:35.0,left: 20.0,right: 20.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                          labelText: "Name",
                          labelStyle: TextStyle(
                              fontFamily: 'Bradley Hand',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey
                          )
                      ),
                    ),
                    SizedBox(height: 15.00,),
                    TextField(
                        controller: emailController,
                      decoration: InputDecoration(
                          labelText: "Email",
                          labelStyle: TextStyle(
                              fontFamily: 'Bradley Hand',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey
                          )
                      ),
                    ),
                    SizedBox(height: 15.00,),

                    TextField(
                      decoration: InputDecoration(
                          labelText: "Address",
                          labelStyle: TextStyle(
                              fontFamily: 'Bradley Hand',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey
                          )
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                          labelText: "State",
                          labelStyle: TextStyle(
                              fontFamily: 'Bradley Hand',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey
                          )
                      ),
                    ),
                    SizedBox(height: 15.00,),
                    TextField(
                      decoration: InputDecoration(
                          labelText: "Country",
                          labelStyle: TextStyle(
                              fontFamily: 'Bradley Hand',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey
                          )
                      ),
                    ),
                    SizedBox(height: 15.00,),

                    TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(
                          fontFamily: 'Bradley Hand',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                      obscureText: true,
                    ),

                    TextField(
                      decoration: InputDecoration(
                        labelText: "Repeat Password",
                        labelStyle: TextStyle(
                          fontFamily: 'Bradley Hand',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: 14.00,),

                    Container(
                      height: 40.0,
                      
                      child: Material(

                        color: Colors.blue,
                        elevation: 7.0,
                        borderRadius: BorderRadius.circular(20.0),

                        child: InkWell(
                          borderRadius: BorderRadius.circular(20.0),
                          onTap: (){
                            context.read<AuthenticationService>().signUp(
                                email: emailController.text.trim(),
                                password: passwordController.text.trim(),
                              name: nameController.text.toUpperCase().trim(),
                            );
                            Navigator.pushNamed(context, '/login');
                          },
                          child: Center(
                            child: Text('SIGNUP',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Bradley Hand',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    Container(
                      height: 40.0,

                      child: Material(
                        color: Colors.white,
                        elevation: 7.0,
                        borderRadius: BorderRadius.circular(20.0),

                        child: InkWell(
                          borderRadius: BorderRadius.circular(20.0),
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.arrow_back_ios),
                              Text('Back',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Bradley Hand',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),



                  ],
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}
