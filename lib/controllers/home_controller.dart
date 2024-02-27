// home_controller.dart
import 'package:get/get.dart';
import '../models/contact_data.dart';
import '../models/service_data.dart';

class HomeController extends GetxController {
  final services = [
    Service(id: 1, name: 'Cake Bakers'),
    Service(id: 2, name: 'Tuition Teachers'),
    Service(id: 3, name: 'Tailors'),
    Service(id: 4, name: 'Art & Craft'),
    Service(id: 5, name: 'Weaving'),
    Service(id: 6, name: 'Beauty Parlor'),
    Service(id: 7, name: 'Tiffin Service'),
    Service(id: 8, name: 'Fashion Designers'),
    Service(id: 9, name: 'Counselling'),
    Service(id: 10, name: 'Maid'),
    Service(id: 11, name: 'Baby Sitter'),
    Service(id: 12, name: 'Nurturers'),
  ].obs; // Observe the list of services

  final selectedService = RxInt(0); // Observable for the selected service ID
  final selectedContacts =
      <Contact>[].obs; // Observe the list of selected contacts

  // Method to check if a service is selected
  bool isSelected(Service service) => service.id == selectedService.value;

  // Method to handle service selection
  void selectService(Service service) {
    selectedService.value = service.id; // Update the selected service ID

    // Update the selected property of each service based on the selection
    services.forEach((s) {
      s.selected = s.id == service.id;
    });

    // Generate dummy data for the selected service
    generateDummyContacts(service.id);

    // Trigger UI update
    update();
  }

  // Method to generate dummy contacts for the selected service
  void generateDummyContacts(int serviceId) {
    // Clear the existing list of selected contacts
    selectedContacts.clear();

    // Generate dummy data for at least 10 list tiles for the selected service
    for (int i = 1; i <= 10; i++) {
      selectedContacts.add(
        Contact(
          name: 'Dummy Contact $i for Service $serviceId',
          phoneNumber: '1234567890',
          whatsappNumber: '1234567890',
          serviceId: serviceId,
        ),
      );
    }
  }
}
