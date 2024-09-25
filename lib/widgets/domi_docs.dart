import 'package:domi_labs_test/widgets/domi_docs_tile.dart';
import 'package:flutter/material.dart';

class DomiDocs extends StatelessWidget {
  const DomiDocs({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 48),
      padding: const EdgeInsets.symmetric(
        vertical: 24,
        horizontal: 16,
      ),
      decoration: BoxDecoration(
        color: const Color(0XFF171717),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "domi docs",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const Icon(
                Icons.chevron_right,
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 16),
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: const Color(0XFF1C1C1C),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Text(
              "Search Docs",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index) => DomiDocsTile(
                index: index,
              ),
            ),
          )
        ],
      ),
    );
  }
}
