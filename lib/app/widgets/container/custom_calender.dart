import 'package:apex/app/utils/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomCalender extends StatelessWidget {
  // Calendar controller
  final CalendarFormat _calendarFormat = CalendarFormat.month;

  // Initialize today’s date as the focused day
  DateTime _focusedDay = DateTime.now();

  // Dynamically generate events based on current date
  final Map<DateTime, List<String>> _events = {
    DateTime.now(): ['orange'],
    DateTime.now().subtract(Duration(days: 1)): ['orange', 'orange', 'orange'],
    DateTime.now().subtract(Duration(days: 5)): ['orange'],
    DateTime.now().subtract(Duration(days: 6)): ['orange'],
    DateTime.now().subtract(Duration(days: 8)): ['orange', 'orange', 'orange'],
    DateTime.now().subtract(Duration(days: 12)): ['orange', 'orange'],
    DateTime.now().subtract(Duration(days: 13)): ['orange', 'orange'],
    DateTime.now().subtract(Duration(days: 15)): ['orange'],
    DateTime.now().subtract(Duration(days: 19)): ['orange', 'orange'],
    DateTime.now().subtract(Duration(days: 22)): ['orange'],
    DateTime.now().subtract(Duration(days: 29)): ['orange', 'orange', 'orange'],
    DateTime.now().subtract(Duration(days: 30)): ['green', 'blue', 'blue'],
  };

  CustomCalender({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime _selectedDay = DateTime.now(); // Default to today's date

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // TableCalendar widget
          TableCalendar(
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
            // Event loader for dots
            eventLoader: (day) {
              return _events[DateTime(day.year, day.month, day.day)] ?? [];
            },
            // Customize the header style
            headerStyle: HeaderStyle(
              titleCentered: true,
              formatButtonVisible: false,
              titleTextStyle: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              leftChevronIcon: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(9),
                  border: Border.all(
                    color: AppColors.dimGreyColor,
                    width: 1,
                  ),
                ),
                child: Center(
                    child: Icon(Icons.arrow_back_ios, color: Colors.black)),
              ),
              rightChevronIcon: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(9),
                  border: Border.all(
                    color: AppColors.dimGreyColor,
                    width: 1,
                  ),
                ),
                child: Center(
                    child: Icon(Icons.arrow_forward_ios, color: Colors.black)),
              ),
            ),
            // Customize the days of the week
            daysOfWeekStyle: DaysOfWeekStyle(
              weekdayStyle: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
              weekendStyle: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            // Customize the calendar style
            calendarStyle: CalendarStyle(
              outsideDaysVisible: true,
              outsideTextStyle: TextStyle(color: Colors.grey),
              defaultTextStyle: TextStyle(color: Colors.black, fontSize: 16),
              weekendTextStyle: TextStyle(color: Colors.black, fontSize: 16),
              selectedDecoration: BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle,
              ),
              selectedTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
              todayDecoration: BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
              ),
              todayTextStyle: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            // Custom builder for calendar days
            calendarBuilders: CalendarBuilders(
              markerBuilder: (context, date, events) {
                if (events.isNotEmpty) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: events.map((event) {
                      Color dotColor;
                      switch (event) {
                        case 'orange':
                          dotColor = Colors.orange;
                          break;
                        case 'green':
                          dotColor = Colors.green;
                          break;
                        case 'blue':
                          dotColor = Colors.blue;
                          break;
                        default:
                          dotColor = Colors.transparent;
                      }
                      return _buildDot(dotColor);
                    }).toList(),
                  );
                }
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build event dots
  Widget _buildDot(Color color) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 1),
      width: 6,
      height: 6,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}
