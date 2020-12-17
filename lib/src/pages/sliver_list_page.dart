import 'package:app_designs/src/widgets/headers.dart';
import 'package:flutter/material.dart';

class SliverListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        _ToDoList(),
        GradientWaveHeader(
          title: 'To Do \nList',
          headerHeight: 270.0,
        ),
      ],
    ));
  }
}

class _ToDoList extends StatelessWidget {
  final items = [
    _ListItem('Deep Purple', Colors.deepPurple),
    _ListItem('Deep Orange', Colors.deepOrange),
    _ListItem('Teal', Colors.teal),
    _ListItem('Amber', Colors.amber),
    _ListItem('Cyan', Colors.cyan),
    _ListItem('Red', Colors.red),
    _ListItem('Blue', Colors.blue),
    _ListItem('Pink', Colors.pink),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => items[index],
    );
  }
}

class _ListItem extends StatelessWidget {
  final String title;
  final Color color;
  _ListItem(this.title, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        this.title,
        style: TextStyle(
            fontSize: 22.0, color: Colors.white, fontWeight: FontWeight.bold),
      ),
      height: 130,
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      padding: EdgeInsets.all(22.0),
      decoration: BoxDecoration(
          color: this.color, borderRadius: BorderRadius.circular(22.0)),
    );
  }
}
