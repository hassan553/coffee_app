import '../../home/data/model/coffee_model.dart';
import 'package:hive/hive.dart';

class LocalDatabase {
  var notesBox = Hive.box<CoffeeModel>('favorites');
  void addToFavorite(CoffeeModel coffeeModel) async {
    try {
      await notesBox.put(coffeeModel.id, coffeeModel);
      print('add successfully');
      getAllFavoriteCoffee();
    } catch (error) {
      print(error.toString());
    }
  }

  List<CoffeeModel> getAllFavoriteCoffee() {
    final allData = notesBox.values.toList();
    return allData;
  }

  void delete(int? id) async {
    try {
      await notesBox.delete(id).then((value) {
        print('delete success');
      });
    } catch (error) {
      print(error.toString());
    }
  }

  bool itemIsFavorite(int? id) {
    var result = notesBox.get(
      id,
    );
    return result == null ? false : true;
  }
}
