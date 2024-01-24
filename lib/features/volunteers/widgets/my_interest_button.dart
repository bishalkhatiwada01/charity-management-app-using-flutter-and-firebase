import 'package:flutter/material.dart';

class InterestDropdownWithChipSelector extends StatefulWidget {
  final List<String> selectedInterests;
  final List<String> availableInterests;
  final Function(List<String>) onSelectionChanged;

  const InterestDropdownWithChipSelector({
    super.key, 
    required this.selectedInterests,
    required this.availableInterests,
    required this.onSelectionChanged,
  });

  @override
  // ignore: library_private_types_in_public_api
  _InterestDropdownWithChipSelectorState createState() =>
      _InterestDropdownWithChipSelectorState();
}

class _InterestDropdownWithChipSelectorState
    extends State<InterestDropdownWithChipSelector> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField<String>(
          value: null,
          hint: const Text('Select interests'),
          items: widget.availableInterests
              .map((interest) => DropdownMenuItem<String>(
                    value: interest,
                    child: Text(interest),
                  ))
              .toList(),
          onChanged: (selectedInterest) {
            if (selectedInterest != null &&
                !widget.selectedInterests.contains(selectedInterest)) {
              setState(() {
                widget.selectedInterests.add(selectedInterest);
                widget.onSelectionChanged(widget.selectedInterests);
              });
            }
          },
        ),
        Wrap(
          children: widget.selectedInterests.map((interest) {
            return InputChip(
              label: Text(interest),
              onDeleted: () {
                setState(() {
                  widget.selectedInterests.remove(interest);
                  widget.onSelectionChanged(widget.selectedInterests);
                });
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}
