// import 'dart:js';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/utitlities/routes/rotuteName.dart';
import 'package:mvvm/view_model/user_view_model.dart';
import 'package:mvvm/model/usermodel.dart';

class SplashServies {
  Future<UserModel> getUserData() => UserViewModel().getUser();
  void checkAuthentication(BuildContext context) async {
    getUserData().then((value) async {
      if (value.token == 'null' || value.token == '') {
        Future.delayed(Duration(seconds: 10));
        Navigator.pushNamed(context, RoutesNames.login);
      } else {
        Future.delayed(Duration(seconds: 10));
        Navigator.pushNamed(context, RoutesNames.home);
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString);
      }
    });
  }
}
