import 'package:flutter/material.dart';

class CalculatorResultCard extends StatelessWidget {
  const CalculatorResultCard({
    super.key,
    required this.input,
    required this.result,
  });

  final String input;
  final String result;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).primaryColor.withOpacity(0.1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Input: $input',
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          Text(
            'Result: $result',
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
