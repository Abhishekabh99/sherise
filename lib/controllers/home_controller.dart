import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/contact_data.dart';
import '../models/service_data.dart';

class HomeController extends GetxController {
  final services = [
    Service(id: 1, name: 'Cake Bakers', icon: Icons.cake),
    Service(id: 2, name: 'Tuition Teachers', icon: Icons.school),
    Service(id: 3, name: 'Tailors', icon: Icons.format_paint),
    Service(id: 4, name: 'Art & Craft', icon: Icons.palette),
    Service(id: 5, name: 'Weaving', icon: Icons.texture),
    Service(id: 6, name: 'Beauty Parlor', icon: Icons.spa),
    Service(id: 7, name: 'Tiffin Service', icon: Icons.fastfood),
    Service(id: 8, name: 'Fashion Designers', icon: Icons.accessibility_new),
    Service(id: 9, name: 'Counselling', icon: Icons.chat),
    Service(id: 10, name: 'Maid', icon: Icons.cleaning_services),
    Service(id: 11, name: 'Baby Sitter', icon: Icons.child_care),
    Service(id: 12, name: 'Nurturers', icon: Icons.family_restroom),
  ].obs;

  final selectedService = RxInt(0);
  final selectedContacts = <Contact>[].obs;

  bool isSelected(Service service) => service.id == selectedService.value;

  void selectService(Service service) {
    selectedService.value = service.id;
    services.forEach((s) {
      s.selected = s.id == service.id;
    });
    generateDummyContacts(service.id);
    update();
  }

  void generateDummyContacts(int serviceId) {
    selectedContacts.clear();
    for (int i = 1; i <= 10; i++) {
      selectedContacts.add(
        Contact(
          name: 'Service provider $i for Service $serviceId',
          phoneNumber: '1234567890',
          whatsappNumber: '1234567890',
          serviceId: serviceId,
        ),
      );
    }
  }
}
