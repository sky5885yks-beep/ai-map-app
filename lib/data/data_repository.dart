/// 数据仓库：统一对外提供两个网站的数据
/// 使用 part 把自动生成的数据文件拼进来，避免手工维护大数组。
library;

import '../models/models.dart';

part 'creators_data.dart';
part 'handbooks_data.dart';

/// 格式化数字：88380 -> 88.4k
String compactNumber(int n) {
  if (n >= 10000) return '${(n / 1000).toStringAsFixed(1)}k';
  if (n >= 1000) return '${(n / 1000).toStringAsFixed(1)}k';
  return n.toString();
}

/// 按 star 排序的仓库列表（手册页用）
List<HandbookRepo> sortedHandbookRepos() {
  final list = List<HandbookRepo>.from(handbookRepos);
  list.sort((a, b) => b.stars.compareTo(a.stars));
  return list;
}
