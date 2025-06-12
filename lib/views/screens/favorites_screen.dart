import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../viewmodels/character_viewmodel.dart';
import '../widgets/character_card.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(characterViewModelProvider
      .select((value) => value.asData?.value ?? []))
      .where((c) => c.isFavorite)
      .toList();

    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: const Text(
          'Favoritos',
          style: TextStyle(color: Colors.white),
        ),
         iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: favorites.isEmpty
        ? const Center(
            child: Text(
              'Nenhum personagem favoritado ainda.',
              style: TextStyle(color:Colors.white),
            )
          )
        : GridView.builder(
            padding: const EdgeInsets.all(8),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemCount: favorites.length,
            itemBuilder: (context, index) {
              final character = favorites[index];
              return CharacterCard(character: character);
            },
          ),
    );
  }
}
