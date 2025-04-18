import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DatePickerScreen extends StatefulWidget {
  const DatePickerScreen({super.key});

  @override
  _DatePickerScreenState createState() => _DatePickerScreenState();
}

class _DatePickerScreenState extends State<DatePickerScreen> {
  DateTime? _selectedDate;
  bool _isDaily = false;
  bool _isWeekly = false;
  bool _isMonthly = false;
  bool _isYearly = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Date Picker'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Select Date'),
            SfDateRangePicker(
              onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
                setState(() {
                  if (args.value is DateTime) {
                    _selectedDate = args.value;
                  }
                });
              },
              selectionMode: DateRangePickerSelectionMode.single,
            ),
            const SizedBox(height: 20),
            const Text('Frequency'),
            SwitchListTile(
              title: const Text('Daily'),
              value: _isDaily,
              onChanged: (value) {
                setState(() {
                  _isDaily = value;
                });
              },
            ),
            SwitchListTile(
              title: const Text('Weekly'),
              value: _isWeekly,
              onChanged: (value) {
                setState(() {
                  _isWeekly = value;
                });
              },
            ),
            SwitchListTile(
              title: const Text('Monthly'),
              value: _isMonthly,
              onChanged: (value) {
                setState(() {
                  _isMonthly = value;
                });
              },
            ),
            SwitchListTile(
              title: const Text('Yearly'),
              value: _isYearly,
              onChanged: (value) {
                setState(() {
                  _isYearly = value;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle the selected date and frequencies
                String selectedDateStr = _selectedDate != null
                    ? DateFormat('dd MMMM yyyy').format(_selectedDate!)
                    : 'Not selected';

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                        'Selected Date: $selectedDateStr, Daily: $_isDaily, Weekly: $_isWeekly, Monthly: $_isMonthly, Yearly: $_isYearly'),
                  ),
                );

                Navigator.pop(context);
              },
              child: const Text('Confirm'),
            ),
          ],
        ),
      ),
    );
  }
}