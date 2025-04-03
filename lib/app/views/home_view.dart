import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildGreeting(),
            SizedBox(height: 20),
            _buildSupplementsSection(),
            SizedBox(height: 20),
            _buildDiscoverSection(),
          ],
        ),
      ),
      floatingActionButton: _buildFloatingButton(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text("APEX BIOTICS",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange)),
      actions: [
        IconButton(icon: Icon(Icons.calendar_today, color: Colors.black), onPressed: () {}),
      ],
    );
  }

  Widget _buildGreeting() {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage("assets/profile.jpg"),
          radius: 24,
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hallo, Max!", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    );
  }

  Widget _buildSupplementsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Today", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Obx(() => Column(
          children: controller.supplements.map((supplement) {
            return Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                leading: Icon(Icons.medical_services, color: Colors.grey),
                title: Text(supplement["name"].toString(), style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(
                  "Form: ${supplement["form"]}\nDosage: ${supplement["dosage"]}\nIntake Time: ${supplement["time"]}",
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(supplement["status"].toString(), style: TextStyle( fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            );
          }).toList(),
        )),
      ],
    );
  }

  Widget _buildDiscoverSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Discover", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset("asset/images/coverImage.png", height: 150, fit: BoxFit.cover),
        ),
      ],
    );
  }

  Widget _buildFloatingButton() {
    return FloatingActionButton(
      backgroundColor: Colors.purple,
      onPressed: () {},
      child: Text("L", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
    );
  }
}
