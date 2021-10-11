import 'dart:convert';
import 'package:ui_recipe_list/models/recipe.dart';
import 'package:http/http.dart' as http;

class RecipeApi {
//copy code snippet from GET feeds/list > (dropdown)(Node.js) Unirest
//   var req = unirest("GET", "https://yummly2.p.rapidapi.com/feeds/list");

// req.query({
// 	"limit": "18",
// 	"start": "0",
// 	"tag": "list.recipe.popular"
// });

// req.headers({
// 	"x-rapidapi-host": "yummly2.p.rapidapi.com",
// 	"x-rapidapi-key": "066534429fmshe9c568ca0ca674cp108156jsnded13e0ba241",
// 	"useQueryString": true
// });

//Future getRecipe function
  static Future<List<Recipe>> getRecipe() async {
    //Uniform Resource Identifier is a unique sequence of characters that
    //identifies a logical or physical resource used by web technologies
    //construct query string
    var uri = Uri.https("yummly2.p.rapidapi.com", "feeds/list",
        {"limit": "18", "start": "0", "tag": "list.recipe.popular"});

//execute HTTP query to API
    final response = await http.get(
      uri,
      headers: {
        "x-rapidapi-host": "yummly2.p.rapidapi.com",
        "x-rapidapi-key": "066534429fmshe9c568ca0ca674cp108156jsnded13e0ba241",
        "useQueryString": "true"
      },
    );

//DECODE the JSON data from API call response
    Map data = jsonDecode(response.body);
//temporary List to parse data
    List _tempList = [];
//run TestEndpoint > Results for keys
//loop through response to add items to temp List
    for (var i in data['feed']) {
      _tempList.add(i['content']['details']);
    }

    return Recipe.recipesFromSnapshot(_tempList);
  }
}
