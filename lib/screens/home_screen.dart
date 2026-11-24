import 'package:flutter/material.dart';
import '../data/data_repository.dart';
import '../utils.dart';
import 'creators_screen.dart';
import 'handbooks_screen.dart';

/// 首页：两个站点的入口卡片
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AI 地图')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 28, 20, 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('跟着人找入口，\n把散落的 AI 手册走成一张图。',
                style: TextStyle(fontSize: 25, height: 1.45,
                    fontWeight: FontWeight.w700, color: AppTheme.ink)),
            const SizedBox(height: 10),
            const Text('中文 AI 圈的两张导航地图，离线可看。',
                style: TextStyle(fontSize: 13, color: AppTheme.ink3)),
            const SizedBox(height: 30),
            _EntryCard(
              no: '01',
              title: '中文 AI 创作者地图',
              subtitle: '先认出人，再给出他的主阵地与代表作',
              meta: '${creators.length} 位创作者 · ${creatorCategories.length} 个分类',
              color: AppTheme.green,
              soft: AppTheme.greenSoft,
              icon: Icons.groups_outlined,
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const CreatorsScreen())),
            ),
            const SizedBox(height: 16),
            _EntryCard(
              no: '02',
              title: 'AI Handbook 导航地图',
              subtitle: '按权威性与用途分层，点击节点看原始仓库',
              meta: '${handbookRepos.length} 个仓库 · 29.6k stars',
              color: AppTheme.key,
              soft: AppTheme.keySoft,
              icon: Icons.map_outlined,
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const HandbooksScreen())),
            ),
            const SizedBox(height: 34),
            const Center(
              child: Text('数据快照：2026-11-23\n点击条目可跳转到原始网页',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 11, color: AppTheme.ink3, height: 1.7)),
            ),
          ],
        ),
      ),
    );
  }
}

class _EntryCard extends StatelessWidget {
  final String no, title, subtitle, meta;
  final Color color, soft;
  final IconData icon;
  final VoidCallback onTap;
  const _EntryCard({required this.no, required this.title, required this.subtitle,
      required this.meta, required this.color, required this.soft,
      required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: soft,
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 42, height: 42,
                    decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
                    child: Icon(icon, color: Colors.white, size: 22),
                  ),
                  const Spacer(),
                  Text(no, style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800,
                      color: color.withOpacity(0.25))),
                ],
              ),
              const SizedBox(height: 16),
              Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700,
                  color: AppTheme.ink)),
              const SizedBox(height: 6),
              Text(subtitle, style: const TextStyle(fontSize: 12.5,
                  color: AppTheme.ink2, height: 1.5)),
              const SizedBox(height: 14),
              Row(
                children: [
                  Text(meta, style: TextStyle(fontSize: 11, color: color,
                      fontWeight: FontWeight.w600)),
                  const Spacer(),
                  Icon(Icons.arrow_forward, size: 18, color: color),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
