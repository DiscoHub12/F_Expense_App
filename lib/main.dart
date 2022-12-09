import 'package:definitive_flutter/MVCShared/application_data/generic_data.dart';
import 'package:definitive_flutter/MVCShared/application_data/total_data/total_generic.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'MVCShared/application_data/expense_data.dart';
import 'MVCShared/application_data/shopping_data.dart';
import 'MVCShared/application_data/total_data/total_expense.dart';
import 'MVCShared/application_data/total_data/total_shopping.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Hive Option
  await Hive.initFlutter();
  Hive.registerAdapter(TotalShoppingAdapter());
  Hive.registerAdapter(TotalExpenseAdapter());
  Hive.registerAdapter(TotalGenericAdapter());
  Hive.registerAdapter(DataShoppingAdapter());
  Hive.registerAdapter(DataExpenseAdapter());
  Hive.registerAdapter(DataGenericAdapter());
  //Open the Hive Box when the App is start.
  await Hive.openBox<TotalShopping>('getTotalShopping');
  await Hive.openBox<TotalExpense>('getTotalExpense');
  await Hive.openBox<TotalGeneric>('getTotalGeneric');
  await Hive.openBox<DataShopping>('getDataShopping');
  await Hive.openBox<DataExpense>('getDataExpense');
  await Hive.openBox<DataGeneric>('getDataGeneric');
  runApp(const App());
}
