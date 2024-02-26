// home_controller.dart
import 'package:get/get.dart';

class HomeController extends GetxController {
  final List<Service> services = [
    Service(id: 1, name: 'Cake Bakers'),
    Service(id: 2, name: 'Tuition Teachers'),
    Service(id: 3, name: 'Tailors'),
    Service(id: 4, name: 'Art & craft'),
    Service(id: 5, name: 'Weaving'),
    Service(id: 6, name: 'Beauty Parlor'),
    Service(id: 7, name: 'Tiffin service'),
    Service(id: 8, name: 'Fashion designers'),
    Service(id: 9, name: 'Counselling'),
    Service(id: 10, name: 'Maid'),
    Service(id: 11, name: 'Baby sitter'),
    Service(id: 12, name: 'Nurturers'),
  ];

  final selectedService = Service(id: 0, name: '').obs;
  final selectedContacts = <Contact>[].obs;

  final List<Contact> initialContacts = [
    Contact(
        name: 'Baker 1',
        phoneNumber: '1234567890',
        whatsappNumber: '1234567890',
        serviceId: 1),
    Contact(
        name: 'Baker 2',
        phoneNumber: '1234567890',
        whatsappNumber: '1234567890',
        serviceId: 1),
    Contact(
        name: 'Teacher 1',
        phoneNumber: '1234567890',
        whatsappNumber: '1234567890',
        serviceId: 2),
    Contact(
        name: 'Teacher 2',
        phoneNumber: '1234567890',
        whatsappNumber: '1234567890',
        serviceId: 2),
    Contact(
        name: 'Tailor 1',
        phoneNumber: '1234567890',
        whatsappNumber: '1234567890',
        serviceId: 3),
    Contact(
        name: 'Tailor 2',
        phoneNumber: '1234567890',
        whatsappNumber: '1234567890',
        serviceId: 3),
    // Add more contacts here...
  ];

  @override
  void onInit() {
    super.onInit();
    selectedContacts.assignAll(initialContacts
        .where((contact) => contact.serviceId == selectedService.value.id));
  }

  bool isSelected(Service service) => selectedService.value.id == service.id;

  void selectService(Service service) {
    selectedService.value = service;
    selectedContacts.value = initialContacts
        .where((contact) => contact.serviceId == service.id)
        .toList();
  }
}

class Service {
  final int id;
  final String name;

  Service({required this.id, required this.name});
}

class Contact {
  final String name;
  final String phoneNumber;
  final String whatsappNumber;
  final int serviceId;

  Contact({
    required this.name,
    required this.phoneNumber,
    required this.whatsappNumber,
    required this.serviceId,
  });
}
