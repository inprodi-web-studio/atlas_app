// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;

class shareCalendarState {
  String _date = '';

  shareCalendarState._privateConstructor();

  static final shareCalendarState _instance =
      shareCalendarState._privateConstructor();

  factory shareCalendarState() {
    return _instance;
  }

  String get date => _date;

  set date(String value) {
    _date = value;
  }
}

class BookingCalendar extends StatefulWidget {
  const BookingCalendar({
    Key? key,
    this.width,
    this.height,
    required this.availableDates,
    required this.availableSlots,
    required this.updatePageState,
  }) : super(key: key);

  final double? width;
  final double? height;
  final List<String> availableDates;
  final List<int> availableSlots;
  final Future<dynamic> Function() updatePageState;

  @override
  _BookingCalendarState createState() => _BookingCalendarState();
}

class _BookingCalendarState extends State<BookingCalendar> {
  DateTime? _currentDate;

  shareCalendarState _shareCalendarState = new shareCalendarState();

  @override
  void initState() {
    super.initState();
    _currentDate = DateTime.tryParse(widget.availableDates.first);
  }

  bool _isDateAvailable(DateTime date) {
    String dateStr = DateFormat('yyyy-MM-dd').format(date);
    return widget.availableDates.contains(dateStr);
  }

  int _getAvailableSlots(DateTime date) {
    String dateStr = DateFormat('yyyy-MM-dd').format(date);
    int index = widget.availableDates.indexOf(dateStr);
    if (index >= 0 && index < widget.availableSlots.length) {
      return widget.availableSlots[index];
    }
    return -1;
  }

  @override
  Widget build(BuildContext context) {
    return CalendarCarousel(
      selectedDateTime: _currentDate,
      onDayPressed: (date, events) {
        _shareCalendarState._date = DateFormat('yyyy-MM-dd').format(date);
        this.setState(() => _currentDate = date);

        widget.updatePageState();
      },
      daysHaveCircularBorder: false,
      height: 400,
      locale: "es",
      headerTextStyle: TextStyle(fontSize: 20, color: Colors.black),
      iconColor: Colors.grey,
      weekendTextStyle: TextStyle(color: Colors.black),
      thisMonthDayBorderColor: Colors.transparent,
      customGridViewPhysics: NeverScrollableScrollPhysics(),
      customDayBuilder: (
        bool isSelectable,
        int index,
        bool isSelectedDay,
        bool isToday,
        bool isPrevMonthDay,
        TextStyle textStyle,
        bool isNextMonthDay,
        bool isThisMonthDay,
        DateTime date,
      ) {
        if (!_isDateAvailable(date)) {
          return IgnorePointer(
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xFFF4F4F4),
                    borderRadius: BorderRadius.circular(8)),
                child: Center(
                  child: Text(
                    date.day.toString(),
                    style: TextStyle(color: Color(0xFFC6C7C7)),
                  ),
                ),
              ),
            ),
          );
        } else {
          int slots = _getAvailableSlots(date);
          Color color;
          Color textColor;
          if (slots > 1) {
            color = Color(0xFFEBF5E6);
            textColor = Color(0xFF389E0D);
          } else if (slots == 1) {
            color = Color(0xFFFAE7E8);
            textColor = Color(0xFFCF1322);
          } else if (slots == 0) {
            color = Color(0xFFE78990);
            textColor = Colors.white;
          } else {
            color = Colors.grey.withOpacity(0.5);
            textColor = Color(0xFFC6C7C7);
          }

          if (isSelectedDay) {
            return Center(
              child: Container(
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(color: textColor, spreadRadius: 2),
                  ],
                ),
                child: Center(
                  child: Text(date.day.toString(),
                      style: TextStyle(color: textColor)),
                ),
              ),
            );
          } else {
            return Center(
              child: Container(
                decoration: BoxDecoration(
                    color: color, borderRadius: BorderRadius.circular(8)),
                child: Center(
                    child: Text(date.day.toString(),
                        style: TextStyle(color: textColor))),
              ),
            );
          }
        }
      },
      selectedDayBorderColor: Colors.transparent,
      selectedDayButtonColor: Colors.transparent,
      todayButtonColor: Colors.transparent,
      todayBorderColor: Colors.transparent,
      prevDaysTextStyle: TextStyle(fontSize: 0),
      nextDaysTextStyle: TextStyle(fontSize: 0),
      prevMonthDayBorderColor: Colors.transparent,
      nextMonthDayBorderColor: Colors.transparent,
      minSelectedDate: DateTime.parse(widget.availableDates[0]),
      maxSelectedDate: DateTime.parse(
          widget.availableDates[widget.availableDates.length - 1]),
    );
  }
}
