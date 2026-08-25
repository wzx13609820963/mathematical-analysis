# 活术语表

本文件登记编写阶段已经采用的中英文术语。正文首次出现专业术语时仍须解释；只有在术语对照确有反复查阅价值且正文已覆盖相应主题后，才整理进读者版附录。

| 中文 | 英文 | 本书约定与禁用歧义 |
|---|---|---|
| 定义域 | domain | 映射数据的一部分 |
| 陪域 | codomain | 不写成“值域” |
| 像、像集 | image, range | `f(A)` 为 `A` 的像；整定义域的像为 `f(X)` |
| 原像 | preimage, inverse image | `f^{-1}(B)` 不要求可逆 |
| 逆映射 | inverse map | 只对双射使用 |
| 可数无限 | countably infinite | 与 `\N` 双射 |
| 至多可数 | at most countable | 有限或可数无限 |
| 上确界 | supremum | 与最大元区分；记 `\sup` |
| 下确界 | infimum | 与最小元区分；记 `\inf` |
| 完备有序域 | complete ordered field | 本卷主要指满足确界公理的有序域 |
| Cauchy 列 | Cauchy sequence | 人名保留拉丁字母；不与“基本列”混用 |
| 聚点 | accumulation point | 函数极限处使用删心邻域定义 |
| 子列 | subsequence | 指标严格递增 |
| 上极限、下极限 | limit superior, limit inferior | 分别写 `\limsup`、`\liminf` |
| 一致连续 | uniformly continuous | 与“连续函数族一致”无关 |
| 连续模 | modulus of continuity | 定义域非空；允许取 `+\infty` |
| 局部线性化 | local linearization | 一元情形写成 `f(a+h)=f(a)+Ah+o(h)`；线性主部唯一 |
| Fréchet 微分 | Fréchet differential | 第14章先给一元有限维版本；后续多元与赋范空间中推广 |
| 小 \(o\)、大 \(O\) | little-o, big-O | 必须写明趋近方式；不把等式当作普通代数恒等式 |
| Darboux 定理 | Darboux's theorem | 本书指导函数具有介值性，不简称为一般介值定理 |
| Taylor 多项式 | Taylor polynomial | 与 Taylor 级数、实解析性分开讨论 |
| Peano 余项 | Peano remainder | 记作 `o((x-a)^n)`；与 Lagrange、Cauchy、积分余项区分 |
| 实解析函数 | real-analytic function | 局部等于自己的 Taylor 级数；不等同于 \(C^\infty\) |
| 凸函数 | convex function | 定义域须为区间；“严格凸”不等同于处处二阶导数为正 |
| 上图集 | epigraph | 记作 \(\operatorname{epi}f\)；函数凸当且仅当其上图集为凸集 |
| 次梯度 | subgradient | 一维凸函数在内点的全体次梯度构成 `\partial f(x)` |
| 凸共轭 | convex conjugate | 记作 \(f^*\)，允许取扩充实值；亦称 Legendre--Fenchel 共轭 |
| 凸双共轭 | convex biconjugate | 记作 \(f^{**}\)；当前正文证明有限值整轴凸函数的双共轭公式 |
| Fenchel--Young 不等式 | Fenchel--Young inequality | 等号条件以次梯度表述 |
| 紧致 | compact | 当前实线章节先以有限覆盖性质出现，后续度量空间中给一般定义 |
| 单位分解 | partition of unity | 流形部分统一采用此译名，不使用“分割统一” |
| Vitali 收敛定理 | Vitali convergence theorem | 实分析中指依测度收敛加一致可积性推出 \(L^1\) 收敛的定理 |
| Vitali--Porter 收敛定理 | Vitali--Porter theorem | 复分析中指正规族背景下由具有聚点的点集上的收敛推出局部一致收敛；不得简称为上一条 |
| Tychonoff 乘积定理 | Tychonoff product theorem | 正文须说明采用任意乘积、紧 Hausdorff 乘积或其他版本，以及相应选择原则 |
| Euclidean 空间 | Euclidean space | 中文统一写“欧氏空间”；英文不写“Euclid 空间” |

## 风格约定

- “真值域”不作为 `range` 的译名；需要强调像时写“像集”。
- “可数”不作为正式分类词单独使用。
- 同一定理的不同版本在名称后写明空间或假设，不用名称相同掩盖条件差异。
- 外文人名的连字符、重音符号和大小写以通行数学写法为准，如 Bolzano--Weierstrass、Heine--Cantor、Arzelà--Ascoli。
