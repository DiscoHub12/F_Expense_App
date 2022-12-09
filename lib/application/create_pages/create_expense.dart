import 'package:definitive_flutter/MVCShared/store_data/boxes_expense.dart';
import 'package:flutter/material.dart';
import '../../MVCShared/application_data/expense_data.dart';
import '../../MVCShared/application_data/total_data/total_expense.dart';
import '../other_pages/print_messages.dart';
import 'compile_pages/compile_expense.dart';

class CreateExpense extends StatefulWidget {
  const CreateExpense({super.key, required this.title});
  final String title;

  @override
  State<CreateExpense> createState() => _MyCreateExpense();
}

class _MyCreateExpense extends State<CreateExpense> {
  //For message or error:
  PrintStatus statusMessage = PrintStatus();
  TextEditingController nameExpenseController = TextEditingController();
  TextEditingController dataExpenseController = TextEditingController();
  late DataExpense tmpDataExpense;
  late TotalExpense tmpTotalExpense;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 18.0),
            _firstTextName(),
            const SizedBox(height: 14.0),
            _inputName(),
            const SizedBox(height: 18.0),
            _secondTextDate(),
            const SizedBox(height: 14.0),
            _showCalendar(context),
            const SizedBox(height: 18.0),
            _thirdTextCompile(),
            const SizedBox(height: 14.0),
            _showCompilingRow(context),
            const SizedBox(height: 24.0),
            _fourTextSave(),
            const SizedBox(height: 14.0),
            _saveButton(context),
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
        'Name Expense',
        style: TextStyle(fontSize: 17),
      );

  Widget _inputName() => TextFormField(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Name of Expense List?',
          labelText: 'Name',
        ),
        controller: nameExpenseController,
      );

  Widget _secondTextDate() => const Text(
        'Enter Date',
        style: TextStyle(fontSize: 17),
      );

  Widget _showCalendar(BuildContext context) => TextField(
        controller: dataExpenseController,
        decoration: const InputDecoration(
          icon: Icon(Icons.calendar_today),
          labelText: "Enter Date",
        ),
        readOnly: true,
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2018),
            lastDate: DateTime(2023),
          );
          if (pickedDate != null) {
            //String formattedDate = DateFormat("yyyy-mm-dd").format(pickedDate);
            setState(() {
              String data =
                  "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
              dataExpenseController.text = data;
            });
          }
        },
      );

  Widget _thirdTextCompile() =>
      const Text('Compile Your Expense Week', style: TextStyle(fontSize: 17));

  Widget _showCompilingRow(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('Add first element to create expense  ',
              style: TextStyle(fontSize: 17)),
          ElevatedButton(
              onPressed: () => _showCompileForm(context),
              child: const Text('+'))
        ],
      );

  Widget _fourTextSave() => const Text(
        'Pressing the save Button, you save this expense.\nYou will be taken back to the Home Page',
      );

  Widget _saveButton(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ElevatedButton(onPressed: _clearAll, child: const Text('CLEAR')),
          ElevatedButton(
              onPressed: () => _createTotalExpense(context),
              child: const Text('SAVE')),
        ],
      );

  //Clear input.
  void _clearAll() {
    nameExpenseController.clear();
    dataExpenseController.clear();
  }

  //METHOD FOR THIS CLASS:
  void _showCompileForm(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            content: CompileExpense(_addFirstDataExpense),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          );
        });
  }

  void _addFirstDataExpense(DataExpense expense) {
    setState(() {
      tmpDataExpense = expense;
    });
  }

  void _createTotalExpense(BuildContext context) {
    List<DataExpense> tmpListDataExpense = [];
    tmpListDataExpense.add(tmpDataExpense);
    tmpTotalExpense = TotalExpense(nameExpenseController.text,
        dataExpenseController.text, tmpListDataExpense);
    final box = BoxesExpense.getTotalExpense();
    box.add(tmpTotalExpense);
    statusMessage.printCorrect(context, 'Expense added into app');
    Navigator.of(context, rootNavigator: true).pop(context);
  }
}
