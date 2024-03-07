import 'package:get/get.dart';

class CitySelectionController extends GetxController {
  final List<String> cities = [
    'Agra',
    'Aligarh',
    'Allahabad',
    'Ambedkar Nagar',
    'Amethi',
    'Amroha',
    'Auraiya',
    'Azamgarh',
    'Baghpat',
    'Bahraich',
    'Ballia',
    'Balrampur',
    'Banda',
    'Barabanki',
    'Bareilly',
    'Basti',
    'Bhadohi',
    'Bijnor',
    'Budaun',
    'Bulandshahr',
    'Chandauli',
    'Chitrakoot',
    'Deoria',
    'Etah',
    'Etawah',
    'Faizabad',
    'Farrukhabad',
    'Fatehpur',
    'Firozabad',
    'Gautam Buddha Nagar',
    'Ghaziabad',
    'Ghazipur',
    'Gonda',
    'Gorakhpur',
    'Hamirpur',
    'Hapur',
    'Hardoi',
    'Hathras',
    'Jalaun',
    'Jaunpur',
    'Jhansi',
    'Kannauj',
    'Kanpur Dehat',
    'Kanpur Nagar',
    'Kasganj',
    'Kaushambi',
    'Kushinagar',
    'Lakhimpur Kheri',
    'Lalitpur',
    'Lucknow',
    'Maharajganj',
    'Mahoba',
    'Mainpuri',
    'Mathura',
    'Mau',
    'Meerut',
    'Mirzapur',
    'Moradabad',
    'Muzaffarnagar',
    'Pilibhit',
    'Pratapgarh',
    'Raebareli',
    'Rampur',
    'Saharanpur',
    'Sambhal',
    'Sant Kabir Nagar',
    'Shahjahanpur',
    'Shamli',
    'Shrawasti',
    'Siddharthnagar',
    'Sitapur',
    'Sonbhadra',
    'Sultanpur',
    'Unnao',
    'Varanasi',
  ].obs;

  // Method to check if a city is selected
  bool isSelected(String city) => _selectedCities.contains(city);

  // Method to toggle the selection of a city
  void toggleCity(String city) {
    if (_selectedCities.contains(city)) {
      _selectedCities.remove(city);
    } else {
      _selectedCities.add(city);
    }
    update();
  }

  final _selectedCities = <String>[].obs;

  List<String> getSelectedCities() => _selectedCities.toList();
}
