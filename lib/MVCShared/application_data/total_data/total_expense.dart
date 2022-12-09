import '../expense_data.dart';
import 'package:hive/hive.dart';
part 'total_expense.g.dart';

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

@HiveType(typeId: 1)
class TotalExpense extends HiveObject {
  //Attributes class:
  @HiveField(0)
  final String nameTotalExpense;
  @HiveField(1)
  final String dateCreationTotalExpense;
  @HiveField(2)
  List<DataExpense> dateExpenseInside = [];

  //Constructor Object:
  TotalExpense(this.nameTotalExpense, this.dateCreationTotalExpense,
      this.dateExpenseInside);

  //Method that add Data (element) inside this Expenses.
  void addDataExpense(DataExpense newExpense) {
    dateExpenseInside.add(newExpense);
    save(); 
    // ignore: avoid_print
    print('DataExpense : ${newExpense.name} with price ${newExpense.price} save.');
  }

  //Method that remove Data (element) inside this Expenses.
  void removeDataExpense(DataExpense newExpense) {
    if (dateExpenseInside.contains(newExpense)) {
      dateExpenseInside.remove(newExpense);
      save();  
      // ignore: avoid_print
      print('DataExpense : ${newExpense.name} with price ${newExpense.price} removed.'); 
    }
  }

  //Getter for Attributes class:
  String getNameTotalExpense() {
    return nameTotalExpense;
  }

  String getDateCreationTotalExpense() {
    return dateCreationTotalExpense;
  }

  List<DataExpense> getDateExpenseInside() {
    return dateExpenseInside;
  }

  double getTotalAmount() {
    double priceTotal = 0;
    for (int i = 0; i < dateExpenseInside.length; i++) {
      priceTotal += dateExpenseInside[i].price;
    }
    return priceTotal;
  }

  //For me.
  String printElementInside() {
    for (int i = 0; i < dateExpenseInside.length; i++) {
      DataExpense tmp = dateExpenseInside.elementAt(i);
      return "ELEMENT: \nName : ${tmp.name}\nPrice : ${tmp.price}";
    }
    return "";
  }
}
