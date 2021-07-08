import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipeapp/list.dart';
import 'package:recipeapp/recipeview.dart';
import 'data.dart';
import 'package:multi_sort/multi_sort.dart';

class Homeview extends StatefulWidget {
  const Homeview({Key? key}) : super(key: key);

  @override
  _HomeviewState createState() => _HomeviewState();
}

class _HomeviewState extends State<Homeview> {

  List<bool>optionSelected = [true,false,false,false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        brightness: Brightness.light,
        elevation: 0,
        actions: [
          Padding(padding: EdgeInsets.only(right: 16),
          child: Icon(Icons.settings,color: Colors.black,),)
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 25.0,right: 25.0),
                child: Row(
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Hi User,",style: TextStyle(color: Colors.black,fontSize: 30),),
                            Text("Ready to cook?",style: GoogleFonts.roboto(fontSize: 30),)
                          ],
                        ),
                      ),
                      Spacer(),
                      CircleAvatar(
                        backgroundColor: Colors.black,
                        child: Icon(Icons.person,color: Colors.white,),
                      )
                    ],
                ),
              ),
            ),
          SizedBox(height: 20,),
            buildRecipestitleVariations1("Recipes Coming Soon"),
            buildRecipesubtile("Delicious and Rich food recipe"),
            SizedBox(height: 13,),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(left :25.0,right: 25.0),
                child: Container(
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      option('Rice','assets/icons/rice.png',0),
                      SizedBox(width: 15,),
                      option('Vegetable','assets/icons/hot-soup-3-819241.png',1),
                      SizedBox(width: 15,),
                      option('Salads','assets/icons/salad.png',2),
                      SizedBox(width: 15,),
                      option('fruits','assets/icons/fruit.png',3),

                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Padding(padding: EdgeInsets.symmetric(horizontal: 16,),
                child:Row(
                  children: [
                    buildRecipesVariations2('Featured',false),
                    SizedBox(
                      width:8,
                    ),
                    buildRecipesVariations2("Meals", true),
                  ],
                )
            ),
            Container(
              height: 350,
              child: ListView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: buildRecipes(),

              ),
            ),
            SizedBox(
              height: 16,
            ),
            Center(
              child: Container(
                child: ListTile(
                  
                ),

              ),
            )
          ],
        ),
      ) ,
    );
  }
  Widget option(String text,String image,int index){
    var kPrimaryColor = Color(0xff27ae60);
    return GestureDetector(
      onTap: (){
        setState(() {
          optionSelected[index] = !optionSelected[index];
        });
      },
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: optionSelected[index] ? kPrimaryColor : Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0,3),
            )
          ],
        ),
        padding: EdgeInsets.symmetric(horizontal: 12,),
        child: Row(
          children: [
            SizedBox(
              height: 32,
              width: 32,
              child: Image.asset(
                image,color: optionSelected[index] ? Colors.white : Colors.black,
              ),
            ),
            SizedBox(width :8),
            Text(text,
            style: TextStyle(
              color: optionSelected[index] ? Colors.white : Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.bold
            ),)
          ],
        ),
      ),
    );
  }

  List<Widget> buildRecipes(){
    List<Widget> list = [];
    for (var i = 0 ; i < recipes.length; i++){
      list.add(buildRecipe(recipes[i],i));
    }
    return list;

  }

  Widget buildRecipe(InbuiltRecipes recipe, int index){
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context, MaterialPageRoute(builder: (context) => RecipeView(recipe: recipe))
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20),),
            boxShadow: [BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 5,
        blurRadius: 7,
        offset: Offset(0,3),
      )],
        ),
        margin: EdgeInsets.only(right: 16, left: index ==0 ? 16 :0,bottom: 16,top: 8),
        padding: EdgeInsets.all(16),
        width: 220,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(child: Hero(
              tag: recipe.image,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(recipe.image),
                    fit: BoxFit.contain,
                  )
                ),
              ),
            )
            ),
            SizedBox(
              height: 8,
            ),
            buildRecipeTile(recipe.name),
            buildRecipesdescription(recipe.description),
            
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      // Icon(Icons.restaurant_menu_outlined, size: 20,color: Colors.blue,),
                      // SizedBox(width: 2,),
                      buildRecipecalories(recipe.calories.toString() + ' Kcal'),
                    ],),
                    Icon(Icons.favorite_border),
                  ],
                ),
                // buildRecipetime(recipe.time.toString() + ' mins'),
              ],
            )
            


          ],
        ),

      ),
    );

  }

  }








