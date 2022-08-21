import 'package:api_get_wit_machine_test/model/mainmodel/mainmodel.dart';
import 'package:api_get_wit_machine_test/services/drinks_services.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class DrinksController extends GetxController {
  Rx<Mainmodel?>? finaldata = Mainmodel().obs;
  RxBool isLoading = true.obs;
  void getData() async {
    final drinksData = await DrinksServices().fetchData();
    if (drinksData != null) {
      finaldata?.value = drinksData;
      isLoading.value = false;
    } else {
      null;
    }
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
