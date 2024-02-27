import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sherise/constants/app_color.dart';
import '../../controllers/home_controller.dart';

class HomePage extends StatelessWidget {
  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBlue,
      appBar: AppBar(
        title: Text(
          'Service Selection',
          style: TextStyle(
            color: AppColors.navyBlue,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColors.lightBlue,
        centerTitle: true,
      ),
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
                        color: AppColors.specialEmphasisColor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: AppColors.bubblegum.withOpacity(0.5),
                          width: 2, // Increased border width
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        service.name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.navyBlue,
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
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: AppColors.navyBlue.withOpacity(0.5),
                        width: 2, // Increased border width
                      ),
                    ),
                    child: ListTile(
                      leading: Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: AppColors.bubblegum,
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color: AppColors.navyBlue.withOpacity(0.5),
                            width: 2, // Increased border width
                          ),
                        ),
                        child: CircleAvatar(
                          backgroundColor: Colors.grey,
                          child: Icon(Icons.person),
                        ),
                      ),
                      title: Row(
                        children: [
                          Expanded(
                            child: Text(
                              contact.name,
                              style: TextStyle(
                                color: AppColors.navyBlue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.phone,
                                color: AppColors.navyBlue), // Change color here
                            onPressed: () {
                              // Implement phone call functionality
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.message,
                                color: AppColors.navyBlue), // Change color here
                            onPressed: () {
                              // Implement message functionality
                            },
                          ),
                        ],
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Phone: ${contact.phoneNumber}',
                            style: TextStyle(
                              color: AppColors.navyBlue,
                            ),
                          ),
                          Text(
                            'WhatsApp: ${contact.whatsappNumber}',
                            style: TextStyle(
                              color: AppColors.navyBlue,
                            ),
                          ),
                        ],
                      ),
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
