import 'package:flutter/material.dart';

class MyDropDownButton extends StatefulWidget {
  const MyDropDownButton({
    Key key,
  }) : super(key: key);

  @override
  _MyDropDownButtonState createState() => _MyDropDownButtonState();
}

class _MyDropDownButtonState extends State<MyDropDownButton> {
  int _active = 0;
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: _active,
      style: Theme.of(context).textTheme.headline,
      onChanged: (i) {setState(() {
       _active = i; 
      });},
      underline: Container(),
      items: [
        DropdownMenuItem(
          child: Text("Explore"),
          value: 0,
        ),
        DropdownMenuItem(
          child: Text("Discover"),
          value: 1,
        ),
        DropdownMenuItem(
          child: Text("Best"),
          value: 2,
        ),
      ],
    );
  }
}
