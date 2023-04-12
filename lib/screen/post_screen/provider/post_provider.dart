import 'package:flutter/material.dart';
import 'package:post_apicall/utils/api_helper.dart';

class Post_Provider extends ChangeNotifier {
  Future<String> post(String name, String job) async {
    Api_helper apiHelper = Api_helper();

    String msg = await apiHelper.post(name, job);
    return msg;
  }
}
