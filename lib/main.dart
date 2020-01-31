import 'package:flutter/material.dart';
import 'package:flutter_json_parsing/home_page.dart';
import 'package:flutter_json_parsing/view_models/home_page_view_model.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (_) => HomePageViewModel(),
        child: HomePage(),
      ),
    );
  }
}
