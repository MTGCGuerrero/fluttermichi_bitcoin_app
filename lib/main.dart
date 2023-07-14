import 'dart:convert';

import 'package:coincap/models/app_config.dart';
import 'package:coincap/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());

  Future<void> loadConfig() async {
    String _configCOntent =
        await rootBundle.loadString("assets/config/main.json");

    Map _configData = jsonDecode(_configCOntent);
    print(_configData);
    GetIt.instance.registerSingleton<AppConfig>(
      AppConfig(
        COIN_API_BASE_URL: _configData["COIN_API_BASE_URL"],
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CoinCap',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color.fromRGBO(88, 60, 197, 1.0),
      ),
      home: HomePage(),
    );
  }
}
