// home_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sherise/constants/app_color.dart';
import '../../controllers/home_controller.dart';

class HomePage extends StatelessWidget {
  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFBDE0FE), // Light Blue

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Service selection row
          SizedBox(
            height: 100,
            child: Obx(
              () => ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _homeController.services.length,
                itemBuilder: (context, index) {
                  final service = _homeController.services[index];
                  return InkWell(
                    onTap: () {
                      _homeController.selectService(service);
                    },
                    child: Container(
                      width: 100,
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: service.selected
                            ? Color(0xFFFFB6C1) // Baby Pink
                            : Color(0xFFA2D2FF), // Baby Blue
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        service.name,
                        style: TextStyle(
                          color: Colors.black, // Navy Blue/Dark Gray
                          fontSize: 14,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          // Vertical list view for contacts
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: _homeController.selectedContacts.length,
                itemBuilder: (context, index) {
                  final contact = _homeController.selectedContacts[index];
                  return ListTile(
                    leading: CircleAvatar(
                      // Placeholder for company or person photo
                      backgroundColor: Colors.grey, // Dark Gray
                      child: Icon(Icons.person),
                    ),
                    title: Text(
                      contact.name,
                      style: TextStyle(
                        color: Colors.black, // Navy Blue/Dark Gray
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Phone: ${contact.phoneNumber}',
                          style: TextStyle(
                            color: Colors.black, // Navy Blue/Dark Gray
                          ),
                        ),
                        Text(
                          'WhatsApp: ${contact.whatsappNumber}',
                          style: TextStyle(
                            color: Colors.black, // Navy Blue/Dark Gray
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
