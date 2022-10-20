import 'package:flutter/material.dart';

class RowTile extends StatelessWidget {
  const RowTile({super.key, required this.title, required this.description});

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 8,
          bottom: 8,
        ),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.w200,
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Text(description),
            ),
          ],
        ),
      ),
    );
  }
}
