import 'package:desafiofteam/views/widgets/character_grid.dart';
import 'package:desafiofteam/views/widgets/custom_app_bar.dart';
import 'package:desafiofteam/views/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../viewmodels/character_viewmodel.dart';
import 'dart:async';

Timer? _debounce;

class CharacterScreen extends ConsumerStatefulWidget {
  const CharacterScreen({super.key});

  @override
  ConsumerState<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends ConsumerState<CharacterScreen> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
        ref.read(characterViewModelProvider.notifier).loadNextPage();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(characterViewModelProvider);

    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          SearchBarWidget(
            controller: _searchController,
            onChanged: (value) {
              if (_debounce?.isActive ?? false) _debounce!.cancel();

              _debounce = Timer(const Duration(milliseconds: 500), () {
                if (value.trim().length >= 3) {
                  ref.read(characterViewModelProvider.notifier).loadCharacters(query: value.trim());
                } else {
                  ref.read(characterViewModelProvider.notifier).loadCharacters();
                }
              });
            },
          ),
          Expanded(
            child: state.when(
              data: (characters) => CharacterGrid(
                characters: characters,
                scrollController: _scrollController,
              ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, _) => Center(
              child: Text(
                err.toString().replaceFirst('Exception: ', ''),
                style: const TextStyle(color: Colors.white),
              ),
            ),
            ),
          )
        ],
      ),
    );
  }
}
