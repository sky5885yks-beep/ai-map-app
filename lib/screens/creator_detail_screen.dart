import 'package:flutter/material.dart';
import '../data/data_repository.dart';
import '../models/models.dart';
import '../utils.dart';

/// 创作者详情页：简介 + 代表作（可点跳 GitHub）+ 全部主页入口
class CreatorDetailScreen extends StatelessWidget {
  final Creator creator;
  const CreatorDetailScreen({super.key, required this.creator});

  @override
  Widget build(BuildContext context) {
    final cat = creatorCategories.firstWhere(
        (c) => c.id == creator.cat, orElse: () => creatorCategories.first);
    return Scaffold(
      appBar: AppBar(title: Text(creator.name)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 24, 20, 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 60, height: 60,
                  decoration: BoxDecoration(
                      color: AppTheme.greenSoft, borderRadius: BorderRadius.circular(14)),
                  alignment: Alignment.center,
                  child: Text(creator.avatar, style: const TextStyle(
                      fontSize: 28, fontWeight: FontWeight.w700, color: AppTheme.green)),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(creator.name, style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w700, color: AppTheme.ink)),
                      const SizedBox(height: 3),
                      Text(creator.handle.isEmpty ? '社媒创作者 · 无 GitHub 主号' : '@${creator.handle}',
                          style: const TextStyle(fontSize: 12, color: AppTheme.ink3)),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
            Wrap(
              spacing: 8,
              children: [
                _chip(cat.title),
                _chip('★ ${compactNumber(creator.followers)} followers'),
              ],
            ),
            const SizedBox(height: 18),
            Text(creator.tag, style: const TextStyle(
                fontSize: 14, color: AppTheme.ink2, height: 1.8)),

            if (creator.repos.isNotEmpty) ...[
              const SizedBox(height: 30),
              const Text('代表作', style: TextStyle(
                  fontSize: 15, fontWeight: FontWeight.w700, color: AppTheme.ink)),
              const SizedBox(height: 12),
              ...creator.repos.map((r) => _RepoRow(repo: r, handle: creator.handle)),
            ],

            const SizedBox(height: 30),
            const Text('主页入口', style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.w700, color: AppTheme.ink)),
            const SizedBox(height: 12),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: creator.links.map((l) => _LinkChip(link: l)).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _chip(String text) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
            color: AppTheme.sunk, borderRadius: BorderRadius.circular(5)),
        child: Text(text, style: const TextStyle(fontSize: 11, color: AppTheme.ink2)),
      );
}

class _RepoRow extends StatelessWidget {
  final RepoLink repo;
  final String handle;
  const _RepoRow({required this.repo, required this.handle});

  @override
  Widget build(BuildContext context) {
    // 仓库名已包含完整 owner/repo 时直接用，否则补上创作者 handle
    final fullName = repo.n.contains('/') ? repo.n : '$handle/${repo.n}';
    final url = 'https://github.com/$fullName';
    return InkWell(
      onTap: () => openLink(context, url),
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: AppTheme.line),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            const Icon(Icons.folder_outlined, size: 16, color: AppTheme.ink3),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(repo.n, style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w600, color: AppTheme.ink)),
                  const SizedBox(height: 2),
                  Text(repo.d, maxLines: 1, overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 10, color: AppTheme.ink3)),
                ],
              ),
            ),
            Text('★ ${compactNumber(repo.s)}',
                style: const TextStyle(fontSize: 11, color: AppTheme.key)),
          ],
        ),
      ),
    );
  }
}

class _LinkChip extends StatelessWidget {
  final LinkItem link;
  const _LinkChip({required this.link});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => openLink(context, link.u),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: AppTheme.greenSoft,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(platformIcon(link.t), size: 14, color: AppTheme.green),
            const SizedBox(width: 6),
            Text(link.t, style: const TextStyle(
                fontSize: 12, color: AppTheme.green, fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}
