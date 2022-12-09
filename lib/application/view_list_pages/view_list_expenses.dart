import 'package:definitive_flutter/MVCShared/store_data/boxes_expense.dart';
import 'package:definitive_flutter/application/create_pages/create_expense.dart';
import 'package:flutter/material.dart';
import 'inside_view_pages_element/modify_expense_page.dart';

class ViewListExpense extends StatefulWidget {
  const ViewListExpense({super.key, required this.title});
  final String title;

  @override
  State<ViewListExpense> createState() => _MyViewListExpense();
}

class _MyViewListExpense extends State<ViewListExpense> {
  bool _searchBoolean = false;
  List<int> _searchIndexList = [];
  final box = BoxesExpense.getTotalExpense();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: !_searchBoolean ? Text(widget.title) : _searchTextField(),
          actions: !_searchBoolean
              ? [
                  IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        setState(() {
                          _searchBoolean = true;
                          _searchIndexList = [];
                        });
                      })
                ]
              : [
                  IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        setState(() {
                          _searchBoolean = false;
                        });
                      })
                ]),
      body: !_searchBoolean
          ? SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.75,
                child: ListView.builder(
                  itemCount: box.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(box.getAt(index)!.nameTotalExpense),
                        subtitle: Text(
                            'Amount : ${box.getAt(index)!.getTotalAmount()} €'),
                        trailing: GestureDetector(
                          child: const Icon(Icons.delete, color: Colors.red),
                          onTap: () {
                            setState(() {
                              box.getAt(index)!.delete();
                            });
                          },
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PageModifyExpense(
                                        title:
                                            box.getAt(index)!.nameTotalExpense,
                                        totalExpense: box.getAt(index)!,
                                        index: index,
                                      )));
                        },
                      ),
                    );
                  },
                ),
              ),
            )
          : _searchListView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const CreateExpense(title: 'CFEATE EXPENSE')))
        },
      ),
    );
  }

  Widget _searchListView() => ListView.builder(
        itemCount: _searchIndexList.length,
        itemBuilder: ((context, index) {
          index = _searchIndexList.length;
          return Card(
            child: ListTile(
              title: Text(box.getAt(index)!.nameTotalExpense),
              subtitle:
                  Text('Amount : ${box.getAt(index)!.getTotalAmount()} €'),
              trailing: GestureDetector(
                child: const Icon(Icons.delete, color: Colors.red),
                onTap: () {
                  box.getAt(index)!.delete();
                },
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PageModifyExpense(
                              title: box.getAt(index)!.nameTotalExpense,
                              totalExpense: box.getAt(index)!,
                              index: index,
                            )));
              },
            ),
          );
        }),
      );

  Widget _searchTextField() => TextField(
        onChanged: (String s) {
          //add
          setState(() {
            _searchIndexList = [];
            for (int i = 0; i < box.length; i++) {
              if (box.getAt(i)!.nameTotalExpense == s) {
                _searchIndexList.add(i);
              }
            }
          });
        },
        autofocus: true, //Display the keyboard when TextField is displayed
        cursorColor: Colors.white,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
        textInputAction:
            TextInputAction.search, //Specify the action button on the keyboard
        decoration: const InputDecoration(
          //Style of TextField
          enabledBorder: UnderlineInputBorder(
              //Default TextField border
              borderSide: BorderSide(color: Colors.white)),
          focusedBorder: UnderlineInputBorder(
              //Borders when a TextField is in focus
              borderSide: BorderSide(color: Colors.white)),
          hintText: 'Search', //Text that is displayed when nothing is entered.
          hintStyle: TextStyle(
            //Style of hintText
            color: Colors.white60,
            fontSize: 20,
          ),
        ),
      );
}
