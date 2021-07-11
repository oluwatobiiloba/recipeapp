import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'cookview.dart';
import '../constants/data.dart';




class RecipeView extends StatelessWidget{
  final InbuiltRecipes recipe;

  RecipeView({required this.recipe});
  @override

  Widget build(BuildContext context) {
    // Recipe view
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
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          margin: EdgeInsets.only(left: 25,top: 15,right: 25, bottom: 30),
          width: MediaQuery.of(context).size.width*0.93,
          height: MediaQuery.of(context).size.height*0.87,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0,3),
                )
              ]
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Padding(
                padding: EdgeInsets.only(left: 10,top: 10,bottom: 5),
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.lightBlue),
                  width: 70,
                  height: 30,
                  padding: EdgeInsets.all(5),
                  child: Center(child: Text("NEW",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0,),
                child: Container(
                  width: double.maxFinite,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10,),
                      Text(recipe.name,style: TextStyle(fontSize: 25,
                          fontWeight: FontWeight.w900,color: Colors.black,
                          shadows: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0,3),
                            )
                          ]  ),
                      )

                    ],
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 10,right: 10,top: 2,bottom: 5),
                child: Container(
                  width: 600,
                  height: 350,
                  alignment: Alignment.center,
                  child: Hero(tag: recipe.image,
                      child: ClipRRect(child: Image.asset(recipe.image,fit: BoxFit.fitWidth,),borderRadius: BorderRadius.circular(15),)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0.0,left: 15,right: 15,bottom: 15),
                child: Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Icon(Icons.restaurant_menu_outlined, size: 40,color: Colors.blue,),
                          Text(recipe.calories.toString() + ' Kcal' ,style: GoogleFonts.roboto(color: Colors.blue,fontSize: 18 )
                          )
                        ],
                      ),
                      Container(height: 40, child: VerticalDivider(color: Colors.black)),
                      Column(
                        children: [
                          Icon(Icons.timer, size: 40,color: Colors.blue,),
                          Text(recipe.time.toString() + ' mins',style: GoogleFonts.roboto(color: Colors.blue ,fontSize: 18 )
                          )
                        ],
                      ),
                      Container(height: 40, child: VerticalDivider(color: Colors.black)),
                      Column(
                        children: [
                          Icon(FlutterIcons.stove_mco, size: 40,color: Colors.blue,),
                          Text(recipe.difficulty != null ? recipe.difficulty:'N/A' ,style: GoogleFonts.roboto(color: Colors.blue,fontSize: 18  ))
                        ],
                      ),


                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Center(
                    child: Expanded(
                      child: Container(
                        height: 90,
                        width: 90,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0, 1),
                                blurRadius: 2.0)
                          ],
                          borderRadius: BorderRadius.circular(45.0),
                          color: Colors.white,
                        ),
                        child: Material(
                          borderRadius: BorderRadius.circular(45.0),
                          color: Colors.blue,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(45.0),
                            onTap: () {
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => CookView(recipe: recipe))
                              );
                            },
                            splashColor: Colors.blue,
                            splashFactory: InkSplash.splashFactory,
                            child: Container(
                              padding: EdgeInsets.all(12.0),
                              child: Center(child: Icon(FlutterIcons.chef_hat_mco,size: 45,color: Colors.white,)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )

            ],
          ),
        ),
      ),

    );
  }
}