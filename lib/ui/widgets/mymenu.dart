import 'package:flutter/material.dart';

class MyMenu extends StatefulWidget {
  @override
  _MyMenuState createState() => _MyMenuState();
}

class _MyMenuState extends State<MyMenu> {
  int _active = 0;
  List<String> _menuItems = ['New', 'Popular', 'Recent', 'Recommendation'];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      alignment: Alignment.center,
      height: 41,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _menuItems.length,
        itemBuilder: (ctx, i) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _active = i;
              });
            },
            child: Container(
              constraints: BoxConstraints(minWidth: 67),
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 15.0),
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                  color: _active == i ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(5.0)),
              child: Text("${_menuItems[i]}", style: Theme.of(context).textTheme.button.apply(color: _active != i ? Colors.grey : Colors.black)),
            ),
          );
        },
      ),
    );
  }
}
