import 'package:flutter/material.dart';

class DonateButton extends StatelessWidget {
  final VoidCallback onDonatePressed;

  const DonateButton({
    required this.onDonatePressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onDonatePressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Theme.of(context).colorScheme.onError,
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      child: Text('Donate',style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),
    );
  }
}
