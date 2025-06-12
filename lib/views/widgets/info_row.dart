import 'package:flutter/material.dart';

class InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const InfoRow({
    required this.label,
    required this.value,
    super.key,
  });

  static const Color valueColor = Color(0xFF00FF9C); // Verde ácido Rick and Morty

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label: ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white, // Label branco
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                color: valueColor, // Valor verde ácido
              ),
            ),
          ),
        ],
      ),
    );
  }
}
