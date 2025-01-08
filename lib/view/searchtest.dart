import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:srbiau_digital_plaque/controller/all_companies_controller.dart';


class BusinessSearchPage extends StatelessWidget {
  final AllBusinessController controller = Get.put(AllBusinessController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Businesses'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
              ),
              onChanged: (query) {
                controller.searchBusinesses(query);
              },
            ),
          ),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }
      
              if (controller.businesses.isEmpty) {
                return const Center(child: Text('No businesses found'));
              }
      
              return ListView.builder(
                itemCount: controller.businesses.length,
                itemBuilder: (context, index) {
                  final business = controller.businesses[index];
                  return ListTile(
                    title: Text(business.name),
                    subtitle: Text(business.businessField),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
