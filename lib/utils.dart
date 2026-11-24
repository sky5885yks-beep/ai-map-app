import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// 打开外部链接（GitHub / 博客 / B站 / 公众号等）
Future<void> openLink(BuildContext context, String url) async {
  final uri = Uri.tryParse(url);
  if (uri == null) {
    _toast(context, '链接无效');
    return;
  }
  try {
    final ok = await launchUrl(uri, mode: LaunchMode.externalApplication);
    if (!ok && context.mounted) _toast(context, '无法打开：${uri.host}');
  } catch (e) {
    if (context.mounted) _toast(context, '打开失败：$e');
  }
}

void _toast(BuildContext context, String msg) {
  ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text(msg), duration: const Duration(seconds: 2)));
}

/// App 主题（浅色，尊重原站配色：墨绿主色）
class AppTheme {
  static const green = Color(0xFF1F6B5A);
  static const greenSoft = Color(0xFFE3EFEA);
  static const ink = Color(0xFF1D1D1B);
  static const ink2 = Color(0xFF5C5B55);
  static const ink3 = Color(0xFF8A887F);
  static const line = Color(0xFFE7E7E5);
  static const paper = Color(0xFFFFFFFF);
  static const sunk = Color(0xFFF6F6F4);
  static const key = Color(0xFF9A5A08);
  static const keySoft = Color(0xFFF6ECDC);

  static ThemeData get light => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: green, primary: green),
        scaffoldBackgroundColor: paper,
        appBarTheme: const AppBarTheme(
          backgroundColor: paper,
          foregroundColor: ink,
          elevation: 0,
          surfaceTintColor: Colors.transparent,
          titleTextStyle: TextStyle(
            color: ink,
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
        dividerColor: line,
        fontFamily: 'Noto Sans SC',
      );
}

/// 依据平台名返回图标
IconData platformIcon(String t) {
  switch (t) {
    case 'GitHub':
      return Icons.code;
    case '博客':
      return Icons.article_outlined;
    case '官网':
      return Icons.language;
    case 'B站':
      return Icons.play_circle_outline;
    case 'X':
      return Icons.alternate_email;
    case '公众号':
      return Icons.chat_bubble_outline;
    default:
      return Icons.link;
  }
}

/// 状态文字
String statusText(String s) => s == 'active' ? '活跃更新' : '缓慢更新';
