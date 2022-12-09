import '../shopping_data.dart';
import 'package:hive/hive.dart';
part 'total_shopping.g.dart';

/// This class, once having created the basic data
/// of the Shopping list called DataShopping, will provide a
/// default implementation for the creation of the
/// list of the Shoppings carried out, having as attributes:
/// -the name of the Shopping list.
/// -the date of creation of this Shopping list.
/// -the list of Element inside Shopping list made, which
/// represents a Name of element.

@HiveType(typeId: 2)
class TotalShopping extends HiveObject {
  //Attributes class:
  @HiveField(0)
  String nameTotalShopping;
  @HiveField(1)
  String data;
  @HiveField(2)
  List<DataShopping> elementInside = [];

  //Constructor of Object type Shopping:
  TotalShopping(this.nameTotalShopping, this.data, this.elementInside);

  //Method that add Data (String name) into this Shopping list.
  void addDataShopping(DataShopping shopping) {
    elementInside.add(shopping);
    save();
    // ignore: avoid_print
    print('DataShopping : ${shopping.nameElement} save.');
  }

  //Method that remove Data (name) into this Shopping list.
  void removeDataShopping(DataShopping shopping) {
    if (elementInside.contains(shopping)) {
      elementInside.remove(shopping);
      save();
      // ignore: avoid_print
      print('DataShopping : ${shopping.nameElement} removed.');
    }
  }

  //Getter method for attributes (name, contentShopping, type):
  String getNameShopping() {
    return nameTotalShopping;
  }

  String getTypeShopping() {
    return data;
  }

  List<DataShopping> getElementInside() {
    return elementInside;
  }

  //For me.
  String printElementInside() {
    for (int i = 0; i < elementInside.length; i++) {
      DataShopping tmp = elementInside.elementAt(i);
      return "\nName Element : ${tmp.nameElement}";
    }
    return "";
  }
}
