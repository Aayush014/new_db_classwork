import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_db/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(title: const Text('Employee Details'),),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.empList.length,
          itemBuilder: (context, index) => ListTile(
            leading: Text(controller.empList[index]['id'].toString()),
            title: Text(controller.empList[index]['name']),
            subtitle: Text(controller.empList[index]['role']),
            trailing: Text("${controller.empList[index]['salary']}"),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.addData();
        },
      ),
    );
  }
}
