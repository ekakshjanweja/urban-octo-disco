import 'package:domi_labs_test/core/location_provider.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<LocationProvider>(
      builder: (context, lp, _) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 1,
                  child: IconButton(
                    padding: const EdgeInsets.all(12),
                    style: const ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll<Color?>(Colors.black),
                    ),
                    onPressed: () {},
                    icon: const Icon(
                      Icons.account_circle_outlined,
                      size: 24,
                    ),
                  ),
                ),
                Visibility(
                  visible: lp.address != null,
                  child: Flexible(
                    flex: 3,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(80),
                      ),
                      child: Row(
                        children: [
                          Flexible(
                            flex: 0,
                            child: Container(
                              margin: const EdgeInsets.only(left: 8),
                              width: 32,
                              height: 32,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(1000),
                                child: Image.asset(
                                  "assets/bg.png",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 16,
                              ).copyWith(right: 24, left: 8),
                              child: Text(
                                lp.address ?? "No Address",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: IconButton(
                    padding: const EdgeInsets.all(12),
                    style: const ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll<Color?>(Colors.black),
                    ),
                    onPressed: () {},
                    icon: const Icon(
                      Iconsax.messages,
                      size: 24,
                    ),
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
