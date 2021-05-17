import 'package:calendar_event/model/event_data_source.dart';
import 'package:calendar_event/page/event_viewing_page.dart';
import 'package:calendar_event/provider/event_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class TasksWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EventProvider>(context);
    final selectedEvents = provider.eventsOfSelectedDate;
    if (selectedEvents.isEmpty) {
      return Center(
        child: Text(
          'No Event found!',
          style: TextStyle(color: Colors.black, fontSize: 24.0),
        ),
      );
    }
    return SfCalendar(
      view: CalendarView.day,
      dataSource: EventDataSource(provider.event),
      initialDisplayDate: provider.selectedDate,
      appointmentBuilder: appointmentBuilder,
      headerHeight: 0.0,
      todayHighlightColor: Colors.black,
      onTap: (details) {
        if (details.appointments == null) return;
        final event = details.appointments!.first;

        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => EventViewingPage(event: event)));
      },
    );
  }

  Widget appointmentBuilder(
      BuildContext context, CalendarAppointmentDetails details) {
    final event = details.appointments.first;
    return Center(
      child: Container(
        width: details.bounds.width,
        height: details.bounds.height,
        child: Text(
          event.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Colors.black,
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
