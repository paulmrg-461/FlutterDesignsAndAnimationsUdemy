import 'package:app_designs/src/widgets/radial_progress.dart';
import 'package:flutter/material.dart';

class CircularGraphicsPage extends StatefulWidget {
  @override
  _CircularGraphicsPageState createState() => _CircularGraphicsPageState();
}

class _CircularGraphicsPageState extends State<CircularGraphicsPage> {
  double percentage = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => this.setState(() {
          percentage >= 100 ? percentage = 0 : percentage += 10;
        }),
        child: Icon(Icons.add),
      ),
      body: Center(
        child: Container(
          width: 300.0,
          height: 300.0,
          color: Colors.red,
          child: Center(child: RadialProgress(percentage: 10.0)),
        ),
      ),
    );
  }
}
