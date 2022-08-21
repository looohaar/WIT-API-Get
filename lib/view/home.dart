
import 'dart:ui';

import 'package:api_get_wit_machine_test/controller/drinks_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final drinksVariable = Get.put(DrinksController());
    var url = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=mar#";
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'API GET Method',
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Obx((() => drinksVariable.isLoading.isTrue
                         ? const Center(
                          child: CircularProgressIndicator(
                            color: Colors.deepPurple,
                          ),
                         )
                        : ListView(
              children: List.generate(
                  drinksVariable.finaldata!()!.drinks!.length, (index) {
                return DrinksImage(

                  url: drinksVariable.finaldata!()?.drinks?[index].strDrinkThumb,
                   category: drinksVariable.finaldata!()?.drinks?[index].strCategory,
                   drinkName: drinksVariable.finaldata!()?.drinks?[index].strDrink,);
                  
              }),
            ))));
  }
}

class DrinksImage extends StatelessWidget {
  const DrinksImage({Key? key, required this.url,
  required this.category,
  required this.drinkName
  }) : super(key: key);
  final  url;
  final drinkName;
  final category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            height: 250,
            width: 350,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image:
                    DecorationImage(fit: BoxFit.fill, image: NetworkImage(url))),
          ),
          const SizedBox(height:10),
           
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
               children: [
                Text(drinkName,
                style: const TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 25,
                  fontWeight: FontWeight.bold
                ),),
                 const SizedBox(width:20),
                Text("($category)",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w700
                ),),
               
          
               ],
          )
        ],
      ),
    );
  }
}



// {
//   "drinks":[
//     {
//       "idDrink": "11728",
// "strDrink": "Martini",
// "strDrinkAlternate": null,
// "strTags": null,
// "strVideo": "https://www.youtube.com/watch?v=ApMR3IWYZHI",
// "strCategory": "Cocktail",
// "strIBA": "Unforgettables",
// "strAlcoholic": "Alcoholic",
// "strGlass": "Cocktail glass",
// "strInstructions": "Straight: Pour all ingredients into mixing glass with ice cubes. Stir well. Strain in chilled martini cocktail glass. Squeeze oil from lemon peel onto the drink, or garnish with olive.",
// "strInstructionsES": null,
// "strInstructionsDE": "Direkt: Alle Zutaten in ein Mischglas mit Eiswürfeln geben. Gut umrühren. In einem gekühlten Martini-Cocktailglas abseihen. Den Saft aus der Zitronenschale auf das Getränk drücken oder mit Olive garnieren.",
// "strInstructionsFR": null,
// "strInstructionsIT": "Versare tutti gli ingredienti nel mixing glass con cubetti di ghiaccio. Mescolare bene. Spremi la scorza di limone sulla bevanda o guarnisci con l'oliva.Filtrare in una coppetta da cocktail Martini ghiacciata. ",
// "strInstructionsZH-HANS": null,
// "strInstructionsZH-HANT": null,
// "strDrinkThumb": "https://www.thecocktaildb.com/images/media/drink/71t8581504353095.jpg",
// "strIngredient1": "Gin",
// "strIngredient2": "Dry Vermouth",
// "strIngredient3": "Olive",
// "strIngredient4": null,
// "strIngredient5": null,
// "strIngredient6": null,
// "strIngredient7": null,
// "strIngredient8": null,
// "strIngredient9": null,
// "strIngredient10": null,
// "strIngredient11": null,
// "strIngredient12": null,
// "strIngredient13": null,
// "strIngredient14": null,
// "strIngredient15": null,
// "strMeasure1": "1 2/3 oz ",
// "strMeasure2": "1/3 oz ",
// "strMeasure3": "1 ",
// "strMeasure4": null,
// "strMeasure5": null,
// "strMeasure6": null,
// "strMeasure7": null,
// "strMeasure8": null,
// "strMeasure9": null,
// "strMeasure10": null,
// "strMeasure11": null,
// "strMeasure12": null,
// "strMeasure13": null,
// "strMeasure14": null,
// "strMeasure15": null,
// "strImageSource": null,
// "strImageAttribution": null,
// "strCreativeCommonsConfirmed": "No",
// "dateModified": "2017-09-02 12:51:35"
//     }
//   ]
// }