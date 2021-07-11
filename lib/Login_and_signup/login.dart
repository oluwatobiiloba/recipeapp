import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipeapp/firebase/authentication.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget{
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      //backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(20.0, 30.0, 0.0, 0.0),
                      child: Center(child: Image.asset('assets/scaffold/undraw_cooking_lyxy.png',width: 350,height: 250,)),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20.0, 175.0, 0.0, 0.0),
                      child: Text(
                        "Hi",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 80,

                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20.0, 250.0, 0.0, 0.0),
                      child: Row(
                        children: [

                          Text(
                            "Chef",
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
              Container(
                padding: EdgeInsets.only(top:35.0,left: 20.0,right: 20.0),
                child: Column(
                  children: [
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
                    SizedBox(height: 7.00,),
                    Container(
                      alignment: Alignment(1.0,0.0),
                      padding: EdgeInsets.only(top: 15.0,left: 20.0),
                        child: InkWell(
                          onTap: (){},
                            child: Text("Forgot Password?",style: TextStyle(
                                color: Colors.blue,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Bradley Hand',
                              decoration: TextDecoration.underline,

                            ),
                            )
                        )),
                    SizedBox(height: 7,),
                    Container(
                      height: 40.0,

                        child: Material(

                          color: Colors.blue,
                          elevation: 7.0,
                          borderRadius: BorderRadius.circular(20.0),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(20.0),
                            onTap: (){
                              context.read<AuthenticationService>().signIn(
                                email: emailController.text.trim(),
                                  password: passwordController.text.trim()
                              );

                            },

                            child: Center(
                              child: Text('LOGIN',
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
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(40.0) ,

                        child: InkWell(
                          borderRadius:BorderRadius.circular(40.0) ,
                          onTap: (){},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.facebook,color: Colors.blue,),
                              Text('Login with Facebook',
                                style: TextStyle(
                                  color: Colors.blue,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Create a New Account?",style: TextStyle(fontFamily: 'Bradley Hand'),),
                        SizedBox(width: 5),
                        InkWell(
                          onTap: (){
                            Navigator.of(context).pushNamed('/signup');
                          },
                          child: Text("Register",style: TextStyle(
                            color: Colors.blue,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Bradley Hand',
                            decoration: TextDecoration.underline,

                          ),
                          ),
                        )

                      ],
                    )



                  ],
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
