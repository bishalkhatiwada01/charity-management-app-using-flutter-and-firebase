import 'package:flutter/material.dart';

class ExploreCauses extends StatelessWidget {
  final IconData icon;
  final String text;
  const ExploreCauses({Key? key, required this.icon, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 95,
      width: 110,
      decoration: BoxDecoration(
          color: Colors.orangeAccent.shade100,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade200.withOpacity(0.5), blurRadius: 10)
          ]),
      margin: const EdgeInsets.only(left: 15),
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.black,
            size: 35,
          ),
          Text(
            text,
            style: const TextStyle(fontSize: 17, color: Colors.black),
          )
        ],
      ),
    );
  }
}
