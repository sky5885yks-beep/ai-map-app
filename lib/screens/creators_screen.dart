import 'package:flutter/material.dart';
import '../data/data_repository.dart';
import '../models/models.dart';
import '../utils.dart';
import 'creator_detail_screen.dart';

/// 创作者地图页：顶部分类筛选 + 卡片列表
class CreatorsScreen extends StatefulWidget {
  const CreatorsScreen({super.key});

  @override
  State<CreatorsScreen> createState() => _CreatorsScreenState();
}

class _CreatorsScreenState extends State<CreatorsScreen> {
  String? _activeCat; // null = 全部

  List<Creator> get _list {
    final l = _activeCat == null
        ? List<Creator>.from(creators)
        : creators.where((c) => c.cat == _activeCat).toList();
    l.sort((a, b) => b.followers.compareTo(a.followers));
    return l;
  }

  @override
  Widget build(BuildContext context) {
    final list = _list;
    return Scaffold(
      appBar: AppBar(
        title: const Text('中文 AI 创作者地图'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(color: AppTheme.line, height: 1),
        ),
      ),
      body: Column(
        children: [
          // 分类标签栏
          SizedBox(
            height: 52,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              itemCount: creatorCategories.length + 1,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (_, i) {
                final all = i == 0;
                final cat = all ? null : creatorCategories[i - 1];
                final selected = _activeCat == cat?.id;
                return ChoiceChip(
                  label: Text(all ? '全部 ${creators.length}' : '${cat!.title} ${creators.where((c) => c.cat == cat.id).length}'),
                  selected: selected,
                  onSelected: (_) => setState(() => _activeCat = cat?.id),
                  selectedColor: AppTheme.green,
                  backgroundColor: AppTheme.sunk,
                  labelStyle: TextStyle(fontSize: 12,
                      color: selected ? Colors.white : AppTheme.ink2,
                      fontWeight: selected ? FontWeight.w600 : FontWeight.normal),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                  showCheckmark: false,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 4, 20, 10),
            child: Row(
              children: [
                Text('${list.length} 位创作者', style: const TextStyle(
                    fontSize: 11, color: AppTheme.ink3)),
                const Spacer(),
                const Text('按 followers 排序', style: TextStyle(
                    fontSize: 11, color: AppTheme.ink3)),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 30),
              itemCount: list.length,
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemBuilder: (_, i) => _CreatorCard(
                creator: list[i],
                categoryTitle: creatorCategories
                    .firstWhere((c) => c.id == list[i].cat, orElse: () => creatorCategories.first)
                    .title,
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => CreatorDetailScreen(creator: list[i]))),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CreatorCard extends StatelessWidget {
  final Creator creator;
  final String categoryTitle;
  final VoidCallback onTap;
  const _CreatorCard({required this.creator, required this.categoryTitle, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final topStar = creator.repos.isEmpty ? 0 : creator.repos.map((r) => r.s).reduce((a, b) => a > b ? a : b);
    return Card(
      elevation: 0,
      color: AppTheme.paper,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: AppTheme.line),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 44, height: 44,
                    decoration: BoxDecoration(
                      color: AppTheme.greenSoft,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                    child: Text(creator.avatar, style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w700, color: AppTheme.green)),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(creator.name, style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w700, color: AppTheme.ink)),
                        const SizedBox(height: 2),
                        Text('@${creator.handle.isEmpty ? '社媒创作者' : creator.handle}',
                            style: const TextStyle(fontSize: 11, color: AppTheme.ink3)),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(compactNumber(creator.followers), style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w700, color: AppTheme.ink)),
                      const Text('FOLLOWERS', style: TextStyle(fontSize: 8, color: AppTheme.ink3)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(creator.tag, maxLines: 2, overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 12, color: AppTheme.ink2, height: 1.6)),
              if (creator.repos.isNotEmpty) ...[
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.only(top: 8),
                  decoration: const BoxDecoration(border: Border(top: BorderSide(color: AppTheme.line))),
                  child: Row(
                    children: [
                      Flexible(
                        child: Text(creator.repos.first.n,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 11, color: AppTheme.ink2)),
                      ),
                      const SizedBox(width: 6),
                      Text('★ ${compactNumber(topStar)}',
                          style: const TextStyle(fontSize: 10, color: AppTheme.key)),
                    ],
                  ),
                ),
              ],
              const SizedBox(height: 10),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                    decoration: BoxDecoration(
                      color: AppTheme.sunk, borderRadius: BorderRadius.circular(4)),
                    child: Text(categoryTitle, style: const TextStyle(
                        fontSize: 10, color: AppTheme.ink2)),
                  ),
                  const Spacer(),
                  const Text('详情', style: TextStyle(fontSize: 11, color: AppTheme.green)),
                  const Icon(Icons.chevron_right, size: 15, color: AppTheme.green),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
