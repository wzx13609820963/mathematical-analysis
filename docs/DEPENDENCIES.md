# 当前正文依赖登记表

> 3.0版目录处于章级候选定稿阶段。第一卷前三编正文已经迁移为新版第0—13章；下表记录当前实际文件、稳定标签和直接依赖。旧版章标签只作为临时兼容别名保留，不再用于新增引用。

## 3.0版目录的全书级前置约束

- 一般拓扑的基、乘积、分离、紧致、Tychonoff 定理、网和滤子前置到第二卷第36—40章；第四卷的弱拓扑和弱星拓扑可引用这些结果。
- 第78章 Banach--Alaoglu 定理采用一般乘积紧致性的证明；其直接前置至少包括第38章 Tychonoff 乘积定理、第42章局部凸拓扑和第77章 Hahn--Banach 与对偶性。若以后改用只适用于可分对偶球的度量化证明，必须明确降格为特殊版本，不得冒充一般定理。
- 第79章反射性和弱紧致性位于 Banach--Alaoglu 之后；Eberlein--Šmulian 只在已经区分拓扑紧致和序列紧致后使用。
- 第95章复分析中的 Vitali--Porter 收敛定理依赖正规族；第66章实分析中的 Vitali 收敛定理依赖一致可积性。两个定理不得共用未限定的简称或标签。
- 第50章只证明欧氏空间及参数化子流形上的 Stokes 公式和星形域 Poincaré 引理；第100章在第98章单位分解和第99章抽象微分形式之后证明流形上的一般 Stokes 定理。两层结果不得相互替代或重复完整展开。
- 第72章只建立 Lebesgue 微分定理所需的一维或最低局部极大估计；第121章系统建立 \(\mathbb R^n\) 中 Hardy--Littlewood 极大算子的弱型、强型和微分定理。后者可以引用前者的动机，但须重新证明高维系统结果。
- 第101章先建立奇异链、奇异同调、奇异上同调、同伦不变性和 Mayer--Vietoris 序列；第102章随后以积分配对和 Mayer--Vietoris 方法证明 de Rham 定理。不得在第102章调用未建立的奇异上同调语言。
- 第96章 Riemann 映射定理可引用第95章正规族和 Montel 定理；第97章调和函数与 Dirichlet 问题不再与共形映射共用同一章闭环。
- 附录A若给出选择公理、Zorn 引理和良序原理的等价性证明，须先建立序数、超限递归和 Hartogs 引理；否则必须标明哪些等价性仅陈述并给出参考文献。

“全书级前置约束”只记录宏观目录审校中已经明确、且会影响未来章序或证明版本的关键决定；不为尚未编写的149章逐章推测依赖。后面的章级表只登记已经写入或已经进入近期实施范围的直接前置与稳定标签。二者都服务于编写和校核，不代替正文证明。新增跨章依赖、移动定理或改变允许引用范围时，应从实际源文件核实并同步更新本表。

## 第一卷第一编

| 章 | 稳定标签 | 直接前置 | 主要产出 |
|---|---|---|---|
| 0 数学语言 | `chap:mathematical-language` | 无；集合存在性细节可查附录A | 量词、受限概括、映射、商集、至多可数、证明方法 |
| 1 实数系 | `chap:real-number-system` | 0 | 有理数缺口、有序域、确界公理、Archimedes 性质、稠密性与不可数性 |
| 2 Dedekind 分割 | `chap:dedekind-construction` | 0--1；集合存在性查附录A | 以分割构造完备有序域，逐项验证运算与顺序 |
| 3 Cauchy 列构造 | `chap:cauchy-construction` | 0--1 | 以有理 Cauchy 列的商集构造完备有序域 |
| 4 实数的完备性 | `chap:equivalent-completeness` | 1--3 | 确界、区间套、单调收敛、Bolzano--Weierstrass 与 Cauchy 完备性的等价链 |

## 第一卷第二编

| 章 | 稳定标签 | 直接前置 | 主要产出 |
|---|---|---|---|
| 5 数列极限 | `chap:sequence-limits` | 0--1、4 | `\varepsilon-N` 定义、误差估计、基本性质和运算法则 |
| 6 单调数列与迭代 | `chap:monotone-iteration` | 4--5 | 单调有界收敛、递推数列和局部压缩估计 |
| 7 子列与聚点 | `chap:subsequences-cluster-points` | 4--6 | 子列刻画、抽取定理、聚点与部分极限 |
| 8 上极限与下极限 | `chap:limsup-liminf` | 5、7 | 尾部确界、上下极限、子列刻画和运算不等式 |
| 9 Cauchy 数列 | `chap:cauchy-criterion` | 4--8 | 实数 Cauchy 准则、有理反例、快速子列和级数增量 |

## 第一卷第三编

| 章 | 稳定标签 | 直接前置 | 主要产出 |
|---|---|---|---|
| 10 函数极限 | `chap:function-limits` | 0、5、7、9 | `\varepsilon-\delta` 定义、局部性质、Heine 与 Cauchy 判据、各类广义极限 |
| 11 连续性 | `chap:continuity-discontinuity` | 1、10 | 连续性、间断分类、单调函数间断点、逆映射相对连续 |
| 12 闭区间上的连续函数 | `chap:continuous-functions-closed-interval` | 1、4、7、11 | 有限覆盖、极值、连通、介值和删条件反例 |
| 13 一致连续 | `chap:uniform-continuity` | 9、11--12 | Heine--Cantor、连续模、Cauchy 保持与完备化延拓 |

## 附录

| 附录 | 稳定标签 | 作用 |
|---|---|---|
| A | `chap:appendix-set-theory` | ZFC、选择原理和对象编码的按需参考 |
| B | `chap:appendix-linear-algebra` | 有限维线性代数预备 |
| C | `chap:appendix-estimates` | 常用不等式和估计索引 |
| D | `chap:appendix-counterexamples` | 按失效条件检索反例 |
| E | `chap:appendix-notation-dependencies` | 面向读者的符号与依赖索引 |
| F | `chap:appendix-algebra-complex` | 代数结构、复数与多项式预备 |
| G | `chap:appendix-history-terminology` | 历史、术语和阅读路线 |

## 当前关键无环约束

- 第11章逆映射连续性的证明不得调用第12章介值定理；它直接在像集的相对拓扑中证明。
- 第2章的域公理验证不得在乘法定义之前使用“有理数嵌入保持乘法”。
- 第1章涉及无限小数的论证只使用有限截断和确界，不预先调用级数理论。
- 第13章的延拓定理可使用第9章 Cauchy 完备性和第10章序列判据。
