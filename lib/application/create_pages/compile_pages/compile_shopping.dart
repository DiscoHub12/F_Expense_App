import 'package:flutter/material.dart';
import '../../../MVCShared/application_data/shopping_data.dart';
import '../../other_pages/print_messages.dart';

/// Class that creates a particular Widget,
/// which is used to fill in the first object
/// of an Expense. It is invoked by pressing
/// a button in the specific part of the program
/// for creating an expense.
class CompileShopping extends StatefulWidget {
  final Function(DataShopping) addDataShopping;

  const CompileShopping(this.addDataShopping, {super.key});

  @override
  State<CompileShopping> createState() => _MyCompileShopping();
}

class _MyCompileShopping extends State<CompileShopping> {
  //Controller Attributes for Name (DataExpense) and Price (DataExpense):
  TextEditingController nameDataShoppingController = TextEditingController();
  TextEditingController quantityDataShoppingController =
      TextEditingController();

  //Object type  PrintStatus:
  PrintStatus statusMessage = PrintStatus();

  //Build the effective Class Widget (Compile first element for TotalExpense).
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: 200,
      width: 380,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 10),
            _firstTextName(),
            const SizedBox(height: 10),
            _firstInputField('Name element', nameDataShoppingController),
            const SizedBox(height: 20),
            const SizedBox(height: 8),
            _lastRowButtons(nameDataShoppingController,
                quantityDataShoppingController, context),
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
        'Enter Shopping Element : ',
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

  Widget _lastRowButtons(TextEditingController controller,
          TextEditingController controller1, BuildContext context) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ElevatedButton(
              onPressed: () => _clearInput(controller, controller1),
              child: const Text('Clear')),
          ElevatedButton(
              onPressed: () => _addDataShopping(context),
              child: const Text('Add Element')),
        ],
      );

  //Internal Methods: (Button _clearInput and Button _addExpense):
  //Button _clearInput.
  void _clearInput(
      TextEditingController controller, TextEditingController controller1) {
    controller.clear();
    controller1.clear();
  }

  //Button _saveDataExpense
  void _addDataShopping(BuildContext context) {
    String name = nameDataShoppingController.text;
    int quantity = 1;
    if (name == "") {
      statusMessage.printError(context, 'Invalid name');
    }
    // ignore: unnecessary_null_comparison
    if (quantity == null) {
      quantity == 1;
    }
    DataShopping dataShoppingTmp = DataShopping(name);
    dataShoppingTmp.setQuantity(quantity);
    widget.addDataShopping(dataShoppingTmp);
    statusMessage.printCorrect(context, 'Shopping element added.');
    Navigator.pop(context);
  }
}
