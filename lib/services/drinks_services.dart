import 'dart:convert';

import 'package:api_get_wit_machine_test/model/mainmodel/mainmodel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DrinksServices {
  var url = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=mar#";
  Future<Mainmodel?> fetchData() async {
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200 || response.statusCode == 201) {
        final decodedValue = jsonDecode(response.body);
        return Mainmodel.fromJson(decodedValue);
      } else if (response.statusCode != 200 || response.statusCode != 201) {
        Get.snackbar("Network Error", "Check you internet connection");
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
