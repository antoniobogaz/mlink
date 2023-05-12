import 'package:flutter/material.dart';

class NumberWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildButton(text: 'Mídias', value: 0),
          buildDivider(),
          buildButton(text: 'Curtiu', value: 0),
          buildDivider(),
          buildButton(text: 'Curtiram', value: 0),
        ],
      );

  Widget buildDivider() => Container(
        height: 30,
        child: VerticalDivider(color: Color.fromARGB(255, 139, 92, 235)),
      );

  Widget buildButton({
    required String text,
    required int value,
  }) =>
      MaterialButton(
        padding: EdgeInsets.symmetric(vertical: 4),
        onPressed: () {},
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              '$value',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            SizedBox(height: 12),
            Text(
              text,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      );
}
