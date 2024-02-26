import 'package:get/get.dart';

class CitySelectionController extends GetxController {
  final List<String> cities = [
    'New York',
    'Los Angeles',
    'Chicago',
    'Houston',
    'Phoenix',
    'Philadelphia',
    'San Antonio',
    'San Diego',
    'Dallas',
    'San Jose',
    'Austin',
    'Jacksonville',
  ];

  final RxList<String> selectedCities = RxList<String>();

  bool isSelected(String city) => selectedCities.contains(city);

  void toggleCity(String city) {
    if (isSelected(city)) {
      selectedCities.remove(city);
    } else {
      selectedCities.add(city);
    }
  }
}
