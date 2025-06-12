import 'package:flutter/material.dart';
import '../../models/character.dart';
import 'character_card.dart';

class CharacterGrid extends StatelessWidget {
  final List<Character> characters;
  final ScrollController scrollController;

  const CharacterGrid({
    super.key,
    required this.characters,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 300,
        childAspectRatio: 0.7,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: characters.length,
      itemBuilder: (context, index) {
        return CharacterCard(character: characters[index]);
      },
    );
  }
}
