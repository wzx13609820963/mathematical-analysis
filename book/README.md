# LaTeX 书稿说明

主文件为 `main.tex`，书名为《从高等数学到数学分析：严格基础、经典理论与现代分析》。建议使用 LuaLaTeX 编译：

```powershell
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

需要连续编译两次以生成完整目录。当前主文件载入第一卷前三编3.0版第0—13章及附录A—G；旧版第0—19章已经按新版章界完成首轮重构。

`analysisbook` 提供两种色彩模式：

- `\usepackage[screen]{analysisbook}`：屏幕阅读版，层级标题使用低饱和深蓝绿色，目录和普通内部链接保持黑色；省略选项时采用此模式。
- `\usepackage[print]{analysisbook}`：印刷版，章、节、定理标题及内部链接按黑色处理；提示框仍保留浅色底纹和边框层次。

主文件当前使用默认的屏幕阅读模式。输出印刷版时，在主文件中为样式包加入 `print` 选项。

工程结构：

- `main.tex`：全书入口、卷编结构和当前载入范围；
- `frontmatter/preface.tex`：前言；
- `analysisbook.sty`：版面、定理环境、提示框和通用命令；
- `chapters/vol1/`：当前已载入的第一卷前三编正文；路径使用3.0版第0—13章编号。
- `solutions.tex`：习题解答册入口，不由教材正文默认载入；
- `solutions/vol1/`：当前第一卷前三编全部正式习题的详细解答；路径与3.0版正文平行。

全书正文必须遵守工作区根目录的 `教材写作规范.md`。新增章节前应先完成其中的依赖检查，交付前按单章验收清单复核。

构建产生的 `main.pdf`、`solutions.pdf` 及 `.aux`、`.log`、`.toc` 等文件属于本地可再生产物，不纳入版本管理；经过验收的稳定 PDF 才复制到 `output/pdf/`。文件被阅读器占用时，构建脚本应停止发布，不生成带 `new`、`copy` 或数字后缀的替代文件。
