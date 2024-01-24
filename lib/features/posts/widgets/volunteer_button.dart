import 'package:flutter/material.dart';

class VolunteerButton extends StatelessWidget {
  final VoidCallback onVolunteerPressed;

  const VolunteerButton({
    required this.onVolunteerPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onVolunteerPressed,
      style: ElevatedButton.styleFrom(
        primary: Theme.of(context).colorScheme.secondary,
        onPrimary: Theme.of(context).colorScheme.primary,
      ),
      child: Text('Volunteer',style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),
    );
  }
}
