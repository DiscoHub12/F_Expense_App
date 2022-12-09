import 'package:hive/hive.dart';
import '../application_data/expense_data.dart';
import '../application_data/total_data/total_expense.dart';

class BoxesExpense {
  static Box<TotalExpense> getTotalExpense() =>
      Hive.box<TotalExpense>('getTotalExpense');
}

class BoxesDataExpense {
  static Box<DataExpense> getDataExpenses() =>
      Hive.box<DataExpense>('getDataExpense');
}
