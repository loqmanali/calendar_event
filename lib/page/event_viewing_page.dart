import 'package:calendar_event/model/event.dart';
import 'package:calendar_event/page/event_editing_page.dart';
import 'package:calendar_event/provider/event_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventViewingPage extends StatelessWidget {
  final Event event;

  const EventViewingPage({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CloseButton(),
        actions: buildViewingActions(context, event),
      ),
      body: ListView(
        padding: EdgeInsets.all(32.0),
        children: <Widget>[
          buildDateTime(event),
          const SizedBox(height: 32.0),
          Text(
            event.title,
            style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 25.0),
          Text(
            event.description,
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget buildDateTime(Event event) {
    return Column(
      children: [
        buildDate(event.isAllDay ? 'All-day' : 'From', event.from),
        if (!event.isAllDay) buildDate('To', event.to),
      ],
    );
  }

  Widget buildDate(String title, DateTime date) {
    return Container();
  }

  List<Widget> buildViewingActions(context, Event event) {
    return [
      IconButton(
        icon: Icon(Icons.edit),
        onPressed: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => EventEditingPage(event: event)));
        },
      ),
      IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {
          final provider = Provider.of<EventProvider>(context, listen: false);
          provider.deleteEvent(event);
        },
      ),
    ];
  }
}
