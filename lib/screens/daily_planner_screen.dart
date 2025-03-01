import 'package:flutter/material.dart';

class DailyPlannerScreen extends StatefulWidget {
  const DailyPlannerScreen({super.key});

  @override
  State<DailyPlannerScreen> createState() => _DailyPlannerScreenState();
}

class _DailyPlannerScreenState extends State<DailyPlannerScreen> {
  DateTime _selectedDate = DateTime.now();

  // Sample schedule data - in a real app, this would come from a database or state management
  final List<Map<String, dynamic>> _schedule = [
    {
      'title': 'Sleep',
      'startTime': '00:00',
      'endTime': '07:00',
      'location': 'Home',
      'color': Colors.blue[100],
    },
    {
      'title': 'Exercise',
      'startTime': '07:00',
      'endTime': '08:00',
      'location': 'Gym',
      'color': Colors.green[100],
    },
    {
      'title': 'Work',
      'startTime': '09:00',
      'endTime': '12:00',
      'location': 'Office',
      'color': Colors.orange[100],
    },
    {
      'title': 'Study',
      'startTime': '13:00',
      'endTime': '15:00',
      'location': 'Library',
      'color': Colors.purple[100],
    },
    {
      'title': 'Work',
      'startTime': '15:30',
      'endTime': '17:30',
      'location': 'Office',
      'color': Colors.orange[100],
    },
    {
      'title': 'Study',
      'startTime': '18:30',
      'endTime': '20:00',
      'location': 'Home',
      'color': Colors.purple[100],
    },
    {
      'title': 'Sleep',
      'startTime': '22:00',
      'endTime': '23:59',
      'location': 'Home',
      'color': Colors.blue[100],
    },
  ];

  // Format date as "Day, Month Date"
  String _formatDate(DateTime date) {
    final List<String> weekdays = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];
    final List<String> months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];

    final weekday = weekdays[date.weekday - 1];
    final month = months[date.month - 1];

    return '$weekday, $month ${date.day}';
  }

  void _previousDay() {
    setState(() {
      _selectedDate = _selectedDate.subtract(const Duration(days: 1));
    });
  }

  void _nextDay() {
    setState(() {
      _selectedDate = _selectedDate.add(const Duration(days: 1));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F0E5),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Daily Planner',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          // Date selector
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.chevron_left),
                  onPressed: _previousDay,
                ),
                Text(
                  _formatDate(_selectedDate),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.chevron_right),
                  onPressed: _nextDay,
                ),
              ],
            ),
          ),

          // Today button
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  _selectedDate = DateTime.now();
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[200],
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              ),
              child: const Text('Today'),
            ),
          ),

          // Schedule timeline
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              itemCount: 24, // 24 hours in a day
              itemBuilder: (context, hourIndex) {
                final hour = hourIndex;
                final hourString = hour.toString().padLeft(2, '0') + ':00';

                // Find events that occur during this hour
                final eventsThisHour = _schedule.where((event) {
                  final startHour = int.parse(event['startTime'].split(':')[0]);
                  final endHour = int.parse(event['endTime'].split(':')[0]);
                  return (hour >= startHour && hour < endHour);
                }).toList();

                return Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Time column
                        SizedBox(
                          width: 50,
                          child: Text(
                            hourString,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),

                        // Events column
                        Expanded(
                          child: Column(
                            children: eventsThisHour.map((event) {
                              return Container(
                                margin: const EdgeInsets.only(bottom: 8.0),
                                padding: const EdgeInsets.all(12.0),
                                decoration: BoxDecoration(
                                  color: event['color'] ?? Colors.blue[100],
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          event['title'],
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        Text(
                                          '${event['startTime']} - ${event['endTime']}',
                                          style: TextStyle(
                                            color: Colors.grey[700],
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      event['location'] ?? '',
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                    // Hour divider
                    Divider(color: Colors.grey[300], height: 20),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
