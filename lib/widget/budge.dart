import 'package:flutter/material.dart';

class BudgeColumn extends StatelessWidget {
  final IconData icon;
  final int count;
  final Color color;

  const BudgeColumn({Key key, this.icon, this.count, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        children: <Widget>[
          Icon(
            this.icon,
            color: this.color,
          ),
          Text(
            this.count.toString(),
            style: TextStyle(color: Colors.teal),
          ),
        ],
      ),
    );
  }
}
