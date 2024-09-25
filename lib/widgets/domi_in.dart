import 'package:domi_labs_test/widgets/image_icon.dart';
import 'package:flutter/material.dart';

class DomiInCard extends StatelessWidget {
  const DomiInCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.symmetric(
        vertical: 24,
        horizontal: 16,
      ),
      decoration: BoxDecoration(
        color: const Color(0XFF171717),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "domi in",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const Icon(
                  Icons.chevron_right,
                ),
              ],
            ),
          ),
          Flexible(
            flex: 4,
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomImageIcon(),
                  CustomImageIcon(),
                  CustomImageIcon(),
                  CustomImageIcon(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
