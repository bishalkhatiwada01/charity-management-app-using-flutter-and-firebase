import 'package:flutter/material.dart';

class MyExperienceDropDownButton extends StatefulWidget {
  final Function(String?) onExperienceChanged;
  const MyExperienceDropDownButton(
      {super.key, required this.onExperienceChanged});

  @override
  State<MyExperienceDropDownButton> createState() =>
      _MyExperienceDropDownButtonState();
}

class _MyExperienceDropDownButtonState
    extends State<MyExperienceDropDownButton> {
  String? _selectedExperience;
  List<String> dropdownItems = [
    'Select an option',
    '0-1 Year',
    '1-2 Years',
    '2-4 Years',
    '4-6 Years',
    '6+ Years',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.secondary,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButton<String>(
        underline: Container(),
        isExpanded: true,
        hint: Text(
          '  Select an experience',
          style: TextStyle(
            color: Theme.of(context).hintColor,
          ),
        ),
        borderRadius: BorderRadius.circular(10),
        dropdownColor: Theme.of(context).colorScheme.secondary,
        value: _selectedExperience,
        items: dropdownItems.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text('   ' '$value'),
          );
        }).toList(),
        onChanged: (newValue) {
          setState(() {
            // Check if the selected option is the default one
            _selectedExperience =
                newValue == dropdownItems[0] ? null : newValue;
          });

          // Call the callback function to notify the parent widget
          widget.onExperienceChanged(_selectedExperience);
        },
      ),
    );
  }
}
