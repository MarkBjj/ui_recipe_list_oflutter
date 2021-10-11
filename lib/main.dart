import 'package:flutter/material.dart';
import 'package:ui_recipe_list/screens/home.dart';
//https://oflutter.com/simple-recipe-list-app-using-flutter-and-api/

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UI Recipe List',
      theme: ThemeData(
        primarySwatch: Colors.red,
        primaryColor: Colors.white,
        // ignore: prefer_const_constructors
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.black54, fontSize: 21),
          //bodyText2: TextStyle(color: Colors.white, fontSize: 21),
        ),
      ),
      //home: const MyHomePage(title: 'UI Recipe List'),
      home: HomeScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // ignore: prefer_const_constructors
      // body: Center(
      //   child: GestureDetector(
      //     onTap: () {
      //       Navigator.push(
      //         context,
      //         MaterialPageRoute(builder: (context) => HomeScreen()),
      //       );
      //     },
      //     child: const Text(
      //       'link text',
      //     ),
      //   ),
      // ),
    );
  }
}
