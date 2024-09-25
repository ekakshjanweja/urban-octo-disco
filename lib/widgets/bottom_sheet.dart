import 'package:domi_labs_test/core/location_provider.dart';
import 'package:domi_labs_test/widgets/darg_handle.dart';
import 'package:domi_labs_test/widgets/domi_docs.dart';
import 'package:domi_labs_test/widgets/domi_in.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InfoBottomSheet extends StatelessWidget {
  const InfoBottomSheet({
    super.key,
    required this.scrollController,
  });

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Consumer<LocationProvider>(
      builder: (context, lp, _) {
        return SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
              color: Colors.black,
            ),
            child: ListView(
              controller: scrollController,
              children: const [
                DragHandle(),
                DomiInCard(),
                DomiDocs(),
              ],
            ),
          ),
        );
      },
    );
  }
}
