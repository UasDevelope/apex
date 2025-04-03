import 'package:get/get.dart';

class HomeController extends GetxController {
  var supplements = [
    {
      "name": "Omega-3",
      "form": "Capsule",
      "dosage": "2 Capsules",
      "time": "Morning",
      "status": "Taken",
      "statusColor": 0xFF4CAF50
    },
    {
      "name": "Vitamin D3",
      "form": "Softgel",
      "dosage": "1 Softgel",
      "time": "Evening",
      "status": "Missed",
      "statusColor": 0xFFF44336
    },
    {
      "name": "Protein Powder",
      "form": "Powder",
      "dosage": "1 Scoop",
      "time": "Night",
      "status": "Rescheduled",
      "statusColor": 0xFF3F51B5
    }
  ].obs;
}
