import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Daily schedule data
  final List<Map<String, dynamic>> _schedule = [
    {
      'title': 'Study',
      'time': '09:00',
      'color': Colors.blue[100],
      'textColor': Colors.blue,
    },
    {
      'title': 'Exercise',
      'time': '12:00',
      'color': Colors.green[100],
      'textColor': Colors.green,
    },
    {
      'title': 'Work',
      'time': '14:00',
      'color': Colors.purple[100],
      'textColor': Colors.purple,
    },
    {
      'title': 'Sleep',
      'time': '22:00',
      'color': Colors.grey[200],
      'textColor': Colors.grey[800],
    },
  ];

  // Active challenges data
  final List<Map<String, dynamic>> _challenges = [
    {
      'title': 'Fitness Challenge',
      'icon': Icons.fitness_center,
      'daysLeft': 5,
    },
    {
      'title': 'Reading Challenge',
      'icon': Icons.book,
      'daysLeft': 12,
    },
  ];

  // Recent achievements data
  final List<Map<String, dynamic>> _achievements = [
    {
      'title': 'Early Bird',
      'level': '3/5',
      'icon': Icons.wb_sunny_outlined,
    },
    {
      'title': 'Focus Master',
      'level': 'Level 4',
      'icon': Icons.psychology_outlined,
    },
    {
      'title': 'Task Streak',
      'level': '8 days',
      'icon': Icons.checklist_outlined,
    },
    {
      'title': 'Step Goal',
      'level': '65%',
      'icon': Icons.directions_walk_outlined,
    },
  ];

  // Upcoming events
  final List<Map<String, dynamic>> _upcoming = [
    {
      'title': 'Team Meeting',
      'time': 'In 30 minutes',
    },
    {
      'title': 'Workout Reminder',
      'time': 'Today 5:00 PM',
    },
    {
      'title': 'Project Deadline',
      'time': 'Tomorrow',
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Get current date
    // Format the current date as "Day of week, Month day"
    final formattedDate = DateTime.now().toString();

    return Scaffold(
      backgroundColor: const Color(0xFFF5F0E5),
      body: SafeArea(
        // Main content wrapped in SafeArea
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header with greeting and profile
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Good morning, Alex',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          formattedDate,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 25),

                // Today's Focus section
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Today\'s Focus',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.local_fire_department,
                                    size: 16, color: Colors.orange),
                                const SizedBox(width: 4),
                                Text('5 days streak',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          // Tasks
                          Column(
                            children: [
                              const Text(
                                '8/12',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 5),
                              Text('Tasks',
                                  style: TextStyle(
                                      color: Colors.grey[600], fontSize: 14)),
                            ],
                          ),
                          // Steps
                          Column(
                            children: [
                              const Text(
                                '6,542',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 5),
                              Text('Steps',
                                  style: TextStyle(
                                      color: Colors.grey[600], fontSize: 14)),
                            ],
                          ),
                          // Focus time
                          Column(
                            children: [
                              const Text(
                                '2h 45m',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 5),
                              Text('Focus time',
                                  style: TextStyle(
                                      color: Colors.grey[600], fontSize: 14)),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                // Active Challenges
                const Text(
                  'Active Challenges',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 15),

                // Challenge cards
                Row(
                  children: _challenges.map((challenge) {
                    return Expanded(
                      child: Container(
                        margin: EdgeInsets.only(
                            right: challenge == _challenges.first ? 10 : 0),
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(challenge['icon']),
                            const SizedBox(height: 15),
                            Text(
                              challenge['title'],
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              '${challenge['daysLeft']} days left',
                              style: TextStyle(
                                  color: Colors.grey[600], fontSize: 13),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),

                const SizedBox(height: 25),

                // Daily Schedule
                const Text(
                  'Daily Schedule',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 15),

                // Schedule list
                Column(
                  children: _schedule.map((item) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: [
                          // Time
                          SizedBox(
                            width: 50,
                            child: Text(
                              item['time'],
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                          ),
                          const SizedBox(width: 10),
                          // Activity
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 15),
                              decoration: BoxDecoration(
                                color: item['color'],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    item['title'] == 'Study'
                                        ? Icons.book_outlined
                                        : item['title'] == 'Exercise'
                                            ? Icons.fitness_center_outlined
                                            : item['title'] == 'Work'
                                                ? Icons.work_outline
                                                : Icons.nightlight_outlined,
                                    color: item['textColor'],
                                    size: 20,
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    item['title'],
                                    style: TextStyle(
                                      color: item['textColor'],
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),

                const SizedBox(height: 25),

                // Recent Achievements
                const Text(
                  'Recent Achievements',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 15),

                // Achievement cards
                GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  shrinkWrap: true,
                  childAspectRatio: 2.2,
                  physics: const NeverScrollableScrollPhysics(),
                  children: _achievements.map((achievement) {
                    return Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(achievement['icon'],
                                size: 20, color: Colors.grey[700]),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  achievement['title'],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13),
                                ),
                                const SizedBox(height: 3),
                                Text(
                                  achievement['level'],
                                  style: TextStyle(
                                      color: Colors.grey[600], fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),

                const SizedBox(height: 25),

                // Upcoming
                const Text(
                  'Upcoming',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 15),

                // Upcoming items
                Column(
                  children: _upcoming.map((item) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['title'],
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(height: 3),
                              Text(
                                item['time'],
                                style: TextStyle(
                                    color: Colors.grey[600], fontSize: 13),
                              ),
                            ],
                          ),
                          Icon(Icons.chevron_right, color: Colors.grey[400]),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey[400],
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_outlined),
            activeIcon: Icon(Icons.calendar_today),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            activeIcon: Icon(Icons.add_circle),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics_outlined),
            activeIcon: Icon(Icons.analytics),
            label: 'Stats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
