import 'package:flutter/material.dart';
import 'package:testtask/src/core/widgets/favorite_icon_button.dart';
import 'package:testtask/src/domain/entities.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({
    this.ch,
    this.isFav,
    this.onFavoritePressed,
    super.key,
  });

  final CharacterEntity? ch;
  final bool? isFav;
  final VoidCallback? onFavoritePressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: ch == null
          ? const SizedBox(height: 100, child: Center(child: CircularProgressIndicator()))
          : ListTile(
              leading: ch?.imageData != null
                  ? Image.memory(
                      width: 80,
                      height: 80,
                      ch!.imageData!,
                      errorBuilder: (_, __, ___) => const Icon(Icons.person),
                    )
                  : const Icon(Icons.person),
              title: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: ch!.name, style: DefaultTextStyle.of(context).style),
                    TextSpan(
                      text: ' #${ch!.id}',
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),

              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Статус: ${ch!.status}'),
                  Text('Вид: ${ch!.species}'),
                  Text('Локация: ${ch!.location}'),
                ],
              ),
              trailing: FavoriteIconButton(
                isFavorite: isFav ?? false,
                onPressed: onFavoritePressed,
              ),
              isThreeLine: true,
            ),
    );
  }
}
