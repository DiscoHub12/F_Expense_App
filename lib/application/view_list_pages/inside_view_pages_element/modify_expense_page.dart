import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../../../MVCShared/application_data/expense_data.dart';
import '../../../MVCShared/application_data/total_data/total_expense.dart';
import '../../create_pages/compile_pages/compile_expense.dart';

class PageModifyExpense extends StatefulWidget {
  const PageModifyExpense({
    super.key,
    required this.totalExpense,
    required this.title,
    required this.index,
  });

  final TotalExpense totalExpense;
  final String title;
  final int index;

  @override
  State<StatefulWidget> createState() => _MyPageModifyExpense();
}

class _MyPageModifyExpense extends State<PageModifyExpense> {
  late DataExpense newTmpExpense;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              const SizedBox(height: 14),
              _firstRow(),
              const SizedBox(height: 17),
              _secondRow(),
              const SizedBox(height: 17),
              _showElementInsideTitle(),
              const SizedBox(height: 15),
              SizedBox(height: 370, child: _showElementInside(context)),
              const SizedBox(height: 15),
              Text(
                'Total amount : ${widget.totalExpense.getTotalAmount()} €',
                style: const TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 15),
              //_showButtonSaveUpdate(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showCompileForm(context),
        backgroundColor: Colors.orange,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _firstRow() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          const Text('Name Expense List :', style: TextStyle(fontSize: 18)),
          Text(widget.totalExpense.nameTotalExpense,
              style: const TextStyle(fontSize: 18)),
        ],
      );

  Widget _secondRow() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          const Text('Creation Date : ', style: TextStyle(fontSize: 18.0)),
          Text(widget.totalExpense.dateCreationTotalExpense,
              style: const TextStyle(fontSize: 18.0)),
        ],
      );

  Widget _showElementInsideTitle() => const Text(
        'Element of this Expense:',
        style: TextStyle(fontSize: 18),
      );

  void _showCompileForm(BuildContext context) async {
    Hive.openBox<TotalExpense>('getTotalExpense');
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            content: CompileExpense(_addNewExpenses),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          );
        });
  }

  void _addNewExpenses(DataExpense expense) {
    setState(() {
      widget.totalExpense.addDataExpense(expense);
    });
  }

  Widget _showElementInside(BuildContext context) => ListView(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      children:
          widget.totalExpense.dateExpenseInside.map((DataExpense dataExpense) {
        return TodoItemExpense(
          dataExpense: dataExpense,
          removeDataExpense: (po) => _removeDataExpense(context, dataExpense),
        );
      }).toList());

  void _removeDataExpense(BuildContext context, DataExpense dataExpense) {
    setState(() {
      widget.totalExpense.removeDataExpense(dataExpense);
    });
  }
}

class TodoItemExpense extends StatefulWidget {
  final Function(DataExpense) removeDataExpense;
  const TodoItemExpense({
    super.key,
    required this.dataExpense,
    required this.removeDataExpense,
  });
  final DataExpense dataExpense;

  @override
  State<TodoItemExpense> createState() => _MyTodoItemExpense();
}

class _MyTodoItemExpense extends State<TodoItemExpense> {
  TextStyle? _getTextStyle(bool checked) {
    if (!checked) return null;

    return const TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(widget.dataExpense.name,
            style: _getTextStyle(widget.dataExpense.checked)),
        onLongPress: () => {
          _showCompileForm(context),
        },
        trailing: GestureDetector(
          child: Text("Price : ${widget.dataExpense.price}"),
        ),
      ),
    );
  }

  void _showCompileForm(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            content: _removeDataExpense(context),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          );
        });
  }

  Widget _removeDataExpense(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: 100,
      width: 50,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Text('Remove Element ?', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  widget.removeDataExpense(widget.dataExpense);
                  Navigator.pop(context);
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Text('REMOVE'),
            )
          ],
        ),
      ),
    );
  }
}
