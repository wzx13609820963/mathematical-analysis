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
| 实解析函数 | real-analytic function | 在每一点的某邻域等于收敛幂级数，系数由 Taylor 公式唯一确定；不等同于 \(C^\infty\) |
| 凸函数 | convex function | 定义域须为区间；“严格凸”不等同于处处二阶导数为正 |
| 上图集 | epigraph | 记作 \(\operatorname{epi}f\)；函数凸当且仅当其上图集为凸集 |
| 次梯度 | subgradient | 一维凸函数在内点的全体次梯度构成 `\partial f(x)` |
| 凸共轭 | convex conjugate | 记作 \(f^*\)，允许取扩充实值；亦称 Legendre--Fenchel 共轭 |
| 凸双共轭 | convex biconjugate | 记作 \(f^{**}\)；当前正文证明有限值整轴凸函数的双共轭公式 |
| Fenchel--Young 不等式 | Fenchel--Young inequality | 等号条件以次梯度表述 |
| 标记分割 | tagged partition | 区间分割连同每个子区间内所选标记点；Riemann 和依赖两部分数据 |
| Riemann 积分 | Riemann integral | 以所有充分细的标记分割的 Riemann 和具有同一极限定义 |
| Darboux 上和、下和 | upper and lower Darboux sums | 由子区间上的上确界、下确界定义；与标记 Riemann 和区分 |
| 反常积分 | improper integral | 由端点或无穷远处的单侧极限定义；多个奇点必须分别收敛 |
| Cauchy 主值 | Cauchy principal value | 对称截断产生的极限，不等同于通常反常积分的收敛 |
| 绝对收敛 | absolute convergence | 对级数指 `\sum|a_n|` 收敛；对反常积分指 `\int|f|` 收敛 |
| 条件收敛 | conditional convergence | 原级数或反常积分收敛而绝对值版本发散 |
| Abel 变换 | Abel transformation / summation by parts | 有限和恒等式；与 Abel 判别法区分 |
| Abel 判别法 | Abel's test | 以单调有界因子和已收敛级数判定收敛；不简称为 Abel 变换 |
| Pringsheim 收敛 | Pringsheim convergence | 二重级数矩形部分和在两个指标独立趋于无穷时收敛 |
| 正则收敛（二重级数） | regular convergence | 任一有限矩形只要沿至少一个坐标方向进入尾部，其矩形和就一致趋于零；不要与函数列的正则收敛混用 |
| Cauchy 乘积 | Cauchy product | 系数为离散卷积 `c_n=\sum_{k=0}^n a_kb_{n-k}`；不等于逐项乘积 |
| Mertens 定理 | Mertens' theorem | 当前指一个级数绝对收敛、另一个级数收敛时 Cauchy 乘积收敛且和为乘积 |
| 无穷乘积 | infinite product | 当前约定“收敛”指部分积趋于非零有限值；部分积趋于零称为发散到零 |
| 逐点收敛 | pointwise convergence | 对每个固定自变量分别收敛；尾部指标允许依赖该点 |
| 一致收敛 | uniform convergence | 同一尾部指标控制指定定义域内所有点；等价于上确界误差趋零 |
| 局部一致收敛 | locally uniform convergence | 当前一维版本指在开区间的每个紧子区间上一致收敛 |
| 上确界范数 | supremum norm / uniform norm | 记作 \(\norm{f}_\infty\)；定义在有界函数空间上 |
| 一致 Cauchy 条件 | uniform Cauchy condition | 两个尾部指标和所有自变量由同一个阈值控制 |
| Weierstrass M-判别法 | Weierstrass M-test | 用可和的数项上界控制函数项级数；是充分条件，不是必要条件 |
| 一致 Dirichlet 判别 | uniform Dirichlet test | 部分和一致有界、单调因子一致趋零时推出函数项级数一致收敛 |
| 收敛半径 | radius of convergence | 幂级数在半径内部绝对收敛、外部发散；端点另行判断 |
| Cauchy--Hadamard 公式 | Cauchy--Hadamard formula | 以系数根值上极限计算幂级数收敛半径 |
| Abel 径向极限定理 | Abel's radial limit theorem | 端点级数收敛时，幂级数和沿区间内侧趋于端点和；与 Abel 判别区分 |
| 零点的阶 | order of a zero | 解析函数展开中首个非零系数的次数 |
| 恒等原理（实解析） | identity theorem for real-analytic functions | 连通区间上零点有内聚点即恒为零；不适用于一般 \(C^\infty\) 函数 |
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
