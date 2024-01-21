import 'package:dartz/dartz.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/networking/failure.dart';
import '../../../home/data/model/coffee_model.dart';
import 'package:hive/hive.dart';

class FavoriteLocalDatabase {
  final _notesBox = Hive.box<CoffeeModel>(favoriteBox);

  Future<Either<Failure, Unit>> addToFavorite(CoffeeModel coffeeModel) async {
    try {
      await _notesBox.put(coffeeModel.id, coffeeModel);

      getAllFavoriteCoffee();
      return right(unit);
    } catch (error) {
      return left(CacheFailure(error.toString()));
    }
  }

  List<CoffeeModel> getAllFavoriteCoffee() {
    final allData = _notesBox.values.toList();
    return allData;
  }

  Future<Either<Failure, Unit>> delete(int? id) async {
    try {
      await _notesBox.delete(id);
      return right(unit);
    } catch (error) {
      return left(CacheFailure(error.toString()));
    }
  }

  bool itemIsFavorite(int? id) {
    var result = _notesBox.get(
      id,
    );
    return result == null ? false : true;
  }
}
