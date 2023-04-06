import 'package:coffee_app/fetures/home/data/model/coffee_model.dart';
import 'package:dio/dio.dart';

class HomeRepository {
  final Dio _dio = Dio();
  Future<List<CoffeeModel>> getData() async {
    List<CoffeeModel> list = [];
    Response response = await _dio.get('https://api.sampleapis.com/coffee/hot');
    response.data.forEach((element) {
      list.add(CoffeeModel.fromJson(element));
    });
    return list;
  }
}
