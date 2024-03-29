import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sherise/controllers/city_selection_controller.dart';
import 'package:sherise/constants/app_color.dart';
import 'home_page.dart';

class CitySelectionPage extends StatelessWidget {
  final CitySelectionController _citySelectionController =
      Get.put(CitySelectionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Select Cities',
          style: TextStyle(color: AppColors.navyBlue),
        ),
        backgroundColor: AppColors.lightBlue,
      ),
      backgroundColor: AppColors.lightBlue,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: _citySelectionController.cities.length,
                  itemBuilder: (context, index) {
                    final city = _citySelectionController.cities[index];
                    return Obx(
                      () => CheckboxListTile(
                        title: Text(
                          city,
                          style: TextStyle(color: AppColors.navyBlue),
                        ),
                        value: _citySelectionController.isSelected(city),
                        onChanged: (value) {
                          _citySelectionController.toggleCity(city);
                        },
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Navigate to the home page
                  Get.toNamed("HomePage");
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(AppColors.callToActionColor),
                ),
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
