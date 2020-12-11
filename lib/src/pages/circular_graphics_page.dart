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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomRadialProgress(
                  percentage: percentage,
                  color: Colors.blue,
                ),
                CustomRadialProgress(
                  percentage: percentage,
                  color: Colors.red,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomRadialProgress(
                  percentage: percentage,
                  color: Colors.purple,
                ),
                CustomRadialProgress(
                  percentage: percentage,
                  color: Colors.amber,
                )
              ],
            )
          ],
        ));
  }
}

class CustomRadialProgress extends StatelessWidget {
  final Color color;

  const CustomRadialProgress({@required this.percentage, @required this.color});

  final double percentage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180.0,
      height: 180.0,
      child: Center(
          child: RadialProgress(
        percentage: percentage,
        color: color,
      )),
    );
  }
}
