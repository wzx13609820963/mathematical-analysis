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
| Fréchet 微分 | Fréchet derivative / differential | 第14章先给一元版本，第43章推广到有限维多元映射；由同一个线性映射在所有方向上给出一阶一致近似，坐标矩阵为 Jacobian |
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
| 紧致 | compact | 以有限子覆盖性质定义；在欧氏空间中等价于闭且有界，在度量空间中等价于序列紧致，也等价于完备且全有界 |
| 单位分解 | partition of unity | 流形部分统一采用此译名，不使用“分割统一” |
| Vitali 收敛定理 | Vitali convergence theorem | 实分析中指依测度收敛加一致可积性推出 \(L^1\) 收敛的定理 |
| Vitali--Porter 收敛定理 | Vitali--Porter theorem | 复分析中指正规族背景下由具有聚点的点集上的收敛推出局部一致收敛；不得简称为上一条 |
| Tychonoff 乘积定理 | Tychonoff product theorem | 正文须说明采用任意乘积、紧 Hausdorff 乘积或其他版本，以及相应选择原则 |
| Euclidean 空间 | Euclidean space | 中文统一写“欧氏空间”；英文不写“Euclid 空间” |
| 拓扑等价度量 | topologically equivalent metrics | 生成同一拓扑；不自动保持 Cauchy 性或完备性 |
| 一致等价度量 | uniformly equivalent metrics | 两个恒等映射均一致连续；保持 Cauchy 性和完备性 |
| 序列紧致 | sequential compactness | 每个序列都有收敛子列；在度量空间中等价于开覆盖紧致，在一般拓扑空间中不可混同 |
| 全有界 | totally bounded | 对每个正半径都有有限球覆盖；不得简称为“有界” |
| 完备化 | completion | 原空间等距或一致嵌入为稠密子空间的完备空间，并按相应意义唯一 |
| 连通分支 | connected component | 含给定点的极大连通子集；总是闭，但未必开 |
| 道路分支 | path component | 含给定点的极大道路连通子集；未必闭，也未必与连通分支相同 |
| 商映射 | quotient map | 满射 \(q:X\to Y\) 满足 \(U\subseteq Y\) 开当且仅当 \(q^{-1}(U)\) 开 |
| 拓扑基、子基 | basis, subbasis | 基元素直接生成开集；子基先取有限交再取任意并 |
| 第一可数、第二可数 | first countable, second countable | 前者要求每点有可数邻域基，后者要求全空间有可数拓扑基 |
| 正则、完全正则、正规 | regular, completely regular, normal | 本书把相应 \(T_1\) 条件写入定义；引用外文资料时须核对约定 |
| 一点紧化 | one-point compactification | 局部紧 Hausdorff 空间增加一个无穷远点所得的紧 Hausdorff 空间 |
| Stone--Čech 紧致化 | Stone--Čech compactification | 完全正则 Hausdorff 空间的最大紧 Hausdorff 紧致化，以紧目标延拓泛性质刻画 |
| 网、子网 | net, subnet | 网以非空有向集为指标；本书只要求子网的指标映射最终共尾，不另要求保序；不等同于抽取子序列 |
| 滤子、滤子基、超滤子 | filter, filter base, ultrafilter | 滤子不含空集并向上封闭、对有限交封闭；超滤子是极大真滤子 |
| 一致空间 | uniform space | 由对角线邻域族同时控制所有点对；其诱导拓扑只保留局部信息 |
| Cauchy 滤子、Cauchy 网 | Cauchy filter, Cauchy net | 用一致结构中的周围控制尾部点对；一般一致空间中不得只用序列替代 |
| 拓扑群 | topological group | 带有 Hausdorff 拓扑且乘法与求逆连续的群；本书把 Hausdorff 性写入约定，左、右一致结构一般不必相同 |
| 拓扑向量空间 | topological vector space | 带有 Hausdorff 拓扑且向量加法、标量乘法连续的向量空间；默认底域为 \(\R\) 或 \(\C\) |
| 半范数 | seminorm | 满足齐次性和三角不等式，允许非零向量取值为零 |
| 局部凸空间 | locally convex space | 具有凸零邻域基的 Hausdorff 拓扑向量空间；等价地由分离点的半范数族生成 |
| Fréchet 空间 | Fréchet space | 完备、可度量的局部凸空间；不等同于一般 Banach 空间，也不要求由单个范数给拓扑 |
| 弱拓扑、弱星拓扑 | weak topology, weak-star topology | 分别写 \(\sigma(E,E')\)、\(\sigma(E',E)\)；必须注明所用对偶配对 |
| Minkowski 泛函 | Minkowski functional / gauge | 由吸收集定义；对绝对凸集给出半范数，未必是范数 |
| 方向导数 | directional derivative | 只沿固定方向取差商极限；所有方向导数存在仍不必推出 Fréchet 可微 |
| Hessian | Hessian matrix | 实值函数二阶微分在标准基下的矩阵；不译作一般“二阶导数矩阵”后省略条件 |
| Schwarz 定理 | Schwarz theorem / Clairaut theorem | 当前指适当连续性条件下混合偏导可交换；与复分析中的 Schwarz 引理区分 |
| 逆函数定理 | inverse function theorem | 导数为线性同构推出局部 (C^1) 可逆；不单独保证整体单射或满射 |
| 隐函数定理 | implicit function theorem | 指定变量方向的偏微分可逆时，水平集局部成为另一组变量的函数图像 |
| 正则值、正则水平集 | regular value, regular level set | 水平集上导数满射；其切空间为导数的核 |
| 常秩定理 | constant rank theorem | 导数秩在邻域中恒定时给出局部投影正规形；只在基点秩为 (r) 不足够 |
| Lagrange 乘子 | Lagrange multiplier | 正则等式约束极值的一阶必要条件；乘子方程的解仍须判定 |
| 约束资格条件 | constraint qualification | 保证可行集一阶几何能由约束梯度表达的条件；当前主要采用 LICQ |
| LICQ | linear independence constraint qualification | 等式约束梯度与全部活跃不等式约束梯度线性无关 |
| KKT 条件 | Karush--Kuhn--Tucker conditions | 包括原可行性、对偶可行性、驻点条件与互补松弛；本书不等式统一写成 (g_i\le0) |
| 互补松弛 | complementary slackness | `\mu_i g_i(a)=0`；非活跃约束的乘子必须为零 |
| Jordan 零测集 | Jordan null set | 可由总体积任意小的有限矩形族覆盖；与允许可数覆盖的 Lebesgue 零测集区分 |
| Jordan 可测集 | Jordan measurable set | 本书定义为边界是 Jordan 零测集的有界集合；其指标函数恰好 Riemann 可积 |
| 多重积分变量代换 | change of variables for multiple integrals | 当前证明有限分片的 (C^1) 微分同胚版本；普通体积使用 Jacobian 绝对值 |
| 第一型、第二型曲线积分 | scalar and vector line integrals | 正文也写“标量曲线积分”“向量曲线积分”；第二型依赖曲线方向 |
| 第一型、第二型曲面积分 | scalar surface integral and flux integral | 正文优先写“标量曲面积分”“通量”；通量依赖曲面定向 |
| 微分形式 | differential form | 当前只在 Euclidean 开集及参数化子流形上建立；抽象流形版本后置 |
| 外微分 | exterior derivative | 记作 (d)，满足分次 Leibniz 公式和 (d^2=0)，并与拉回交换 |
| 闭形式、恰当形式 | closed form, exact form | 分别满足 (d\omega=0) 和 (\omega=d\eta)；恰当必闭，反向需定义域条件 |
| Poincaré 引理 | Poincaré lemma | 当前版本断言星形域上的正次数闭形式恰当；不得用于任意穿孔开集 |
| Banach 空间 | Banach space | 完备赋范线性空间；第51章的 (C(K)) 是首个系统研究的函数空间实例 |
| 有界线性算子 | bounded linear operator | 线性算子满足统一范数估计；在线性映射情形与连续性等价 |
| 等度连续 | equicontinuous | 连续性中的邻域或 (delta) 对函数族全体共同有效；不得与各函数分别连续混同 |
| 相对紧致 | relatively compact | 集合的闭包紧致；在 (C(K)) 中由 Arzelà--Ascoli 定理刻画 |
| Arzelà--Ascoli 定理 | Arzelà--Ascoli theorem | 当前版本针对紧致度量定义域和有限维值域，以等度连续及逐点相对紧刻画函数族相对紧致性 |
| Bernstein 多项式 | Bernstein polynomial | 以非负二项权重对采样值作凸组合，给出 Weierstrass 逼近的构造性证明 |
| Stone--Weierstrass 定理 | Stone--Weierstrass theorem | 实版本要求含常数并分离点；复版本还要求对共轭封闭 |

## 风格约定

- “真值域”不作为 `range` 的译名；需要强调像时写“像集”。
- “可数”不作为正式分类词单独使用。
- 同一定理的不同版本在名称后写明空间或假设，不用名称相同掩盖条件差异。
- 外文人名的连字符、重音符号和大小写以通行数学写法为准，如 Bolzano--Weierstrass、Heine--Cantor、Arzelà--Ascoli。
