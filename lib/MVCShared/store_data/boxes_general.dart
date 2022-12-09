import 'package:definitive_flutter/MVCShared/application_data/generic_data.dart';
import 'package:definitive_flutter/MVCShared/application_data/total_data/total_generic.dart';
import 'package:hive/hive.dart';

class BoxesGeneral {
  static Box<TotalGeneric> getTotalGeneric() =>
      Hive.box<TotalGeneric>('getTotalGeneric');
}

class BoxesDataGeneral {
  static Box<DataGeneric> getDataGeneric() =>
      Hive.box<DataGeneric>('getDataGeneric');
}
