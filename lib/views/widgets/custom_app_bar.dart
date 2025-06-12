import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../screens/favorites_screen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: Color.fromARGB(224, 255, 255, 255)),
      backgroundColor: Colors.black12,
      title: SvgPicture.asset(
        'assets/images/logo.svg',
        height: 50,
        width: 70,
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.favorite),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const FavoritesScreen()),
            );
          },
        ),
      ],
    );
  }
}
