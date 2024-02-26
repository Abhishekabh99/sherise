import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/home_controller.dart';

class HomePage extends StatelessWidget {
  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Service selection row
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _homeController.services.length,
              itemBuilder: (context, index) {
                final service = _homeController.services[index];
                return InkWell(
                  onTap: () => _homeController.selectService(service),
                  child: Container(
                    width: 100,
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: _homeController.isSelected(service)
                          ? Colors.blue
                          : Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                    child: Text(service.name),
                  ),
                );
              },
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
                      backgroundColor: Colors.grey,
                      child: Icon(Icons.person),
                    ),
                    title: Text(contact.name),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Phone: ${contact.phoneNumber}'),
                        Text('WhatsApp: ${contact.whatsappNumber}'),
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
