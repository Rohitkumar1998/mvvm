import 'package:mvvm/data/network/base_api_serivese.dart';
import 'package:mvvm/data/network/networkApiServices.dart';
import 'package:mvvm/resourses/app_url.dart';

class AuthRespository {
  BaseApiServices _apiServices = NetworkApiService();
  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.loginEndPoint, data);
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> signUpApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.registerEndpoint, data);
      return response;
    } catch (e) {
      throw e;
    }
  }
}
