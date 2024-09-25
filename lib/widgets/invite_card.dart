import 'package:domi_labs_test/core/location_provider.dart';
import 'package:domi_labs_test/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InviteCard extends StatelessWidget {
  const InviteCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<LocationProvider>(
      builder: (context, lp, _) {
        return Positioned(
          bottom: 16,
          left: 0,
          right: 0,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            height: MediaQuery.of(context).size.height * 0.22,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Invite & Earn",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            lp.toggleInviteCard(false);
                            lp.createDefaultMarker();
                          },
                          icon: const Icon(Icons.clear),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Invite your neighbour and you both receive \$10 when they claim their address.",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
                CustomButton(
                  text: "Send Invite",
                  onPressed: () {
                    lp.toggleInviteCard(false);
                    lp.createDefaultMarker();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
