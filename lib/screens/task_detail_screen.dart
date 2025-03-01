import 'package:flutter/material.dart';

class TaskDetailScreen extends StatefulWidget {
  final Map<String, dynamic>? task; // Null for new task, existing task for editing

  const TaskDetailScreen({super.key, this.task});

  @override
  State<TaskDetailScreen> createState() => _TaskDetailScreenState();
}

class _TaskDetailScreenState extends State<TaskDetailScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  bool _isCompleted = false;
  TimeOfDay _selectedTime = TimeOfDay.now();

  @override
  void initState() {
    super.initState();
    if (widget.task != null) {
      // Editing existing task
      _titleController.text = widget.task!['title'];
      _timeController.text = widget.task!['time'];
      _isCompleted = widget.task!['completed'];
      
      // Parse time string to TimeOfDay if needed
      final timeStr = widget.task!['time'];
      if (timeStr.contains('AM') || timeStr.contains('PM')) {
        try {
          final parts = timeStr.split(':');
          final hourStr = parts[0];
          final minuteStr = parts[1].split(' ')[0];
          final period = parts[1].contains('PM') ? 'PM' : 'AM';
          
          int hour = int.parse(hourStr);
          final minute = int.parse(minuteStr);
          
          // Convert 12-hour format to 24-hour format
          if (period == 'PM' && hour < 12) {
            hour += 12;
          } else if (period == 'AM' && hour == 12) {
            hour = 0;
          }
          
          _selectedTime = TimeOfDay(hour: hour, minute: minute);
        } catch (e) {
          // If parsing fails, keep default time
        }
      }
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _timeController.dispose();
    super.dispose();
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );

    if (pickedTime != null && pickedTime != _selectedTime) {
      setState(() {
        _selectedTime = pickedTime;
        // Format time for display
        final hour = _selectedTime.hourOfPeriod;
        final minute = _selectedTime.minute.toString().padLeft(2, '0');
        final period = _selectedTime.period == DayPeriod.am ? 'AM' : 'PM';
        _timeController.text = '${hour == 0 ? 12 : hour}:$minute $period';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F0E5),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          widget.task == null ? 'Add New Task' : 'Edit Task',
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              
              // Task title field
              const Text(
                'Task Title',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _titleController,
                decoration: InputDecoration(
                  hintText: 'Enter task title',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Task time field
              const Text(
                'Task Time',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () => _selectTime(context),
                child: AbsorbPointer(
                  child: TextField(
                    controller: _timeController,
                    decoration: InputDecoration(
                      hintText: 'Select time',
                      filled: true,
                      fillColor: Colors.white,
                      suffixIcon: const Icon(Icons.access_time),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Task completion status
              Row(
                children: [
                  Checkbox(
                    value: _isCompleted,
                    onChanged: (value) {
                      setState(() {
                        _isCompleted = value ?? false;
                      });
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const Text('Mark as completed'),
                ],
              ),
              
              const Spacer(),
              
              // Save button
              ElevatedButton(
                onPressed: () {
                  // Validate inputs
                  if (_titleController.text.trim().isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please enter a task title')),
                    );
                    return;
                  }
                  
                  if (_timeController.text.trim().isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please select a time')),
                    );
                    return;
                  }
                  
                  // Create task data
                  final taskData = {
                    'title': _titleController.text.trim(),
                    'time': _timeController.text.trim(),
                    'completed': _isCompleted,
                  };
                  
                  // Return task data to previous screen
                  Navigator.pop(context, taskData);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Save Task',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}