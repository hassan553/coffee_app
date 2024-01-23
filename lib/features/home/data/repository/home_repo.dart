import 'package:coffee_app/core/networking/api_constants.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/functions/checkinternet.dart';
import '../../../../core/networking/failure.dart';
import '../model/coffee_model.dart';
import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';

class HomeRepository {
  Future<Either<Failure, List<CoffeeModel>>> getData() async {
    if (await checkInternet()) {
      try {
        List<CoffeeModel> list = [];
        Response response = await Dio().get(ApiEndPoints.coffeeUrl);
        response.data.forEach((element) {
          list.add(CoffeeModel.fromJson(element));
        });
        if (response.statusCode == 200) {
          return right(list);
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
