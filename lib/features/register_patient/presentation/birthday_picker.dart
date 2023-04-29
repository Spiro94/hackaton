import 'package:flutter/material.dart';

class BirthdayPicker extends StatefulWidget {
  final Function(DateTime) onDateSelected;

  const BirthdayPicker({super.key, required this.onDateSelected});

  @override
  State<BirthdayPicker> createState() => _BirthdayPickerState();
}

class _BirthdayPickerState extends State<BirthdayPicker> {
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _showDatePicker,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: [
            const Icon(Icons.calendar_today),
            const SizedBox(width: 16.0),
            Text(
              _selectedDate == null
                  ? 'Seleccionar fecha de nacimiento'
                  : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
              style: const TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showDatePicker() async {
    final currentDate = DateTime.now();
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? currentDate,
      firstDate: DateTime(currentDate.year - 100),
      lastDate: currentDate,
    );
    if (selectedDate != null) {
      setState(() {
        _selectedDate = selectedDate;
      });
      widget.onDateSelected(selectedDate);
    }
  }
}
