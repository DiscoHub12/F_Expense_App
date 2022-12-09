import 'package:definitive_flutter/MVCShared/application_data/generic_data.dart';
import 'package:definitive_flutter/MVCShared/application_data/total_data/total_generic.dart';
import 'package:definitive_flutter/MVCShared/store_data/boxes_general.dart';
import 'package:flutter/material.dart';
import '../other_pages/print_messages.dart';

class CreateGeneric extends StatefulWidget {
  const CreateGeneric({super.key, required this.title});

  final String title;

  @override
  State<CreateGeneric> createState() => _MyCreateGeneric();
}

class _MyCreateGeneric extends State<CreateGeneric> {
  final PrintStatus statusMessage = PrintStatus();
  final TextEditingController nameGenericController = TextEditingController();
  final TextEditingController dataGenericController = TextEditingController();
  final TextEditingController firstElementController = TextEditingController();
  late TotalGeneric tmpTotalGeneric;
  late DataGeneric tmpDataGeneric;

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

  Widget _firstTextName() => const Text('Welcome to Generic List Create Page.',
      style: TextStyle(fontSize: 17));

  Widget _secondTextNameList() =>
      const Text('Name Generic List ? ', style: TextStyle(fontSize: 17));

  Widget _firstTextNameInput() => TextFormField(
        //textCapitalization: TextCapitalization.words,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Name of Generic List?',
          labelText: 'Name',
        ),
        controller: nameGenericController,
      );

  Widget _secondTextName() =>
      const Text('Enter the Date', style: TextStyle(fontSize: 17));

  Widget _calendarCreationShow(BuildContext context) => TextField(
        controller: dataGenericController,
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
              dataGenericController.text = data;
            });
          }
        },
      );

  Widget _thirdTextInputElement() => const Text(
        'Compile your Generic list : ',
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
              onPressed: () => _createTotalGeneric(context),
              child: const Text('SAVE')),
        ],
      );

  //Method:
  void _clearAll() {
    nameGenericController.clear();
    dataGenericController.clear();
    firstElementController.clear();
  }

  void _createTotalGeneric(BuildContext context) async {
    //Hive Open:
    tmpDataGeneric = DataGeneric(firstElementController.text);
    List<DataGeneric> tmpListDataGeneric = [];
    tmpListDataGeneric.add(tmpDataGeneric);
    tmpTotalGeneric = TotalGeneric(nameGenericController.text,
        dataGenericController.text, tmpListDataGeneric);
    final box = BoxesGeneral.getTotalGeneric();
    box.add(tmpTotalGeneric);
    statusMessage.printCorrect(context, 'Generic list added into app.');
    Navigator.of(context, rootNavigator: true).pop(context);
  }
}
