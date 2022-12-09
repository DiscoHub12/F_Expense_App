import 'package:hive/hive.dart';
part 'expense_data.g.dart';

/// This class provides a default implementation
/// to represent the concept of a given expense of an
/// expense list data, which will be a Name-Price value pair.
/// For example , the list may contain :
/// 'Coffee' (that represent the Name) -
/// '1 euro' (that represent the Price).

@HiveType(typeId: 4)
class DataExpense extends HiveObject {
  //Attributes class:
  @HiveField(0)
  String name;
  @HiveField(1)
  double price;
  @HiveField(2)
  bool checked = false;

  //Constructor Object:
  DataExpense(this.name, this.price);

  //Getter for Name and Price Attribute.
  String getNameData() {
    return name;
  }

  double getPriceData() {
    return price;
  }

  //toString method:
  String toStringDataExpense() {
    return "\n--Name : ${getNameData()}\n--Price Data : ${getPriceData()}";
  }
}
