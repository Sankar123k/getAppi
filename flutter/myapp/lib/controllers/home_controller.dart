import 'dart:convert';

import 'package:get/get.dart';
import 'package:myapp/models/home_model.dart';
import 'package:myapp/services/home_service.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  HomeService _homeService = HomeService();

  List<ResponseModel> list = [];

  bool loading = false;

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  void getData() async {
    try {
      loading = true;
      update();

      http.Response result = await _homeService.getData();

      if (result.statusCode == 200) {
        List<dynamic> dataList = jsonDecode(result.body);

        dataList.forEach((Value) {
          list.add(ResponseModel.fromJson(Value));
        });

        loading = false;

        // print(list);

        // print(result.body);
      }

      update();
    } catch (exception) {
      print(exception);
    }
  }
}
