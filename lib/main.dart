import 'package:flutter/material.dart';
import 'package:placeapp/global.dart';
import 'package:placeapp/ui/screens/screens.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'RobotoSlab',
        textTheme: TextTheme(body1: TextStyle(color: darkGrey)),
      ),
      home: HomeScreen(),
      routes: {
        'details': (ctx) => DetailsScreen(),
      },
    );
  }
}
