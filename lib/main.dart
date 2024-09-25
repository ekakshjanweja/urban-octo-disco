import 'package:domi_labs_test/app.dart';
import 'package:domi_labs_test/core/location_provider.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LocationProvider()),
      ],
      child: const DomiLabsTest(),
    ),
  );
}
