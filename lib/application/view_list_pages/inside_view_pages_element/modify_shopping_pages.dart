import 'package:definitive_flutter/MVCShared/application_data/total_data/total_shopping.dart';
import 'package:flutter/material.dart';
import '../../../MVCShared/application_data/shopping_data.dart';
import '../../create_pages/compile_pages/compile_shopping.dart';

class PageModifyShopping extends StatefulWidget {
  const PageModifyShopping({
    super.key,
    required this.totalShopping,
    required this.title,
  });

  final String title;
  final TotalShopping totalShopping;

  @override
  State<PageModifyShopping> createState() => _MyPageModifyShopping();
}

class _MyPageModifyShopping extends State<PageModifyShopping> {
  late DataShopping newTmpDataShopping;

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
              SizedBox(
                height: 370,
                child: _showElementInside(context),
              ),
              const SizedBox(height: 15),
              Text('Total Item : ${widget.totalShopping.elementInside.length}',
                  style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 15),
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
          const Text('Name Shopping List : ', style: TextStyle(fontSize: 18)),
          Text(widget.totalShopping.nameTotalShopping,
              style: const TextStyle(fontSize: 18)),
        ],
      );

  Widget _secondRow() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          const Text('Creation Date : ', style: TextStyle(fontSize: 18)),
          Text(widget.totalShopping.data, style: const TextStyle(fontSize: 18)),
        ],
      );

  Widget _showElementInsideTitle() => const Text(
        'Element of this Shopping: ',
        style: TextStyle(fontSize: 18),
      );

  Widget _showElementInside(BuildContext context) => ListView(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      children:
          widget.totalShopping.elementInside.map((DataShopping dataShopping) {
        return TodoItemShopping(
          dataShopping: dataShopping,
          onTodoChanged: _handleTodoChange,
          removeDataShopping: (po) =>
              _removeDataShopping(context, dataShopping),
        );
      }).toList());

  void _showCompileForm(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            content: CompileShopping(_addNewShopping),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          );
        });
  }

  void _addNewShopping(DataShopping shopping) {
    setState(() {
      widget.totalShopping.addDataShopping(shopping);
    });
  }

  void _removeDataShopping(BuildContext context, DataShopping shopping) {
    setState(() {
      widget.totalShopping.removeDataShopping(shopping);
    });
  }

  void _handleTodoChange(DataShopping dataShopping) {
    setState(() {
      dataShopping.checked = !dataShopping.checked;
    });
  }
}

class TodoItemShopping extends StatefulWidget {
  final Function(DataShopping) removeDataShopping;
  const TodoItemShopping({
    super.key,
    required this.dataShopping,
    required this.onTodoChanged,
    //required this.totalShopping,
    required this.removeDataShopping,
  });

  final DataShopping dataShopping;
  // ignore: prefer_typing_uninitialized_variables
  final onTodoChanged;
  //final TotalShopping totalShopping;

  @override
  State<TodoItemShopping> createState() => _MyTodoItemShopping();
}

// ignore: must_be_immutable
class _MyTodoItemShopping extends State<TodoItemShopping> {
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
        onTap: () {
          widget.onTodoChanged(widget.dataShopping);
        },
        title: Text(widget.dataShopping.nameElement,
            style: _getTextStyle(widget.dataShopping.checked)),
        trailing: GestureDetector(
          child: const Icon(Icons.delete, color: Colors.red),
          onTap: () {
            _showCompileForm(context);
          },
        ),
      ),
    );
  }

  void _showCompileForm(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            content: _removeDataShopping(context),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          );
        });
  }

  Widget _removeDataShopping(BuildContext context) {
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
                  widget.removeDataShopping(widget.dataShopping);
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
