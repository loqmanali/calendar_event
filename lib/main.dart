import 'package:calendar_event/page/event_editing_page.dart';
import 'package:calendar_event/provider/event_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widget/calendar_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EventProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        home: MainPage(title: 'Calendar'),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  MainPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: CalendarWidget(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: Colors.white),
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => EventEditingPage()));
        },
      ),
    );
  }
}
