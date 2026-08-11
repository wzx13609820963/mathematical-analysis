# LaTeX 书稿说明

主文件为 `main.tex`，书名为《从高等数学到数学分析：严格基础、经典理论与现代视野》。建议使用 XeLaTeX 编译：

```powershell
xelatex main.tex
xelatex main.tex
```

也可以在本目录运行：

```powershell
.\build.ps1
```

脚本会自动在 `PATH` 或 `C:\texlive` 中查找 XeLaTeX，并把稳定命名的成品复制到工作区根目录的 `output/pdf/`。

习题详细解答使用独立主文件 `solutions.tex`，可运行：

```powershell
.\build-solutions.ps1
```

需要连续编译两次以生成完整目录。当前试编本只载入第一卷第一编和第0章。

工程结构：

- `main.tex`：全书入口、卷编结构和当前载入范围；
- `frontmatter/preface.tex`：前言；
- `analysisbook.sty`：版面、定理环境、提示框和通用命令；
- `chapters/vol1/part1/chapter0.tex`：第0章正文。
- `solutions.tex`：习题解答册入口，不由教材正文默认载入；
- `solutions/vol1/part1/chapter0-solutions.tex`：第0章全部习题的详细解答。

全书正文必须遵守工作区根目录的 `教材写作规范.md`。新增章节前应先完成其中的依赖检查，交付前按单章验收清单复核。
