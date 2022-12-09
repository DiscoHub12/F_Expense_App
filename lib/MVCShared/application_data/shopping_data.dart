import 'package:hive/hive.dart';
part 'shopping_data.g.dart';

/// This class provides a default implementation
/// to represent the concept of a element inside Shopping
/// list of an Shopping list data which will be a Name.

@HiveType(typeId: 5)
class DataShopping extends HiveObject {
  //Attributes class:
  @HiveField(0)
  String nameElement;
  @HiveField(1)
  bool checked = false;
  @HiveField(2)
  int quantity = 1;
  //Constructor Object:
  DataShopping(this.nameElement);

  //Getter:
  String getNameElement() {
    return nameElement;
  }

  //ToString method for print element:
  String toStringDataShopping() {
    return "\nElement name : $nameElement";
  }

  void setQuantity(int quantity) {
    quantity = quantity;
  }
}
