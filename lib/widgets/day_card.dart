import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/models/day.dart';

class DayCard extends StatelessWidget {
  const DayCard({
    super.key,
    required int selectedIndex,
    required Day day,
    required int index,
    required this.onTapFunction,
  })  : _selectedIndex = selectedIndex,
        _day = day,
        _index = index;

  final int _selectedIndex;
  final Day _day;
  final int _index;
  final VoidCallback onTapFunction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _index == 0
          ? const EdgeInsets.fromLTRB(0, 8.0, 8.0, 8.0)
          : const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTapFunction,
        child: Container(
          width: 60,
          decoration: BoxDecoration(
            color: _index == _selectedIndex
                ? const Color.fromRGBO(79, 90, 232, 1)
                : const Color.fromRGBO(255, 253, 254, 1),
            border: Border.all(
              color: _index == 2
                  ? const Color.fromRGBO(79, 90, 232, 0.6)
                  : const Color.fromRGBO(230, 230, 230, 1),
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  DateFormat.E().format(_day.date),
                  style: TextStyle(
                    fontSize: 14,
                    color:
                        _index == _selectedIndex ? Colors.white : Colors.grey,
                  ),
                ),
                Text(
                  DateFormat.d().format(_day.date),
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color:
                        _index == _selectedIndex ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
