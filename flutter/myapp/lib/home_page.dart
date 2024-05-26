import 'package:flutter/material.dart';
import 'package:myapp/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:myapp/models/home_model.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GetBuilder<HomeController>(builder: (_) {
        return ListView.builder(
            shrinkWrap: true,
            itemCount: homeController.list.length,
            itemBuilder: (context, index) {
              ResponseModel data = homeController.list[index];

              return Card(
                child: ListTile(
                  leading: Text(data.id.toString()),
                  title: Text(data.title.toString()),
                  subtitle: Text(data.body.toString()),
                ),
              );
            });
      }),
    );
  }
}
