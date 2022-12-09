import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key, required this.title});
  final String title;

  @override
  State<CalendarPage> createState() => _MyCalendarPage();
}

///Class that extends and implement
/// the State of the Calendar Class.
class _MyCalendarPage extends State<CalendarPage> {
  //Variables for Calendar:
  final CalendarFormat format = CalendarFormat.month;
  final DateTime select = DateTime.now();
  final DateTime focus = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      focusedDay: select,
      firstDay: DateTime(1990),
      lastDay: DateTime(2030),
      calendarFormat: format,
      onFormatChanged: (CalendarFormat format) {
        setState(() {
          format = format;
        });
      },
      startingDayOfWeek: StartingDayOfWeek.monday,
      daysOfWeekVisible: true,
      //Day Changed
      onDaySelected: (DateTime selectDay, DateTime focusDay) {
        setState(() {
          selectDay = selectDay;
          focusDay = focusDay;
        });
      },
      //To style the Calendar
      calendarStyle: const CalendarStyle(
        isTodayHighlighted: true,
        selectedDecoration:
            BoxDecoration(color: Colors.deepOrange, shape: BoxShape.circle),
        selectedTextStyle: TextStyle(color: Colors.white),
      ),
      selectedDayPredicate: (DateTime date) {
        return isSameDay(select, date);
      },
    );
  }
}
