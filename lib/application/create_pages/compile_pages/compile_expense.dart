import 'package:flutter/material.dart';
import '../../../MVCShared/application_data/expense_data.dart';
import '../../other_pages/print_messages.dart';

/// Class that creates a particular Widget,
/// which is used to fill in the first object
/// of an Expense. It is invoked by pressing
/// a button in the specific part of the program
/// for creating an expense.
class CompileExpense extends StatefulWidget {
  final Function(DataExpense) addDataExpense;

  const CompileExpense(this.addDataExpense, {super.key});

  @override
  State<CompileExpense> createState() => _MyCompileExpense();
}

class _MyCompileExpense extends State<CompileExpense> {
  //Controller Attributes for Name (DataExpense) and Price (DataExpense):
  TextEditingController nameDataExpenseController = TextEditingController();
  TextEditingController priceDataExpenseController = TextEditingController();

  //Object type  PrintStatus:
  PrintStatus statusMessage = PrintStatus();

  //Build the effective Class Widget (Compile first element for TotalExpense).
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: 350,
      width: 400,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 10),
            _firstTextName(),
            const SizedBox(height: 10),
            _firstInputField('Name element', nameDataExpenseController),
            const SizedBox(height: 15),
            _secondTextPrice(),
            const SizedBox(height: 10),
            _buildPriceField('Price element', priceDataExpenseController),
            const SizedBox(height: 20),
            _lastRowButtons(
                nameDataExpenseController, priceDataExpenseController, context),
          ],
        ),
      ),
    );
  }

  /// For simplicity, without having
  /// to instantiate and create objects
  /// directly within the build method,
  /// they are created out separately for a simpler
  /// code structure and modular.
  Widget _firstTextName() => const Text(
        'Name element : ',
        style: TextStyle(fontSize: 17),
      );

  Widget _secondTextPrice() => const Text(
        'Price element : ',
        style: TextStyle(fontSize: 17),
      );

  Widget _firstInputField(String hint, TextEditingController controller) {
    return Container(
      margin: const EdgeInsets.all(4),
      child: TextField(
        decoration: InputDecoration(
            labelText: hint,
            border: const OutlineInputBorder(
                borderSide: BorderSide(
              color: Colors.black38,
            ))),
        controller: controller,
      ),
    );
  }

  Widget _buildPriceField(String hint, TextEditingController controller) {
    return Container(
      margin: const EdgeInsets.all(4),
      child: TextField(
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
            labelText: 'Enter a value',
            border: OutlineInputBorder(
                borderSide: BorderSide(
              color: Colors.black38,
            ))),
        controller: controller,
      ),
    );
  }

  Widget _lastRowButtons(TextEditingController controller1,
          TextEditingController controller2, BuildContext context) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ElevatedButton(
              onPressed: () => _clearInput(controller1, controller2),
              child: const Text('Clear')),
          ElevatedButton(
              onPressed: () => _addExpense(context),
              child: const Text('Add Element')),
        ],
      );

  //Internal Methods: (Button _clearInput and Button _addExpense):
  //Button _clearInput.
  void _clearInput(
      TextEditingController controller1, TextEditingController controller2) {
    controller1.clear();
    controller2.clear();
  }

  //Button _saveDataExpense
  void _addExpense(BuildContext context) {
    String nameTmp = nameDataExpenseController.text;
    double priceTmp = (double.parse(priceDataExpenseController.text));
    if (nameTmp == "" || priceTmp == 0) {
      statusMessage.printError(context, 'Invalid Name or Pice.');
    } else {
      DataExpense dataExpenseTmp = DataExpense(nameTmp, priceTmp);
      widget.addDataExpense(dataExpenseTmp);
      statusMessage.printCorrect(context, 'Expense element added.');
      _clearInput(nameDataExpenseController, priceDataExpenseController);
      Navigator.pop(context);
    }
  }
}
