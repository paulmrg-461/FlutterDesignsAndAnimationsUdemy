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
        ),
      ],
    ));
  }
}

class _ToDoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: 20,
      itemBuilder: (BuildContext context, int index) => _ListItem(),
    );
  }
}

class _ListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        'Deep Purple',
        style: TextStyle(
            fontSize: 22.0, color: Colors.white, fontWeight: FontWeight.bold),
      ),
      height: 130,
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      padding: EdgeInsets.all(22.0),
      decoration: BoxDecoration(
          color: Colors.deepPurple, borderRadius: BorderRadius.circular(22.0)),
    );
  }
}
