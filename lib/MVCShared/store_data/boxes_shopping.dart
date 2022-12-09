import 'package:hive/hive.dart';
import '../application_data/shopping_data.dart';
import '../application_data/total_data/total_shopping.dart';

class BoxesShopping {
  static Box<TotalShopping> getTotalShopping() =>
      Hive.box<TotalShopping>('getTotalShopping');
}

class BoxesDataShopping {
  static Box<DataShopping> getDataShopping() =>
      Hive.box<DataShopping>('getDataShopping');
}
