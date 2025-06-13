import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/character.dart';
import '../../viewmodels/character_viewmodel.dart';
import '../widgets/character_detail_modal.dart';

class CharacterCard extends ConsumerWidget {
  final Character character;

  const CharacterCard({required this.character, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;
    final nameFontSize = screenWidth < 400 ? 14.0 : 16.0;
    final speciesFontSize = screenWidth < 400 ? 12.0 : 14.0;

    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;
        final imageHeight = maxWidth * 0.85;

        return InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (_) => CharacterDetailModal(character: character),
            );
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            color: const Color.fromARGB(42, 129, 126, 126),
            elevation: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: SizedBox(
                    height: imageHeight,
                    width: double.infinity,
                    child: Image.network(
                      character.image,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => const Icon(Icons.error),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              character.name,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: nameFontSize,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              character.species,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: speciesFontSize,
                                color: const Color.fromARGB(255, 16, 239, 64),
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        onPressed: () {
                          ref.read(characterViewModelProvider.notifier).toggleFavorite(character.id);
                        },
                        icon: Icon(
                          character.isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: character.isFavorite ? Colors.red : null,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
