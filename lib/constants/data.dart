import 'package:multi_sort/multi_sort.dart';
class InbuiltRecipes{
  //declaring variables
   String name;
   String description;
   String image;
   int calories;
   int time;
   int rank;
   String difficulty;
   List ingredients;
   List steps;


   InbuiltRecipes(this.name,this.description,this.image,this.calories,this.time,this.rank,this.difficulty,this.ingredients,this.steps);
   Map<String, dynamic> _toMap() {
     return {'name': name, 'description': description, 'calories': calories, 'time': time, 'rank': rank,'difficulty': difficulty,'ingredients': ingredients,'steps': steps};
   }
   dynamic get(String propertyName) {
     var _mapRep = _toMap();
     if (_mapRep.containsKey(propertyName)) {
       return _mapRep[propertyName];
     }
     throw ArgumentError('propery not found');
   }
}



List<InbuiltRecipes> recipes = [
  InbuiltRecipes('Jollof Rice', "Nigerias pride", "assets/food_images/jollof rice.jpeg", 500, 60, 1,'Hard',['Rice','Tomato','Seasoning','Pepper','Curry','thyme'],["Blend your tomatoes, red pepper, scotch bonnet peppers in a food processor or blender for about 45 seconds, make sure that everything is blended well.","In a medium sized pot, heat your oil on medium-high heat. Once the oil is heated add the onions you set aside and fry just until they turn golden brown. Once the onions, have turned brown in color add the tomato paste and fry for 2-3 minutes. Then add the blended tomato mixture (reserve about 1/4 cup and set aside) and fry the mixture with the onions and tomato paste for about 30 minutes. Make sure you stir consistently so that the tomato mixture does not burn.","After 30 minutes, turn the heat down to medium, and add the chicken stock. Mix and add your seasonings (salt, curry powder, thyme, all purpose seasoning, and the Knorr stock cube). Continue to boil for 10 minutes.","Add the parboiled rice** to the pot. Mix it very well with the tomato stew. At this point if you need to add water so that the rice is level with the tomato mixture/chicken stock go ahead and do so. Add the bay leaves, cover the pot, and cook on medium to low heat for 15-30 minutes.","When the liquid has almost dried up add the remaining tomato stew**, cover, and let it cook for another 5-10 minutes heat until the liquid has completely dried up. Turn off the heat, mix thoroughly, and your Jollof Rice is ready to be eaten!"]),
  InbuiltRecipes("Egusi", "A swallows best friend", "assets/food_images/egusi.jpeg", 600, 70,3,'Hard',['Egusi','Tomato','Seasoning','Pepper','Curry','thyme'],["Buy Ingredients","Rinse Ingredients","Cook"]),
  InbuiltRecipes("Akara and Pap", "Ideal weekend breakfast", "assets/food_images/akara and pap.jpeg", 600, 45,2,'Easy',['Beans','Tomato','Seasoning','Pepper','Curry','thyme'],["Buy Ingredients","Rinse Ingredients","Cook"]),
  InbuiltRecipes("Puff Puff", "Every kids favorite snack", 'assets/food_images/puffpuff.jpeg', 70, 15,4,'Medium',['Flour','Tomato','Seasoning','Pepper','Curry','thyme'],["Buy Ingredients","Rinse Ingredients","Cook"]),
  InbuiltRecipes("Efo", "Best served with Pounded Yam", "assets/food_images/efo.jpg", 100, 45,1,'Hard',['Efo','Tomato','Seasoning','Pepper','Curry','thyme'],["Buy Ingredients","Rinse Ingredients","Cook"]),
  InbuiltRecipes("Ofada Sauce", "Best served with Ofada rice", "assets/food_images/ofada.jpeg", 200, 70,2,'Medium', ['Pepper','Tomato','Seasoning','Pepper','Curry','thyme'],["Buy Ingredients","Rinse Ingredients","Cook"]),
];
// Initial sorted list
List<InbuiltRecipes> sortingList = [];
//sorting Criteria
List<bool> criteria = [false,false];
//Preferential sorting
List<String> sortby= ["rank"];

List<InbuiltRecipes> getSorted(){
  return sortingList.multisort(criteria, sortby);
}






