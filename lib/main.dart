import 'package:flutter/material.dart';
import 'utils.dart';
import 'screens/home_screen.dart';

void main() => runApp(const AiMapApp());

/// App 根组件
class AiMapApp extends StatelessWidget {
  const AiMapApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI 地图',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const HomeScreen(),
    );
  }
}
