import 'package:flutter/material.dart';
import '../data/data_repository.dart';
import '../models/models.dart';
import '../utils.dart';

/// 手册地图页：概览数字 + 分区筛选 + 仓库列表
class HandbooksScreen extends StatefulWidget {
  const HandbooksScreen({super.key});

  @override
  State<HandbooksScreen> createState() => _HandbooksScreenState();
}

class _HandbooksScreenState extends State<HandbooksScreen> {
  String? _activeBand;

  List<HandbookRepo> get _list {
    final all = sortedHandbookRepos();
    return _activeBand == null
        ? all
        : all.where((r) => r.band == _activeBand).toList();
  }

  @override
  Widget build(BuildContext context) {
    final list = _list;
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Handbook 导航地图'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(color: AppTheme.line, height: 1),
        ),
      ),
      body: Column(
        children: [
          // 概览数字
          Container(
            width: double.infinity,
            color: AppTheme.sunk,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _stat('${handbookRepos.length}', '仓库'),
                _stat('29.6k', '总 stars'),
                _stat('${handbookBands.where((b) => b.official).length}', '官方'),
                _stat('24', '仍在更新'),
              ],
            ),
          ),
          // 分区标签
          SizedBox(
            height: 52,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              itemCount: handbookBands.length + 1,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (_, i) {
                final all = i == 0;
                final band = all ? null : handbookBands[i - 1];
                final selected = _activeBand == band?.id;
                return ChoiceChip(
                  label: Text(all ? '全部' : band!.title),
                  selected: selected,
                  onSelected: (_) => setState(() => _activeBand = band?.id),
                  selectedColor: AppTheme.key,
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
                Text('${list.length} 个仓库',
                    style: const TextStyle(fontSize: 11, color: AppTheme.ink3)),
                const Spacer(),
                const Text('按 stars 排序',
                    style: TextStyle(fontSize: 11, color: AppTheme.ink3)),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 30),
              itemCount: list.length,
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemBuilder: (_, i) => _RepoCard(repo: list[i]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _stat(String n, String label) => Column(
        children: [
          Text(n, style: const TextStyle(
              fontSize: 17, fontWeight: FontWeight.w700, color: AppTheme.ink)),
          const SizedBox(height: 2),
          Text(label, style: const TextStyle(fontSize: 10, color: AppTheme.ink3)),
        ],
      );
}

class _RepoCard extends StatelessWidget {
  final HandbookRepo repo;
  const _RepoCard({required this.repo});

  @override
  Widget build(BuildContext context) {
    final band = handbookBands.firstWhere(
        (b) => b.id == repo.band, orElse: () => handbookBands.first);
    return Card(
      elevation: 0,
      color: AppTheme.paper,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: AppTheme.line),
      ),
      child: InkWell(
        onTap: () => openLink(context, repo.url),
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(repo.name, style: const TextStyle(
                        fontSize: 13, fontWeight: FontWeight.w700, color: AppTheme.ink)),
                  ),
                  Text('★ ${compactNumber(repo.stars)}',
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w700, color: AppTheme.key)),
                ],
              ),
              const SizedBox(height: 5),
              Text(repo.intro, maxLines: 2, overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 11.5, color: AppTheme.ink2, height: 1.6)),
              const SizedBox(height: 10),
              Row(
                children: [
                  if (repo.isOfficial)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      margin: const EdgeInsets.only(right: 6),
                      decoration: BoxDecoration(
                          color: AppTheme.greenSoft, borderRadius: BorderRadius.circular(4)),
                      child: const Text('OFFICIAL', style: TextStyle(
                          fontSize: 9, fontWeight: FontWeight.w700, color: AppTheme.green)),
                    ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                        color: AppTheme.sunk, borderRadius: BorderRadius.circular(4)),
                    child: Text(band.title, style: const TextStyle(
                        fontSize: 9, color: AppTheme.ink2)),
                  ),
                  const Spacer(),
                  Text('${repo.pushedAt} · ${statusText(repo.status)}',
                      style: const TextStyle(fontSize: 9, color: AppTheme.ink3)),
                  const Icon(Icons.open_in_new, size: 13, color: AppTheme.green),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
