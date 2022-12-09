import 'package:definitive_flutter/application/view_list_pages/view_list_expenses.dart';
import 'package:definitive_flutter/application/view_list_pages/view_list_generic.dart';
import 'package:definitive_flutter/application/view_list_pages/view_list_shopping.dart';
import 'package:flutter/material.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key, required this.title});
  final String title;

  @override
  State<ExplorePage> createState() => _MyExplorePage();
}

class _MyExplorePage extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _firstText(),
        const SizedBox(height: 15),
        _secondText(),
        const SizedBox(height: 15),
        _thirdText(),
        const SizedBox(height: 20),
        _showButton(context),
        const SizedBox(height: 20),
        const Text('For Generic list.', style: TextStyle(fontSize: 15)),
        _showThirdButton(),
      ],
    );
  }

  Widget _firstText() => const Text(
        'WELCOME BACK',
        style: TextStyle(fontSize: 22),
      );

  Widget _secondText() => const Text(
        'If you don\' t have any lists created ,\n'
        '\t    head to the Creation page.',
        style: TextStyle(fontSize: 18),
      );

  Widget _thirdText() => const Text('Use the bottom to Navigate\n  inside the '
      'different lists.');

  Widget _showButton(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const ViewListShopping(title: 'SHOPPING TRACKER'),
                    ));
              },
              child: const Text('SHOPPING LISTS')),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const ViewListExpense(title: 'EXPENSES TRACKER'),
                    ));
              },
              child: const Text('EXPENSE LIST')),
        ],
      );

  Widget _showThirdButton() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const ViewListGeneric(title: "GENERIC LIST")));
              },
              child: const Text("GENERIC LIST"))
        ],
      );
}
