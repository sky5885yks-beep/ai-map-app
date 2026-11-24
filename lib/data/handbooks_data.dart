/// AI Handbook 地图数据：站点快照 2026-11-23，自动生成
part of '../data_repository.dart';

final handbookBands = <Band>[
  Band(id: 'official', no: '01', title: '官方 / 机构出品', desc: '出版社、云厂商、框架团队写的第一手实践，权威性最高。', official: true),
  Band(id: 'community', no: '02', title: '社区体系化教程', desc: '个人或社区维护的成体系学习路径，质量差异大，看更新频率。', official: false),
  Band(id: 'engine', no: '03', title: '工程 · 推理 · Infra', desc: '从模型原理到推理引擎、容量规划与算子优化。', official: false),
  Band(id: 'security', no: '04', title: '安全 · 红队', desc: '提示注入、越狱、Agent 攻击面与防御体系。', official: false),
  Band(id: 'embodied', no: '05', title: '具身 · 语音', desc: 'VLA、世界模型、实时语音 Agent 的专门手册。', official: false),
  Band(id: 'career', no: '06', title: '求职 · 面试', desc: 'AI Engineer / FDE / 大模型算法岗的面试准备。', official: false),
];

final handbookRepos = <HandbookRepo>[
  HandbookRepo(
    fullName: 'huggingface/alignment-handbook', stars: 5720, pushedAt: '2026-09-23', license: 'Apache-2.0',
    status: 'active', band: 'official', intro: 'Hugging Face 官方模型对齐手册：SFT / DPO / ORPO 配方与 TRL 可复现代码。', note: '',
  ),
  HandbookRepo(
    fullName: 'PacktPublishing/LLM-Engineers-Handbook', stars: 5438, pushedAt: '2026-04-22', license: 'MIT',
    status: 'slow', band: 'official', intro: '《LLM Engineer\'s Handbook》配套代码：从原理到 RAG，再到部署到 AWS 的完整 LLMOps 链路。', note: '书籍配套仓库，随书更新，节奏自然放缓。',
  ),
  HandbookRepo(
    fullName: 'aliyun/ai-agent-handbook', stars: 3584, pushedAt: '2026-11-22', license: 'Apache-2.0',
    status: 'active', band: 'official', intro: '阿里云官方企业级 Agent 手册：架构、构建、运行、治理、调优的全生命周期实践，每周收录新案例。', note: '',
  ),
  HandbookRepo(
    fullName: 'huggingface/llm_training_handbook', stars: 569, pushedAt: '2026-11-19', license: '—',
    status: 'active', band: 'official', intro: 'Hugging Face 官方 LLM 训练方法论合集，偏预训练与微调的工程实践。', note: '',
  ),
  HandbookRepo(
    fullName: 'modular/llm-inference-handbook', stars: 491, pushedAt: '2026-11-20', license: 'Apache-2.0',
    status: 'active', band: 'official', intro: 'Modular（Mojo 团队）官方 LLM 推理知识库，覆盖推理基础设施与优化。', note: '',
  ),
  HandbookRepo(
    fullName: 'danielmeppiel/agentic-sdlc-handbook', stars: 176, pushedAt: '2026-06-16', license: '—',
    status: 'slow', band: 'official', intro: '微软 GBB 作者撰写的 agentic SDLC 书：15 章 225 页，分高管与实践者双视角。', note: '书籍型仓库，内容完成后更新频率低。',
  ),
  HandbookRepo(
    fullName: 'PacktPublishing/The-Machine-Learning-Solutions-Architect-Handbook', stars: 151, pushedAt: '2026-11-17', license: 'MIT',
    status: 'active', band: 'official', intro: 'Packt 书配套代码：以 ML 方案架构师视角走需求、架构到落地。', note: '',
  ),
  HandbookRepo(
    fullName: 'tweag/agentic-coding-handbook', stars: 38, pushedAt: '2026-10-28', license: 'MIT',
    status: 'active', band: 'official', intro: '工程咨询公司 Tweag 的 agentic coding 手册，偏团队落地与工程约束。', note: '',
  ),
  HandbookRepo(
    fullName: 'aisingapore/ai-practitioner-handbook', stars: 34, pushedAt: '2023-04-29', license: '—',
    status: 'stale', band: 'official', intro: '新加坡 AI Singapore 的 AI 实践手册，方法论扎实但已多年未更新。', note: '停更超过 3 年，适合看方法论，不建议作为当前工程参考。',
  ),
  HandbookRepo(
    fullName: 'SylphAI-Inc/LLM-engineer-handbook', stars: 5064, pushedAt: '2025-08-18', license: 'MIT',
    status: 'stale', band: 'community', intro: '精选 LLM 资源清单，覆盖训练、服务、微调与应用构建，社区影响力大。', note: '已停更一年以上，链接仍有价值，但工具与论文部分会过时。',
  ),
  HandbookRepo(
    fullName: 'undefined-ui/second-brain-os', stars: 1595, pushedAt: '2026-11-03', license: 'MIT',
    status: 'active', band: 'community', intro: 'AI 工程师体系课：Agent 七模块 + 五本分层 handbook（知识图谱 / loops / gates / harness / evals）。', note: '',
  ),
  HandbookRepo(
    fullName: 'DataExpert-io/ai-engineer-handbook', stars: 1261, pushedAt: '2026-11-20', license: '—',
    status: 'active', band: 'community', intro: 'AI 领域值得追的链接、书与作者清单，轻量导航型，适合建立信息源。', note: '',
  ),
  HandbookRepo(
    fullName: 'handbook-academy/engineering-handbook', stars: 943, pushedAt: '2026-10-26', license: 'CC BY-SA 4.0',
    status: 'active', band: 'community', intro: '开源工程书合集，含独立的 AI Engineering Handbook，另附系统设计与 DSA。', note: '',
  ),
  HandbookRepo(
    fullName: 'swirl-ai/ai-angineers-handbook', stars: 702, pushedAt: '2026-11-18', license: 'Apache-2.0',
    status: 'active', band: 'community', intro: 'AI Engineering 资源与从零构建 Agent 的代码，偏课程配套（仓库名 angineers 为拼写笔误）。', note: '',
  ),
  HandbookRepo(
    fullName: 'keyuchen21/agentic-engineering-handbook', stars: 596, pushedAt: '2026-11-15', license: 'MIT',
    status: 'active', band: 'community', intro: '面向生产的 Agent 学习路线：OpenAI / Claude、MCP、Harness、Evals 与生产系统。', note: '',
  ),
  HandbookRepo(
    fullName: 'oxbshw/LLM-Agents-Ecosystem-Handbook', stars: 561, pushedAt: '2026-06-30', license: 'MIT',
    status: 'slow', band: 'community', intro: '60+ 骨架代码的 Agent 生态手册，覆盖 RAG、记忆、MCP 与语音。', note: '近半年未更新，适合当代码素材库而非最新选型依据。',
  ),
  HandbookRepo(
    fullName: 'Prompthon-IO/agent-systems-handbook', stars: 315, pushedAt: '2026-11-18', license: 'NOASSERTION',
    status: 'active', band: 'community', intro: '生产级 Agent 系统工程手册：LangGraph、MCP/A2A、上下文工程、记忆、评测与可观测性。', note: '',
  ),
  HandbookRepo(
    fullName: 'genai-handbook/genai-handbook.github.io', stars: 311, pushedAt: '2026-02-02', license: '—',
    status: 'slow', band: 'community', intro: '生成式 AI 学习资源路线图，适合入门建立全局认知。', note: '近 9 个月未更新，路线图类内容时效性尚可。',
  ),
  HandbookRepo(
    fullName: 'nageoffer/ai-handbook', stars: 186, pushedAt: '2026-07-28', license: 'Apache-2.0',
    status: 'slow', band: 'community', intro: '中文「程序员转型 AI 工程师」全栈手册：基础到 RAG、Agent 实战，附高频面试题。', note: '',
  ),
  HandbookRepo(
    fullName: 'Allen-C-Guan/AI-Infra-Handbook', stars: 172, pushedAt: '2026-11-16', license: '—',
    status: 'active', band: 'engine', intro: '中文 AI Infra 系列书：模型原理 → 推理与 vLLM → AI 编译器，强调把论文、源码与现象连成一条线。', note: '',
  ),
  HandbookRepo(
    fullName: 'shtjww/llm-inference-capacity-handbook', stars: 186, pushedAt: '2026-09-20', license: 'NOASSERTION',
    status: 'active', band: 'engine', intro: '推理容量规划案头手册：给定 GPU 算力，一个模型能扛多少 QPS——三层模型、三面墙、排队论与开环压测。', note: '',
  ),
  HandbookRepo(
    fullName: 'vasilyevdm/ai-agent-handbook', stars: 155, pushedAt: '2026-03-20', license: 'MIT',
    status: 'slow', band: 'engine', intro: '读 30+ Agent 框架源码提炼的实现模式：上下文腐化、压缩、提示词装配、记忆与工具治理。', note: '单次发布后未再更新，内容为源码研读，仍需自行验证版本。',
  ),
  HandbookRepo(
    fullName: 'TensorTonic/llm-optimization-handbook', stars: 100, pushedAt: '2026-11-10', license: 'MIT',
    status: 'active', band: 'engine', intro: '把 LLM 做快做小：量化、KV cache、投机解码、GPU kernel 与 serving，带动手习题。', note: '',
  ),
  HandbookRepo(
    fullName: 'Xwh630/ai-agent-handbook', stars: 78, pushedAt: '2026-11-20', license: 'MIT',
    status: 'active', band: 'engine', intro: '31 章中文手册 + agent-handbook doctor CLI：给任意 Agent 项目做任务边界、上下文、状态、恢复、权限的能力体检。', note: '',
  ),
  HandbookRepo(
    fullName: 'sunxiaohui2025/AI-Infra-Handbook', stars: 51, pushedAt: '2026-11-22', license: '—',
    status: 'active', band: 'engine', intro: '153 讲交互式课程 + 150 个交互组件：从矩阵乘法到分布式推理，附手写迷你推理引擎与从零实现的 GPT（1342 页 PDF）。', note: '',
  ),
  HandbookRepo(
    fullName: 'h9-tec/LLM-Math-Handbook', stars: 242, pushedAt: '2026-04-26', license: '—',
    status: 'caution', band: 'engine', intro: '面向生产 LLM / RAG / Agent 的公式速查，覆盖注意力变体、位置编码、训练损失等公式族。', note: '创建当日即完成推送，广度优先、深度有限，建议只当公式索引使用。',
  ),
  HandbookRepo(
    fullName: 'Shiva108/ai-llm-red-team-handbook', stars: 349, pushedAt: '2026-11-22', license: 'CC BY-SA 4.0',
    status: 'active', band: 'security', intro: 'AI / LLM 红队实战手册：46 章课程 + 现场手册 + Python 测试框架，覆盖提示注入、Agent 威胁与 AI 合规。', note: '',
  ),
  HandbookRepo(
    fullName: 'mouteee/autonomous-offensive-llm-handbook', stars: 78, pushedAt: '2026-09-24', license: 'NOASSERTION',
    status: 'active', band: 'security', intro: '用有明确边界的步骤构建自主安全 Agent，带可运行课程、图示与证据链。', note: '',
  ),
  HandbookRepo(
    fullName: 'Xbotics-Embodied-AI-club/Xbotics-Embodied-AI-Handbook', stars: 93, pushedAt: '2026-10-21', license: 'MIT',
    status: 'active', band: 'embodied', intro: '具身智能 21 讲：Agent、VLN、世界模型，真机优先、仿真兜底。', note: '',
  ),
  HandbookRepo(
    fullName: 'zc-xzc/embodied-ai-learning-handbook', stars: 73, pushedAt: '2026-08-15', license: 'NOASSERTION',
    status: 'active', band: 'embodied', intro: '具身智能学习手册：VLA 模型、遥操作、Sim2Real 与强化学习的系统路径。', note: '',
  ),
  HandbookRepo(
    fullName: 'wananing/voice-agent-handbook', stars: 24, pushedAt: '2026-10-23', license: 'CC BY 4.0',
    status: 'active', band: 'embodied', intro: '实时语音 Agent 架构手册：四种链路形态、七个机制、28 个开源项目的实现对照与选型决策树。', note: '',
  ),
  HandbookRepo(
    fullName: 'Skyfacon/ai-interview-handbook-cn', stars: 111, pushedAt: '2026-08-13', license: '—',
    status: 'slow', band: 'career', intro: '中文大模型面试手册：144 问 + 编程题导航 + Python 手撕代码模板。', note: '',
  ),
  HandbookRepo(
    fullName: 'harrisliangsu/ai-agent-engineer-handbook', stars: 82, pushedAt: '2026-10-29', license: 'MIT',
    status: 'active', band: 'career', intro: '中英双语的 AI Agent / LLM 应用工程师面试与学习手册。', note: '',
  ),
  HandbookRepo(
    fullName: 'bicced/ai-engineer-interview-handbook', stars: 33, pushedAt: '2026-11-03', license: 'CC BY 4.0',
    status: 'active', band: 'career', intro: 'AI Engineer 与 FDE 面试手册：113 页 PDF，覆盖 LLM、RAG、Evals、系统设计与各公司面试流程。', note: '',
  ),
];
