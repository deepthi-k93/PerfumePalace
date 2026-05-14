import 'package:project_entri/reuse_functions.dart';
import 'package:project_entri/theme/values.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ExpenseProvider with ChangeNotifier {
  var expenseBox = Hive.box(Values.pennyBox);
  Future<void> fetchExpenses() async {
    Iterable<dynamic> values = expenseBox.values;
    if (values.isEmpty) {
      return;
    } else {
      Iterable<dynamic> expenses = values;
      String msg = "Expenses :$expenses";
      ReuseFunctions.logPrint().d(msg);
    }
  }
}
