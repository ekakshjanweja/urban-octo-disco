import 'package:flutter/material.dart';

class DomiDocsTile extends StatelessWidget {
  DomiDocsTile({
    super.key,
    required this.index,
  });

  final int index;

  final List<String> icons = [
    "assets/pdf.png",
    "assets/docs.png",
    "assets/sheets.png",
  ];

  final List<String> titles = [
    "100 Martinique Ave Title",
    "Chase Bank Statement - November 2023",
    "Backyard Remodel Renderings",
  ];

  final List<String> subtitles = [
    "Opened Dec 4, 2023",
    "Opened Dec 3, 2023",
    "Opened Nov 11, 2023",
  ];

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        icons[index],
        width: 36,
      ),
      title: Text(
        titles[index],
        style: Theme.of(context).textTheme.titleMedium,
      ),
      subtitle: Text(
        subtitles[index],
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
            ),
      ),
    );
  }
}
