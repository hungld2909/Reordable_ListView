import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> myList = [
    "A0",
    "B1",
    "C2",
    "D3",
    "E4",
    "F5",
    "G6",
    "H7",
    "I8",
    "J9",
    "K10"
  ];
  _onReorder(oldIndex, newIndex) {
    setState(() {
      if(newIndex > oldIndex){
        newIndex = newIndex - 1;
      }
      var item = myList.removeAt(oldIndex);
      myList.insert(newIndex, item);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reordable ListView"),
      ),
          body: ReorderableListView(
          header: Text("Header"),
          children: myList
              .map((c) => ListTile(
                key: ObjectKey(c) ,
                    title: Text(c),
                  ))
              .toList(),
          onReorder: _onReorder),
    );
  }
}
