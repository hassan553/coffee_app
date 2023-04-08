import 'package:dio/dio.dart';

class AuthRepo {
  Future userLogin({email, password}) async {
    try {
      Response response = await Dio().post(
        'https://student.valuxapps.com/api/login',
        data: {
          "email": email,
          "password": password,
        },
        queryParameters: {
          'lang': 'ar',
          'Content-Type': 'application/json',
        },
      );
      print(response.data);
    } catch (error) {
      print(error.toString());
    }
  }

  Future userRegister({
    var name,
    var phone,
    var password,
    var email,
  }) async {
    try {
      Response response = await Dio().post(
        'https://student.valuxapps.com/api/register',
        data: {
          'email': email,
          'password': password,
          'phone': phone,
          'name': name,
        },
      );
    } catch (error) {
      print(error.toString());
    }
  }
}
