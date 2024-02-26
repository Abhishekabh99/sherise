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
  ];
  final selectedService = RxInt(0);
  final selectedContacts = <Contact>[].obs;

  bool isSelected(Service service) => service.id == selectedService.value;

  void selectService(Service service) {
    // Update the selectedService value
    selectedService.value = service.id;

    // Update the selected property of each service
    for (final s in services) {
      s.selected = s.id == service.id;
    }

    // Trigger UI update
    update();

    // Add logic to filter contacts based on the selected service
    // Simulated data for contacts, replace it with actual data retrieval logic
    if (service.id == 1) {
      selectedContacts.value = [
        Contact(
          name: 'Baker 1',
          phoneNumber: '1234567890',
          whatsappNumber: '1234567890',
          serviceId: service.id,
        ),
        Contact(
          name: 'Baker 2',
          phoneNumber: '1234567890',
          whatsappNumber: '1234567890',
          serviceId: service.id,
        ),
      ];
    } else if (service.id == 2) {
      selectedContacts.value = [
        Contact(
          name: 'Teacher 1',
          phoneNumber: '1234567890',
          whatsappNumber: '1234567890',
          serviceId: service.id,
        ),
        Contact(
          name: 'Teacher 2',
          phoneNumber: '1234567890',
          whatsappNumber: '1234567890',
          serviceId: service.id,
        ),
      ];
    } else if (service.id == 3) {
      selectedContacts.value = [
        Contact(
          name: 'Tailor 1',
          phoneNumber: '1234567890',
          whatsappNumber: '1234567890',
          serviceId: service.id,
        ),
        Contact(
          name: 'Tailor 2',
          phoneNumber: '1234567890',
          whatsappNumber: '1234567890',
          serviceId: service.id,
        ),
      ];
    }
    // Similarly add logic for other services
  }
}
