import 'package:definitive_flutter/MVCShared/application_data/generic_data.dart';
import 'package:definitive_flutter/MVCShared/application_data/total_data/total_generic.dart';
import 'package:definitive_flutter/application/create_pages/compile_pages/compile_generic.dart';
import 'package:flutter/material.dart';

class PageModifyGeneric extends StatefulWidget {
  const PageModifyGeneric({
    super.key,
    required this.totalGeneric,
    required this.title,
  });

  final String title;
  final TotalGeneric totalGeneric;

  @override
  State<PageModifyGeneric> createState() => _MyPageModifyGeneric();
}

class _MyPageModifyGeneric extends State<PageModifyGeneric> {
  late DataGeneric newTmpDataGeneric;

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
              Text(
                  'Total Item : ${widget.totalGeneric.dataGenericInside.length}',
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
          const Text('Name Generic List : ', style: TextStyle(fontSize: 18)),
          Text(widget.totalGeneric.nameTotalGeneric,
              style: const TextStyle(fontSize: 18)),
        ],
      );

  Widget _secondRow() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          const Text('Creation Date : ', style: TextStyle(fontSize: 18)),
          Text(widget.totalGeneric.dataCreationTotalGeneric,
              style: const TextStyle(fontSize: 18)),
        ],
      );

  Widget _showElementInsideTitle() => const Text(
        'Element of this Shopping: ',
        style: TextStyle(fontSize: 18),
      );

  Widget _showElementInside(BuildContext context) => ListView(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      children:
          widget.totalGeneric.dataGenericInside.map((DataGeneric dataGeneric) {
        return TodoItemGeneric(
          dataGeneric: dataGeneric,
          onTodoChanged: _handleTodoChange,
          removeDataGeneric: (po) => _removeDataGeneric(context, dataGeneric),
        );
      }).toList());

  void _showCompileForm(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            content: CompileGeneric(_addNewGeneric),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          );
        });
  }

  void _addNewGeneric(DataGeneric generic) {
    setState(() {
      widget.totalGeneric.addDataGeneric(generic);
    });
  }

  void _removeDataGeneric(BuildContext context, DataGeneric generic) {
    setState(() {
      widget.totalGeneric.removeDataGeneric(generic);
    });
  }

  void _handleTodoChange(DataGeneric dataGeneric) {
    setState(() {
      dataGeneric.checked = !dataGeneric.checked;
    });
  }
}

class TodoItemGeneric extends StatefulWidget {
  final Function(DataGeneric) removeDataGeneric;
  const TodoItemGeneric({
    super.key,
    required this.dataGeneric,
    required this.onTodoChanged,
    required this.removeDataGeneric,
  });

  final DataGeneric dataGeneric;
  // ignore: prefer_typing_uninitialized_variables
  final onTodoChanged;

  @override
  State<TodoItemGeneric> createState() => _MyTodoItemGeneric();
}

// ignore: must_be_immutable
class _MyTodoItemGeneric extends State<TodoItemGeneric> {
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
          widget.onTodoChanged(widget.dataGeneric);
        },
        title: Text(widget.dataGeneric.name,
            style: _getTextStyle(widget.dataGeneric.checked)),
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
            content: _removeDataGeneric(context),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          );
        });
  }

  Widget _removeDataGeneric(BuildContext context) {
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
                  widget.removeDataGeneric(widget.dataGeneric);
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
