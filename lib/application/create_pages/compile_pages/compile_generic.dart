import 'package:flutter/material.dart';
import '../../../MVCShared/application_data/generic_data.dart';
import '../../other_pages/print_messages.dart';

/// Class that creates a particular Widget,
/// which is used to fill in the first object
/// of an Expense. It is invoked by pressing
/// a button in the specific part of the program
/// for creating an expense.
class CompileGeneric extends StatefulWidget {
  final Function(DataGeneric) addDataGeneric;

  const CompileGeneric(this.addDataGeneric, {super.key});

  @override
  State<CompileGeneric> createState() => _MyCompileGeneric();
}

class _MyCompileGeneric extends State<CompileGeneric> {
  //Controller Attributes for Name (DataExpense) and Price (DataExpense):
  TextEditingController nameDataShoppingController = TextEditingController();

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
            _lastRowButtons(nameDataShoppingController, context),
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
        'Enter Generic Element : ',
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

  Widget _lastRowButtons(
          TextEditingController controller, BuildContext context) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ElevatedButton(
              onPressed: () => _clearInput(controller),
              child: const Text('Clear')),
          ElevatedButton(
              onPressed: () => _addDataGeneric(context),
              child: const Text('Add Element')),
        ],
      );

  //Internal Methods: (Button _clearInput and Button _addExpense):
  //Button _clearInput.
  void _clearInput(TextEditingController controller) {
    controller.clear();
  }

  //Button _saveDataExpense
  void _addDataGeneric(BuildContext context) {
    String name = nameDataShoppingController.text;
    if (name == "") {
      statusMessage.printError(context, 'Invalid name');
    }
    DataGeneric dataGenericTmp = DataGeneric(name);
    widget.addDataGeneric(dataGenericTmp);
    statusMessage.printCorrect(context, 'Correct element added.');
    Navigator.pop(context);
  }
}
