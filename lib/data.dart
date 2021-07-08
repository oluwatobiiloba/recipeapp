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

   InbuiltRecipes(this.name,this.description,this.image,this.calories,this.time,this.rank,this.difficulty);
   Map<String, dynamic> _toMap() {
     return {'name': name, 'description': description, 'calories': calories, 'time': time, 'rank': rank,'difficulty': difficulty,};
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
  InbuiltRecipes('Jollof Rice', "Nigerias pride", "assets/food_images/jollof rice.jpeg", 500, 60, 1,'Hard'),
  InbuiltRecipes("Egusi", "A swallows best friend", "assets/food_images/egusi.jpeg", 600, 70,3,'Hard'),
  InbuiltRecipes("Akara and Pap", "Ideal weekend breakfast", "assets/food_images/akara and pap.jpeg", 600, 45,2,'Easy'),
  InbuiltRecipes("PuffPuff", "Every kids favorite snack", 'assets/food_images/puffpuff.jpeg', 70, 15,4,'Medium'),
  InbuiltRecipes("Efo", "Best served with Pounded Yam", "assets/food_images/efo.jpg", 100, 45,1,'Hard'),
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






