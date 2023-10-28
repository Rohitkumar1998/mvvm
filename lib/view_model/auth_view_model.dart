import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/reposetry/auth_repository.dart';
import 'package:mvvm/utitlities/routes/rotuteName.dart';
import 'package:mvvm/utitlities/routes/utils.dart';

class AuthViewModel with ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;
  bool _signUploading = false;
  bool get signUploading => _signUploading;
  setSignupLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  final _myRepo = AuthRespository();
  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.loginApi(data).then((value) {
      setLoading(false);
      Utils.flushBarErrorMessage('Login Succesfully', context);
      Navigator.pushNamed(context, RoutesNames.home);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  Future<void> signUpApi(dynamic data, BuildContext context) async {
    setSignupLoading(true);
    _myRepo.signUpApi(data).then((value) {
      setSignupLoading(false);
      Utils.flushBarErrorMessage('SignUp Succesfully', context);
      Navigator.pushNamed(context, RoutesNames.home);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setSignupLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
