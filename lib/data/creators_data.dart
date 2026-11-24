/// 创作者地图数据：站点快照 2026-11-23，自动生成
part of '../data_repository.dart';

final creatorCategories = <Category>[
  Category(id: 'tutorial', no: '01', title: '教程科普', desc: '系统课、逐段精读与概念科普，适合打基础。'),
  Category(id: 'tools', no: '02', title: '工具与创作', desc: '做 Skill、做产品、做工作流，能直接拿来用。'),
  Category(id: 'prompt', no: '03', title: 'Prompt 方法论', desc: '结构化提示词与可复用的写作框架。'),
  Category(id: 'community', no: '04', title: '社区与平台', desc: '聚合型社区和项目发现入口，覆盖人数最多。'),
  Category(id: 'general', no: '05', title: '开发与综合', desc: '受众更广的技术博主，AI 只是其中一部分。'),
];

final creators = <Creator>[
  Creator(
    id: 'datawhalechina', name: 'Datawhale', handle: 'datawhalechina', followers: 35360, cat: 'community', avatar: 'D',
    tag: '国内最大的开源 AI 学习社区，教材与课程全部开源。', plat: ['公众号', '社区', 'GitHub'], repos: [RepoLink(n: 'hello-agents', s: 87645, d: '《从零开始构建智能体》原理与实践教程'), RepoLink(n: 'happy-llm', s: 35052, d: '《从零开始构建大模型》'), RepoLink(n: 'self-llm', s: 32839, d: '开源大模型食用指南')], links: [LinkItem(t: 'GitHub', u: 'https://github.com/datawhalechina'), LinkItem(t: '官网', u: 'https://datawhale.cn'), LinkItem(t: '公众号', u: 'https://weixin.sogou.com/weixin?type=1&query=Datawhale')],
  ),
  Creator(
    id: '521xueweihan', name: '削微寒', handle: '521xueweihan', followers: 14131, cat: 'community', avatar: '削',
    tag: 'HelloGitHub 月刊创始人，中文圈最稳定的开源项目发现入口。', plat: ['月刊', '网站', 'GitHub'], repos: [RepoLink(n: 'HelloGitHub', s: 190614, d: '分享 GitHub 上有趣、入门级的开源项目'), RepoLink(n: 'GitHub520', s: 30358, d: '解决 GitHub 访问图片加载慢的问题'), RepoLink(n: 'img5', s: 2, d: '图片资源仓库')], links: [LinkItem(t: 'GitHub', u: 'https://github.com/521xueweihan'), LinkItem(t: '官网', u: 'https://hellogithub.com')],
  ),
  Creator(
    id: 'fengdu78', name: '黄海广', handle: 'fengdu78', followers: 13883, cat: 'tutorial', avatar: '黄',
    tag: '公众号「机器学习初学者」，把吴恩达课程整理成中文笔记，影响了一代入门者。', plat: ['公众号', '知乎'], repos: [RepoLink(n: 'Coursera-ML-AndrewNg-Notes', s: 38150, d: '吴恩达机器学习课程个人笔记'), RepoLink(n: 'deeplearning_ai_books', s: 21269, d: 'deeplearning.ai 课程笔记及资源'), RepoLink(n: 'WZU-machine-learning-course', s: 2094, d: '温州大学《机器学习》课程资料')], links: [LinkItem(t: 'GitHub', u: 'https://github.com/fengdu78'), LinkItem(t: '博客', u: 'http://www.ai-start.com'), LinkItem(t: '公众号', u: 'https://weixin.sogou.com/weixin?type=1&query=%E9%BB%84%E6%B5%B7%E5%B9%BF')],
  ),
  Creator(
    id: 'MorvanZhou', name: '莫烦', handle: 'MorvanZhou', followers: 21679, cat: 'tutorial', avatar: '莫',
    tag: '莫烦Python，机器学习与强化学习的视频教程体系，代码即课件。', plat: ['B站', 'YouTube'], repos: [RepoLink(n: 'tutorials', s: 13110, d: '机器学习相关教程'), RepoLink(n: 'Reinforcement-learning-with-tensorflow', s: 9529, d: '强化学习教程代码'), RepoLink(n: 'agentup', s: 23, d: '像用微信一样用 AI agents 团队')], links: [LinkItem(t: 'GitHub', u: 'https://github.com/MorvanZhou'), LinkItem(t: '官网', u: 'https://mofanx.com')],
  ),
  Creator(
    id: 'mli', name: '李沐', handle: 'mli', followers: 23932, cat: 'tutorial', avatar: '李',
    tag: '《动手学深度学习》作者，论文逐段精读，中文 AI 教育影响力最大的研究者之一。', plat: ['B站', '课程'], repos: [RepoLink(n: 'paper-reading', s: 34144, d: '深度学习经典与新论文逐段精读'), RepoLink(n: 'autocut', s: 7846, d: '用文本编辑器剪视频'), RepoLink(n: 'transformers-benchmarks', s: 912, d: 'Transformer 实测算力')], links: [LinkItem(t: 'GitHub', u: 'https://github.com/mli')],
  ),
  Creator(
    id: 'bojone', name: '苏剑林', handle: 'bojone', followers: 12907, cat: 'tutorial', avatar: '苏',
    tag: '科学空间博主，中文 NLP 圈最硬核的推导派，注意力机制与位置编码的原创改进。', plat: ['博客', '知乎'], repos: [RepoLink(n: 'bert4keras', s: 5412, d: 'Keras 版 Transformer 实现'), RepoLink(n: 'attention', s: 1447, d: '若干注意力机制实现'), RepoLink(n: 'heronian-square-search', s: 4, d: '数学问题搜索脚本')], links: [LinkItem(t: 'GitHub', u: 'https://github.com/bojone'), LinkItem(t: '博客', u: 'https://kexue.fm')],
  ),
  Creator(
    id: 'wshuyi', name: '王树义', handle: 'wshuyi', followers: 1210, cat: 'tutorial', avatar: '王',
    tag: '公众号「玉树芝兰」，把 AI 工具、知识管理与学术工作流讲成可执行步骤。', plat: ['公众号', '知乎'], repos: [RepoLink(n: 'demo-notion-markdown-exporter', s: 421, d: 'Notion 导出 Markdown 示例'), RepoLink(n: 'demo-chinese-text-binary-classification-with-bert', s: 368, d: 'BERT 中文二分类示例'), RepoLink(n: 'zettel-builder', s: 64, d: '自下而上的卡片笔记 Skill')], links: [LinkItem(t: 'GitHub', u: 'https://github.com/wshuyi'), LinkItem(t: '公众号', u: 'https://weixin.sogou.com/weixin?type=1&query=%E7%8E%8B%E6%A0%91%E4%B9%89')],
  ),
  Creator(
    id: 'karminski', name: 'Karminski-牙医', handle: 'karminski', followers: 2038, cat: 'tutorial', avatar: '牙',
    tag: '技术科普作者，一篇文章讲透一个前沿概念，偏原理而非调包。', plat: ['X', '博客'], repos: [RepoLink(n: 'one-small-step', s: 7006, d: '简单技术科普教程，解释前沿概念与原理'), RepoLink(n: 'claude-code-guide-study', s: 600, d: 'Claude Code 源码阅读笔记'), RepoLink(n: 'pineapple', s: 256, d: '手写递归下降解释器的编程语言 demo')], links: [LinkItem(t: 'GitHub', u: 'https://github.com/karminski')],
  ),
  Creator(
    id: 'alchaincyf', name: '花叔', handle: 'alchaincyf', followers: 13436, cat: 'tools', avatar: '花',
    tag: '「橙皮书」系列作者，用 AI 重建第二大脑，把 Agent Skills 做成可交付产品。', plat: ['B站', '公众号', 'X'], repos: [RepoLink(n: 'nuwa-skill', s: 38830, d: '蒸馏任何人的思维方式：心智模型、决策启发式、表达 DNA'), RepoLink(n: 'huashu-design', s: 30479, d: '在 agent 里一句话拿回可交付的设计'), RepoLink(n: 'obsidian-ai-orange-book', s: 1513, d: 'Obsidian + Claude Code：用 AI 重建第二大脑')], links: [LinkItem(t: 'GitHub', u: 'https://github.com/alchaincyf'), LinkItem(t: 'B站', u: 'https://space.bilibili.com/14097567'), LinkItem(t: 'X', u: 'https://x.com/AlchainHust'), LinkItem(t: '官网', u: 'https://huasheng.ai'), LinkItem(t: '公众号', u: 'https://weixin.sogou.com/weixin?type=1&query=%E8%8A%B1%E5%8F%94')],
  ),
  Creator(
    id: 'op7418', name: '歸藏', handle: 'op7418', followers: 5695, cat: 'tools', avatar: '歸',
    tag: '产品设计师，AI 生成 PPT、社交卡片等 Skill 的主要作者，偏设计交付。', plat: ['X', '公众号'], repos: [RepoLink(n: 'guizang-ppt-skill', s: 30273, d: '生成精美 HTML 幻灯片的 agent Skill'), RepoLink(n: 'Humanizer-zh', s: 23569, d: '消除文本 AI 味的 Claude Code Skill 汉化版'), RepoLink(n: 'guizang-social-card-skill', s: 8228, d: '生成小红书社交卡片的 Skill')], links: [LinkItem(t: 'GitHub', u: 'https://github.com/op7418'), LinkItem(t: 'X', u: 'https://x.com/op7418'), LinkItem(t: '公众号', u: 'https://weixin.sogou.com/weixin?type=1&query=%E6%AD%B8%E8%97%8F')],
  ),
  Creator(
    id: 'KKKKhazix', name: '数字生命卡兹克', handle: 'KKKKhazix', followers: 5292, cat: 'tools', avatar: '卡',
    tag: 'AI 自媒体里少见的工程派：Skills 合集、自动热点站、后台 Agent 循环。', plat: ['公众号', 'X'], repos: [RepoLink(n: 'khazix-skills', s: 22464, d: '卡兹克开源的 AI Skills 合集'), RepoLink(n: 'AIHOT', s: 11249, d: '自己找热点、自己写日报的网站框架'), RepoLink(n: 'agent-autoloop', s: 6313, d: '让命令行 Agent 在后台自己接活跟进')], links: [LinkItem(t: 'GitHub', u: 'https://github.com/KKKKhazix'), LinkItem(t: '公众号', u: 'https://weixin.sogou.com/weixin?type=1&query=%E6%95%B0%E5%AD%97%E7%94%9F%E5%91%BD%E5%8D%A1%E5%85%B9%E5%85%8B')],
  ),
  Creator(
    id: 'lijigang', name: '李继刚', handle: 'lijigang', followers: 3270, cat: 'prompt', avatar: '李',
    tag: '中文 Prompt 圈代表人物，用结构化写法把模型能力压到具体任务上。', plat: ['X', '公众号'], repos: [RepoLink(n: 'ljg-skills', s: 7761, d: '个人 Skills 合集'), RepoLink(n: 'prompts', s: 838, d: '结构化 Prompts，用于各种大语言模型'), RepoLink(n: 'supervim', s: 2, d: 'macOS 全键盘控制')], links: [LinkItem(t: 'GitHub', u: 'https://github.com/lijigang'), LinkItem(t: '博客', u: 'http://www.lijigang.com'), LinkItem(t: '公众号', u: 'https://weixin.sogou.com/weixin?type=1&query=%E6%9D%8E%E7%BB%A7%E5%88%9A')],
  ),
  Creator(
    id: 'langgptai', name: '云中江树', handle: 'langgptai', followers: 649, cat: 'prompt', avatar: '云',
    tag: '结构化 Prompt 框架 LangGPT 作者，把提示词工程写成了可复用的模板语言。', plat: ['公众号', 'GitHub'], repos: [RepoLink(n: 'LangGPT', s: 12728, d: '让每个人都能写出高质量提示词的结构化框架'), RepoLink(n: 'wonderful-prompts', s: 6394, d: '中文 Prompt 精选与 ChatGPT 使用指南'), RepoLink(n: 'PromptVer', s: 4, d: '提示词的语义化版本管理')], links: [LinkItem(t: 'GitHub', u: 'https://github.com/langgptai'), LinkItem(t: '公众号', u: 'https://weixin.sogou.com/weixin?type=1&query=%E4%BA%91%E4%B8%AD%E6%B1%9F%E6%A0%91')],
  ),
  Creator(
    id: 'liyupi', name: '程序员鱼皮', handle: 'liyupi', followers: 25056, cat: 'general', avatar: '鱼',
    tag: 'B站百万粉全栈博主，AI 资源大全与 Vibe Coding 教程，偏应用与求职。', plat: ['B站', '公众号'], repos: [RepoLink(n: 'ai-guide', s: 22312, d: 'AI 资源大全 + Vibe Coding 零基础教程'), RepoLink(n: 'codefather', s: 9087, d: '编程学习路线图与宝典'), RepoLink(n: 'Awesome-MCP-ZH', s: 0, d: 'MCP 中文资源精选')], links: [LinkItem(t: 'GitHub', u: 'https://github.com/liyupi'), LinkItem(t: '博客', u: 'https://www.codefather.cn'), LinkItem(t: 'X', u: 'https://x.com/yupi996'), LinkItem(t: '公众号', u: 'https://weixin.sogou.com/weixin?type=1&query=%E7%A8%8B%E5%BA%8F%E5%91%98%E9%B1%BC%E7%9A%AE')],
  ),
  Creator(
    id: 'ruanyf', name: '阮一峰', handle: 'ruanyf', followers: 88120, cat: 'general', avatar: '阮',
    tag: '科技爱好者周刊作者，中文技术写作的长青树，AI 内容占比逐年上升。', plat: ['博客', '周刊'], repos: [RepoLink(n: 'weekly', s: 108564, d: '科技爱好者周刊，每周五发布'), RepoLink(n: 'es6tutorial', s: 21410, d: '《ECMAScript 6 入门》开源教程'), RepoLink(n: 'seed-westlake', s: 26, d: '互动式 3D 西湖地图')], links: [LinkItem(t: 'GitHub', u: 'https://github.com/ruanyf'), LinkItem(t: '博客', u: 'https://www.ruanyifeng.com'), LinkItem(t: 'X', u: 'https://x.com/ruanyf')],
  ),
  Creator(
    id: 'Germey', name: '崔庆才', handle: 'Germey', followers: 7844, cat: 'general', avatar: '崔',
    tag: '爬虫领域知名作者，近年转向 AI 应用与 MCP 工具链，AI 属性相对偏弱。', plat: ['博客', '公众号'], repos: [RepoLink(n: 'AwesomeWebScraping', s: 266, d: '爬虫库、工具与 API 清单'), RepoLink(n: 'LaravelGeetest', s: 156, d: 'Laravel 极验验证码组件'), RepoLink(n: 'awesome-mcp-servers', s: 1, d: 'MCP servers 合集')], links: [LinkItem(t: 'GitHub', u: 'https://github.com/Germey'), LinkItem(t: '博客', u: 'https://www.cuiqingcai.com'), LinkItem(t: 'X', u: 'https://x.com/GermeyAce'), LinkItem(t: '公众号', u: 'https://weixin.sogou.com/weixin?type=1&query=%E5%B4%94%E5%BA%86%E6%89%8D')],
  ),
];
