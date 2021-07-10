import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipeapp/constants/list.dart';
import 'package:recipeapp/constants/stepper.dart';

import '../constants/data.dart';

class CookView extends StatefulWidget {
  final InbuiltRecipes recipe;
  CookView({required this.recipe});

  @override
  _CookViewState createState() => _CookViewState();
}

class _CookViewState extends State<CookView> {
  int current_step = 0;

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                    children: [
                      Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height / 3,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(40),
                              bottomRight: Radius.circular(40)),
                          color: Colors.blue,
                        ),
                        child: Material(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(40),
                              bottomRight: Radius.circular(40)),
                          elevation: 9,
                          child: Hero(tag: widget.recipe.image,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(bottomLeft: Radius
                                  .circular(40),
                                  bottomRight: Radius.circular(40)),
                              child: Image(
                                image: AssetImage(widget.recipe.image),
                                repeat: ImageRepeat.repeatX,
                                height: MediaQuery
                                    .of(context)
                                    .size
                                    .height,
                              ),
                            ),
                          ),

                        ),
                      ),

                      Positioned(
                        right: 20,
                        bottom: 5,
                        child: Material(
                          elevation: 6,
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(12),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.timer, size: 20, color: Colors.white,),
                                SizedBox(width: 5,),
                                Text(widget.recipe.time.toString() + ' Mins',
                                    style: TextStyle(fontSize: 15,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.white,
                                        letterSpacing: 1.2
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Icon(Icons.arrow_back_ios,
                                      color: Colors.white,)
                                )
                            ),
                            Spacer(flex: 1,),
                            Padding(padding: EdgeInsets.only(right: 14,),
                                child: Icon(
                                  Icons.share,
                                  color: Colors.white,
                                )),
                          ],
                        ),
                      ),

                    ]
                ),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  child: Material(
                    elevation: 6,
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(12),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                          widget.recipe.name, style: TextStyle(fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                          letterSpacing: 1.2
                      )),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    "Ingredients", style: GoogleFonts.openSans(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Wrap(
                    direction: Axis.horizontal,
                    children: buildIngredients(),
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    "Preparation", style: GoogleFonts.openSans(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Material(
                    elevation: 5,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Stepper(
                        currentStep: this.current_step,
                        steps: stepList(),
                        type: StepperType.vertical,
                        onStepTapped: (step) {
                          setState(() {
                            current_step = step;
                          });
                        },
                        onStepContinue: () {
                          setState(() {
                            if (current_step < stepList().length - 1) {
                              current_step = current_step + 1;
                            } else {
                              current_step = 0;
                            }
                          });
                        },
                        onStepCancel: () {
                          setState(() {
                            if (current_step > 0) {
                              current_step = current_step - 1;
                            } else {
                              current_step = 0;
                            }
                          });
                        },
                      ),


                      ),
                    ),


                  ),
              ],
            ),
          ),
        )

    );
  }

  List<Widget> buildIngredients() {
    List<Widget> list = [];
    var ingredients = widget.recipe.ingredients;
    for (var i = 0; i < ingredients.length; i++) {
      list.add(buildIngredient(ingredients[i], i));
    }
    return list;
  }

  Widget buildIngredient(var ingredients, int index) {
    return Container(
      margin: EdgeInsets.all(5),
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          )
        ],
      ),
      padding: EdgeInsets.all(12),
      child:
      Text(ingredients,
        style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.bold
        ),)
      ,
    );
  }

  List<Step> stepList() {
    List<Step> steps = [];
    var stepdata = widget.recipe.steps;
    for (var i = 0; i < stepdata.length; i++) {
      steps.add(Step(
        content: Text('${stepdata[i]}'),
        title: Text('Step ${i + 1}'),
        isActive: true,
      ));
    }
    return steps;
  }


}