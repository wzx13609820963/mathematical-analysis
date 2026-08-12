# 当前正文依赖登记表

本文件记录已写范围的直接前置与稳定章标签。它服务于编写和校核，不代替正文证明。新增跨章依赖、移动定理或改变允许引用范围时，应同步更新本表。

## 第一卷第一编

| 章 | 稳定标签 | 直接前置 | 主要产出 |
|---|---|---|---|
| 0 数学语言与证明基础 | `chap:mathematical-language` | 无；集合论存在性细节可查附录A | 量词、受限概括、映射、商集、至多可数、证明方法 |
| 1 有理数的结构与缺陷 | `chap:rational-defects` | 0 | 有理数序与代数结构、缺口和缺失极限 |
| 2 有序域与完备性公理 | `chap:ordered-field-completeness` | 0--1 | 有序域、确界、完备有序域工作框架 |
| 3 完备性的基本后果 | `chap:consequences-completeness` | 2 | Archimedes 性质、稠密性、表示与不可数性 |
| 4 Dedekind 分割构造 | `chap:dedekind-construction` | 0--3；集合存在性查附录A | 完备有序域的分割模型 |
| 5 Cauchy 列构造 | `chap:cauchy-construction` | 0--3 | 完备有序域的 Cauchy 等价类模型 |
| 6 完备性的等价形式 | `chap:equivalent-completeness` | 2--5 | 确界、区间套、单调收敛、BW、Cauchy 完备性的等价链 |

## 第一卷第二编

| 章 | 稳定标签 | 直接前置 | 主要产出 |
|---|---|---|---|
| 7 数列极限定义 | `chap:sequence-limit-definition` | 0、2--3 | `\varepsilon-N` 定义和量词结构 |
| 8 数列极限的误差控制 | `chap:sequence-error-control` | 7 | 定义驱动的估计方法 |
| 9 数列极限性质 | `chap:sequence-limit-properties` | 7--8 | 唯一性、有界性、保号与代数运算 |
| 10 单调与递推数列 | `chap:monotone-recursive-sequences` | 3、6--9 | 单调有界收敛、不动点型递推 |
| 11 子列与 BW | `chap:subsequences-bw` | 6--10 | 子列刻画、收敛子列、聚点 |
| 12 上下极限 | `chap:limsup-liminf` | 9、11 | `\limsup`、`\liminf` 及部分极限结构 |
| 13 Cauchy 准则 | `chap:cauchy-criterion` | 6--12 | 实数 Cauchy 收敛准则及 `\Q` 中失败 |

## 第一卷第三编

| 章 | 稳定标签 | 直接前置 | 主要产出 |
|---|---|---|---|
| 14 函数极限定义与运算 | `chap:function-limit-definition` | 0、7--9 | `\varepsilon-\delta` 定义、局部性质和运算 |
| 15 Heine 与 Cauchy 判据 | `chap:heine-cauchy` | 11、13--14 | 函数极限的序列刻画与 Cauchy 判据 |
| 16 广义函数极限 | `chap:generalized-function-limits` | 14--15 | 单侧、无穷和无穷远极限 |
| 17 连续与间断 | `chap:continuity-discontinuity` | 3、14--16 | 连续性、间断分类、单调函数跳跃、逆映射相对连续 |
| 18 实线紧致与连通 | `chap:compact-connected-real-line` | 2--3、6、17 | 有限覆盖、极值、连通、零点与介值 |
| 19 一致连续 | `chap:uniform-continuity` | 13、17--18 | Heine--Cantor、连续模、Cauchy 保持与稠密延拓 |

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

- 第17章逆映射连续性的证明不得调用第18章介值定理；它直接在像集的相对拓扑中证明。
- 第4章的 Archimedes 结论只能在该章确界性质证明之后调用第3章的推导。
- 第3章涉及无限小数的论证只使用有限部分和及其上确界，不预先调用级数理论。
- 第19章的延拓定理可使用第13章 Cauchy 完备性和第15章序列判据。
