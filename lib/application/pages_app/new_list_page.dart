import 'package:definitive_flutter/application/create_pages/create_generic.dart';
import 'package:flutter/material.dart';

import '../create_pages/create_expense.dart';
import '../create_pages/create_shopping.dart';

class NewListPage extends StatefulWidget {
  const NewListPage({super.key, required this.title});
  final String title;

  @override
  State<StatefulWidget> createState() => _MyNewListPage();
}

/// This private class provides an implementation
/// for the State of the previous class just created,
/// so it will be this class that will have a Widget that
/// represents the whole page concerning the creation
/// of the various lists.
class _MyNewListPage extends State<NewListPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _descriptionText(),
        const SizedBox(height: 16),
        _firstText(),
        const SizedBox(height: 9),
        _firstRowElement(),
        const SizedBox(height: 16),
        _secondText(),
        const SizedBox(height: 9),
        _secondRowElement(),
        const SizedBox(height: 15),
        const Text("Create new Generic List", style: TextStyle(fontSize: 15)),
        const SizedBox(height: 9),
        _thirdRowElement(),
      ],
    );
  }

  /// For simplicity, without having
  /// to instantiate and create objects
  /// directly within the build method,
  /// they are created out separately for a simpler
  /// code structure and modular.
  Widget _descriptionText() =>
      const Text('In this Page, you can create new List Expense.',
          style: TextStyle(fontSize: 15));

  Widget _firstText() =>
      const Text('Create new Shopping List', style: TextStyle(fontSize: 15));

  Widget _firstRowElement() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const CreateShopping(title: 'CREATE SHOPPING')));
              },
              child: const Text('NEW SHOPPING LIST')),
        ],
      );

  Widget _secondText() =>
      const Text('Create new Expense list', style: TextStyle(fontSize: 15));

  Widget _secondRowElement() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const CreateExpense(title: 'CREATE EXPENSE')));
              },
              child: const Text('NEW EXPENSE LIST')),
        ],
      );

  Widget _thirdRowElement() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const CreateGeneric(title: "CREATE GENERIC")));
              },
              child: const Text("GENERIC LIST"))
        ],
      );
}
