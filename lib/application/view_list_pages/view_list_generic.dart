import 'package:definitive_flutter/MVCShared/application_data/total_data/total_shopping.dart';
import 'package:definitive_flutter/MVCShared/store_data/boxes_general.dart';
import 'package:definitive_flutter/application/create_pages/create_generic.dart';
import 'package:definitive_flutter/application/view_list_pages/inside_view_pages_element/modify_generic_page.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ViewListGeneric extends StatefulWidget {
  const ViewListGeneric({super.key, required this.title});
  final String title;

  @override
  State<ViewListGeneric> createState() => _MyViewListGeneric();
}

class _MyViewListGeneric extends State<ViewListGeneric> {
  //Bar if is in seach or not.
  bool _searchBoolean = false;
  //List int index search.
  List<int> _searchIndexList = [];
  //Hive box for Shopping:
  final box = BoxesGeneral.getTotalGeneric();

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
                        title: Text(box.getAt(index)!.nameTotalGeneric),
                        subtitle: Text(
                            'Data : ${box.getAt(index)!.dataCreationTotalGeneric}'),
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
                                  builder: (context) => PageModifyGeneric(
                                      title: box.getAt(index)!.nameTotalGeneric,
                                      totalGeneric: box.getAt(index)!)));
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
                      const CreateGeneric(title: 'CREATE GENERIC')))
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
              title: Text(box.getAt(index)!.nameTotalGeneric),
              subtitle:
                  Text('Date : ${box.getAt(index)!.dataCreationTotalGeneric}'),
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
                        builder: (context) => PageModifyGeneric(
                            title: box.getAt(index)!.nameTotalGeneric,
                            totalGeneric: box.getAt(index)!)));
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
              if (box.getAt(i)!.nameTotalGeneric == s) {
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

  void hiveBoxe() async {
    await Hive.openBox<TotalShopping>('getTotalShopping');
  }
}
