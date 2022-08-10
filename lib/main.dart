import 'package:app_news/services/news_service.dart';
import 'package:flutter/material.dart';

import 'package:app_news/screens/screens.dart';
import 'package:app_news/theme/theme_dark.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NewsService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: const TabsScreen(),
        theme: myTheme,
      ),
    );
  }
}
