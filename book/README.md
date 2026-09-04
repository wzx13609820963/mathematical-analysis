# LaTeX 书稿说明

主文件为 `main.tex`，书名为《从高等数学到数学分析：严格基础、经典理论与现代分析》。建议使用 LuaLaTeX 编译：

```powershell
lualatex main.tex
lualatex main.tex
lualatex main.tex
```

也可以在本目录运行：

```powershell
.\build.ps1
```

脚本会自动在 `PATH` 或 `C:\texlive` 中查找 LuaLaTeX，并把稳定命名的成品复制到工作区根目录的 `output/pdf/`。Fandol 中文字体由 TeX Live 提供；LuaLaTeX 生成的字体子集带 ToUnicode 映射，可供 PDFium 等内置阅读器可靠显示和提取中文。

习题详细解答使用独立主文件 `solutions.tex`，可运行：

```powershell
.\build-solutions.ps1
```

构建脚本连续编译三次，以稳定目录、书签和交叉引用。当前主文件载入3.4版第0—89章及附录A—C，第一至四卷已经接入；解答册只载入正文各章习题，参考型附录不另设习题。正文另有同内容的 `analysis-vol1-4-appA-C.pdf`，它只作为解答册跨册链接的 ASCII 目标文件，避免 PDF 文件名编码造成跳转失败。

`analysisbook` 提供两种色彩模式：

- `\usepackage[screen]{analysisbook}`：屏幕阅读版，层级标题使用低饱和深蓝绿色，目录和普通内部链接保持黑色；省略选项时采用此模式。
- `\usepackage[print]{analysisbook}`：印刷版，章、节、定理标题及内部链接按黑色处理；提示框仍保留浅色底纹和边框层次。

主文件当前使用默认的屏幕阅读模式。输出印刷版时，在主文件中为样式包加入 `print` 选项。

工程结构：

- `main.tex`：全书入口、卷编结构和当前载入范围；
- `frontmatter/preface.tex`：前言；
- `analysisbook.sty`：版面、定理环境、提示框和通用命令；
- `chapters/vol1/`：第一卷第0—24章正文；
- `chapters/vol2/part6/`：第二卷第六编第25—29章正文；
- `chapters/vol2/part7/`：第二卷第七编第30—35章正文；
- `chapters/vol2/part8/`：第二卷第八编第36—42章正文；
- `chapters/vol2/part9/`：第二卷第九编第43—46章正文；
- `chapters/vol2/part10/`：第二卷第十编第47—50章正文；
- `chapters/vol2/part11/`：第二卷第十一编第51—53章正文；
- `chapters/vol3/part12/`：第三卷第十二编第54—58章正文；
- `chapters/vol3/part13/`：第三卷第十三编第59—63章正文；
- `chapters/vol3/part14/`：第三卷第十四编第64—69章正文；
- `chapters/vol3/part15/`：第三卷第十五编第70—74章正文；
- `chapters/vol4/part16/`：第四卷第十六编第75—79章正文；
- `chapters/vol4/part17/`：第四卷第十七编第80—81章正文；
- `chapters/vol4/part18/`：第四卷第十八编第82—85章正文；
- `chapters/vol4/part19/`：第四卷第十九编第86—87章正文；
- `chapters/vol4/part20/`：第四卷第二十编第88—89章正文；
- `solutions.tex`：习题解答册入口，不由教材正文默认载入；
- `solutions/vol1/` 至 `solutions/vol4/part20/`：当前第0—89章全部正式习题的详细解答；卷、编路径与正文平行。

全书正文必须遵守工作区根目录的 `教材写作规范.md`。新增章节前应先完成其中的依赖检查，交付前按单章验收清单复核。

构建产生的 `main.pdf`、`solutions.pdf` 及 `.aux`、`.log`、`.toc` 等文件属于本地可再生产物，不纳入版本管理；经过验收的稳定 PDF 才复制到 `output/pdf/`。文件被阅读器占用时，构建脚本应停止发布，不生成带 `new`、`copy` 或数字后缀的替代文件。
