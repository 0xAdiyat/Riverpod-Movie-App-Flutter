import 'package:core/persistence/sembast_data_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_movie_app/top_level_providers.dart';

import 'app/app_startup/app_startup_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dataStore = await SembastDataStore.makeDefault();

  runApp(ProviderScope(
    overrides: [dataStoreProvider.overrideWithValue(dataStore)],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AppStartupPage(),
    );
  }
}
