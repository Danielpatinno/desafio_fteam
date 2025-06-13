import 'package:flutter/material.dart';
import '../../models/character.dart';

class CharacterDetailModal extends StatelessWidget {
  final Character character;

  const CharacterDetailModal({required this.character, super.key});

  String safeValue(String? value) {
    if (value == null) return 'Não informado';
    final trimmed = value.trim().toLowerCase();
    if (trimmed.isEmpty || trimmed == 'unknown') {
      return 'Não informado';
    }
    return value.trim();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      backgroundColor: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isSmallWidth = constraints.maxWidth < 500;
              final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

              if (isSmallWidth || isPortrait) {
                return _buildVerticalLayout();
              } else {
                return _buildHorizontalLayout();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildHorizontalLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            character.image,
            height: 200,
            width: 200,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) =>
                const Icon(Icons.error, size: 100, color: Colors.white),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                safeValue(character.name),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF00FF9C),
                ),
              ),
              const SizedBox(height: 16),
              _infoRow('Espécie', safeValue(character.species)),
              _infoRow('Gênero', safeValue(character.gender)),
              _infoRow('Status', safeValue(character.status)),
              _infoRow('Origem', safeValue(character.origin)),
              _infoRow('Local Atual', safeValue(character.location)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildVerticalLayout() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          safeValue(character.name),
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF00FF9C),
          ),
        ),
        const SizedBox(height: 12),
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            character.image,
            height: 200,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) =>
                const Icon(Icons.error, size: 100, color: Colors.white),
          ),
        ),
        const SizedBox(height: 16),
        _infoRow('Espécie', safeValue(character.species)),
        _infoRow('Gênero', safeValue(character.gender)),
        _infoRow('Status', safeValue(character.status)),
        _infoRow('Origem', safeValue(character.origin)),
        _infoRow('Local Atual', safeValue(character.location)),
      ],
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label: ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(color: Color(0xFF00FF9C)),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}
