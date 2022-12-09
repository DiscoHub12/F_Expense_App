import 'package:definitive_flutter/MVCShared/application_data/shopping_data.dart';
import 'package:definitive_flutter/MVCShared/store_data/boxes_shopping.dart';
import 'package:flutter/material.dart';

import '../../MVCShared/application_data/total_data/total_shopping.dart';
import '../other_pages/print_messages.dart';

class CreateShopping extends StatefulWidget {
  const CreateShopping({super.key, required this.title});

  final String title;

  @override
  State<CreateShopping> createState() => _MyCreateShopping();
}

class _MyCreateShopping extends State<CreateShopping> {
  final PrintStatus statusMessage = PrintStatus();
  final TextEditingController nameShoppingController = TextEditingController();
  final TextEditingController dataShoppingController = TextEditingController();
  final TextEditingController firstElementController = TextEditingController();
  late TotalShopping tmpTotalShopping;
  late DataShopping tmpDataShopping;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 18),
            _firstTextName(),
            const SizedBox(height: 10),
            _secondTextNameList(),
            const SizedBox(height: 18),
            _firstTextNameInput(),
            const SizedBox(height: 18),
            _secondTextName(),
            const SizedBox(height: 10),
            _calendarCreationShow(context),
            const SizedBox(height: 20),
            _thirdTextInputElement(),
            const SizedBox(height: 20),
            _showCompileFirstElement(),
            const SizedBox(height: 22),
            _fourTextSave(),
            const SizedBox(height: 22),
            _showButtonChoice(context),
          ],
        ),
      ),
    );
  }

  Widget _firstTextName() => const Text('Welcome to Shopping Create Page.',
      style: TextStyle(fontSize: 17));

  Widget _secondTextNameList() =>
      const Text('Name Shopping List ? ', style: TextStyle(fontSize: 17));

  Widget _firstTextNameInput() => TextFormField(
        //textCapitalization: TextCapitalization.words,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Name of Shopping List?',
          labelText: 'Name',
        ),
        controller: nameShoppingController,
      );

  Widget _secondTextName() =>
      const Text('Enter the Date', style: TextStyle(fontSize: 17));

  Widget _calendarCreationShow(BuildContext context) => TextField(
        controller: dataShoppingController,
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
            setState(() {
              String data =
                  "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
              dataShoppingController.text = data;
            });
          }
        },
      );

  Widget _thirdTextInputElement() => const Text(
        'Compile your Shopping list : ',
        style: TextStyle(fontSize: 17),
      );

  Widget _showCompileFirstElement() => TextFormField(
      //textCapitalization: TextCapitalization.words,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Element List?',
        labelText: 'Element',
      ),
      controller: firstElementController);

  Widget _fourTextSave() => const Text(
        'Pressing the save Button, you save this expense.\nYou will be taken back to the Home Page',
      );

  Widget _showButtonChoice(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ElevatedButton(onPressed: _clearAll, child: const Text('CLEAR')),
          ElevatedButton(
              onPressed: () => _createTotalExpense(context),
              child: const Text('SAVE')),
        ],
      );

  //Method:
  void _clearAll() {
    nameShoppingController.clear();
    dataShoppingController.clear();
    firstElementController.clear();
  }

  void _createTotalExpense(BuildContext context) async {
    //Hive Open:
    tmpDataShopping = DataShopping(firstElementController.text);
    List<DataShopping> tmpListDataShopping = [];
    tmpListDataShopping.add(tmpDataShopping);
    tmpTotalShopping = TotalShopping(nameShoppingController.text,
        dataShoppingController.text, tmpListDataShopping);
    final box = BoxesShopping.getTotalShopping();
    box.add(tmpTotalShopping);
    statusMessage.printCorrect(context, 'Shopping added into app.');
    Navigator.of(context, rootNavigator: true).pop(context);
  }
}
