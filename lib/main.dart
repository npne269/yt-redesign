import 'dart:io';

import 'package:flutter/material.dart';
import 'package:window_size/window_size.dart';
import 'package:ytredesign/Components/ContentPage.dart';
import 'package:ytredesign/Components/MenuBar.dart';
import 'package:ytredesign/globals.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowMinSize(Size(942.0, 1050.0));
    setWindowMaxSize(Size(1920.0, 1400.0));
    setWindowTitle('Youtube Re-Design');
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      drawer: MenuBar(),
      body: Container(
        padding: EdgeInsets.all(20.0),
        color: priColor,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            screenSize.width <= 1480 ? Container() : MenuBar(),
            Expanded(child: ContentPage()),
          ],
        ),
      ),
    );
  }
}
