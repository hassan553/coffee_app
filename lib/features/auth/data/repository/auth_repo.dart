import 'package:coffee_app/core/functions/checkinternet.dart';
import 'package:coffee_app/core/networking/api_constants.dart';
import 'package:coffee_app/core/networking/failure.dart';
import 'package:dio/dio.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/constants/constants.dart';

class AuthRepo {
  Future<Either<Failure, String>> userLogin({var email, var password}) async {
    if (await checkInternet()) {
      try {
        Response response = await Dio().post(
          ApiEndPoints.loginUri,
          data: {
            "email": email,
            "password": password,
          },
          queryParameters: {
            'lang': 'ar',
            'Content-Type': 'application/json',
          },
        );

        if (response.statusCode == 200) {
          return right('Success Login');
        } else {
          return left(ServerFailure.fromResponse(
              statusCode: response.statusCode!,
              message: response.data['message']));
        }
      } catch (error) {
        return left(ServerFailure(error.toString()));
      }
    } else {
      return left(NoInternetFailure(noInternetMessage));
    }
  }

  Future userRegister({
    var name,
    var phone,
    var password,
    var email,
  }) async {
    if (await checkInternet()) {
      try {
        Response response = await Dio().post(
          ApiEndPoints.registerUri,
          data: {
            'email': email,
            'password': password,
            'phone': phone,
            'name': name,
          },
        );
        if (response.statusCode == 200) {
          return right('Success Register ');
        } else {
          return left(ServerFailure.fromResponse(
              statusCode: response.statusCode!,
              message: response.data['message']));
        }
      } catch (error) {
        return left(ServerFailure(error.toString()));
      }
    } else {
      return left(NoInternetFailure(noInternetMessage));
    }
  }
}
