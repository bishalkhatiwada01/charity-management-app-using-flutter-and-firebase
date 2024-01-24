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
        primary: Theme.of(context).colorScheme.secondary,
        onPrimary: Theme.of(context).colorScheme.onError,
      ),
      child: Text('Donate',style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),
    );
  }
}
