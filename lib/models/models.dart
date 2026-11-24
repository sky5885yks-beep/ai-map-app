/// 数据模型定义
/// 所有字段都来自两个网站 2026-11-23 的快照数据。

/// 创作者分类（教程科普 / 工具与创作 / ...）
class Category {
  final String id;
  final String no;
  final String title;
  final String desc;

  const Category({
    required this.id,
    required this.no,
    required this.title,
    required this.desc,
  });
}

/// 创作者的一个代表作仓库
class RepoLink {
  final String n; // 仓库名
  final int s; // star 数
  final String d; // 简介

  const RepoLink({required this.n, required this.s, required this.d});
}

/// 创作者的一个外部主页入口（GitHub / 博客 / B站 / X / 公众号）
class LinkItem {
  final String t; // 平台名
  final String u; // 网址

  const LinkItem({required this.t, required this.u});
}

/// 一位创作者
class Creator {
  final String id;
  final String name;
  final String handle;
  final int followers;
  final String cat; // 所属分类 id
  final String avatar; // 头像文字（首字）
  final String tag; // 一句话简介
  final List<String> plat; // 平台标签
  final List<RepoLink> repos;
  final List<LinkItem> links;

  const Creator({
    required this.id,
    required this.name,
    required this.handle,
    required this.followers,
    required this.cat,
    required this.avatar,
    required this.tag,
    required this.plat,
    required this.repos,
    required this.links,
  });
}

/// 手册分区（官方出品 / 社区教程 / ...）
class Band {
  final String id;
  final String no;
  final String title;
  final String desc;
  final bool official;

  const Band({
    required this.id,
    required this.no,
    required this.title,
    required this.desc,
    required this.official,
  });
}

/// 一个手册仓库
class HandbookRepo {
  final String fullName; // owner/repo
  final int stars;
  final String pushedAt;
  final String license;
  final String status; // active / slow
  final String band; // 所属分区 id
  final String intro;
  final String note;

  const HandbookRepo({
    required this.fullName,
    required this.stars,
    required this.pushedAt,
    required this.license,
    required this.status,
    required this.band,
    required this.intro,
    required this.note,
  });

  String get name => fullName.split('/').last;
  String get owner => fullName.split('/').first;
  String get url => 'https://github.com/$fullName';
  bool get isOfficial => band == 'official';
}
