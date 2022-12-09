import 'package:definitive_flutter/MVCShared/application_data/generic_data.dart';

import 'package:hive/hive.dart';
part 'total_generic.g.dart';

/// This class, once having created the basic data
/// of the Expense called DataExpense, will provide a
/// default implementation for the creation of the
/// list of the expenses carried out, having as attributes:
/// -the name of the Expense.
/// -the date of creation of the Expense.
/// -the list of Expenses made, or DataExpense, which
/// represents a pair of key value where the key is the
/// name of the Object bought and the value is the price of
/// the Object.

@HiveType(typeId: 3)
class TotalGeneric extends HiveObject {
  //Attributes class:
  @HiveField(0)
  final String nameTotalGeneric;
  @HiveField(1)
  final String dataCreationTotalGeneric;
  @HiveField(2)
  List<DataGeneric> dataGenericInside = [];

  //Constructor Object:
  TotalGeneric(this.nameTotalGeneric, this.dataCreationTotalGeneric,
      this.dataGenericInside);

  //Method that add Data (element) inside this Expenses.
  void addDataGeneric(DataGeneric newGeneric) {
    dataGenericInside.add(newGeneric);
    save();
    // ignore: avoid_print
    print('DataExpense : ${newGeneric.name} save.');
  }

  //Method that remove Data (element) inside this Expenses.
  void removeDataGeneric(DataGeneric newGeneric) {
    if (dataGenericInside.contains(newGeneric)) {
      dataGenericInside.remove(newGeneric);
      save();
      // ignore: avoid_print
      print('DataGeneric : ${newGeneric.name} removed.');
    }
  }

  //Getter for Attributes class:
  String getNameTotalGeneric() {
    return nameTotalGeneric;
  }

  String getDateCreationTotalGeneric() {
    return dataCreationTotalGeneric;
  }

  List<DataGeneric> getDataGenericInside() {
    return dataGenericInside;
  }

  //For me.
  String printElementInside() {
    for (int i = 0; i < dataGenericInside.length; i++) {
      DataGeneric tmp = dataGenericInside.elementAt(i);
      return "ELEMENT: \nName : ${tmp.name}";
    }
    return "";
  }
}
