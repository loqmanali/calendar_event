import 'package:calendar_event/model/event.dart';
import 'package:flutter/cupertino.dart';

class EventProvider extends ChangeNotifier {
  final List<Event> _event = [];

  List<Event> get event => _event;

  DateTime _selectedDate = DateTime.now();

  DateTime get selectedDate => _selectedDate;

  void setDate(DateTime date) => _selectedDate = date;

  List<Event> get eventsOfSelectedDate => _event;

  void addEvent(Event event) {
    _event.add(event);

    notifyListeners();
  }

  void deleteEvent(Event event) {
    _event.remove(event);

    notifyListeners();
  }

  void editEvent(Event newEvent, Event oldEvent) {
    final index = _event.indexOf(oldEvent);
    _event[index] = newEvent;

    notifyListeners();
  }
}
