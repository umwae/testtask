import 'package:flutter/material.dart';
import 'package:testtask/src/presentation/scopes/characters_scope.dart';
import 'package:testtask/src/presentation/scopes/favorites_scope.dart';

class RootScope extends StatefulWidget {
  const RootScope({super.key});

  @override
  State<RootScope> createState() => _RootScopeState();
}

class _RootScopeState extends State<RootScope> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const CharactersScope(),
    const FavoritesScope(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Персонажи',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Избранное',
          ),
        ],
      ),
    );
  }
}

