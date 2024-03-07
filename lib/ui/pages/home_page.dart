import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sherise/constants/app_color.dart';
import '../../controllers/home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBlue,
      appBar: AppBar(
        title: Text(
          'Find Your Service Provider',
          style: TextStyle(
            color: AppColors.navyBlue,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColors.lightBlue,
        centerTitle: true,
        elevation: 0, // No shadow
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
                      setState(() {
                        _homeController.selectService(service);
                      });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: service.selected
                            ? AppColors.babyPink
                            : AppColors.specialEmphasisColor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: AppColors.navyBlue.withOpacity(0.5),
                          width: 2,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            service.icon,
                            color: AppColors.navyBlue,
                            size: 24,
                          ),
                          SizedBox(height: 8),
                          Text(
                            service.name,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.navyBlue,
                              fontSize: 14,
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
                        color: AppColors.navyBlue.withOpacity(0.2),
                        width: 2,
                      ),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.zero, // Remove default padding
                      leading: CircleAvatar(
                        backgroundColor: Colors.grey,
                        child: Icon(Icons.person, color: AppColors.navyBlue),
                      ),
                      title: Text(
                        contact.name,
                        style: TextStyle(
                          color: AppColors.navyBlue,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2, // Limit to 2 lines
                        overflow: TextOverflow
                            .ellipsis, // Ellipsis if more than 2 lines
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              height:
                                  4), // Add some space between title and subtitle
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
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.phone, color: AppColors.bubblegum),
                            onPressed: () {
                              // Add phone call functionality
                            },
                          ),
                          IconButton(
                            icon:
                                Icon(Icons.message, color: AppColors.bubblegum),
                            onPressed: () {
                              // Add message functionality
                            },
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
