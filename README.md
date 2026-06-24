# 湘潭大学博士学位论文

何亮（Liang He）湘潭大学数学与计算科学学院博士学位论文 LaTeX 源码。

研究方向：拓扑优化（Topology Optimization）、有限元方法（FEM）。

## 目录结构

| 目录 | 说明 |
| --- | --- |
| `thesis/` | 正式版终稿（送审 / 最终定稿） |
| `thesis-anonymous/` | 盲审版终稿（隐去作者及单位信息） |
| `archive/` | 早期版本与答辩材料归档（见下表） |

`archive/` 内容：

| 目录 | 说明 |
| --- | --- |
| `archive/brightThesis/` | 论文早期版本 v1 |
| `archive/brightThesis2/` | 论文早期版本 v2 |
| `archive/brightThesis_anonymous/` | 早期盲审版 |
| `archive/brightSilde/` | 答辩幻灯片（Beamer） |
| `archive/brightSlide2/` | 答辩幻灯片（修订版） |

终稿目录是一个自包含的 LaTeX 工程，结构如下：

```
brightPhD.tex          # 主文件
body/                  # 各章正文
preface/               # 摘要、致谢等前置内容
reference/             # 参考文献
figures/               # 插图
drawio/                # drawio 源图
xtuformat.sty          # 湘潭大学学位论文格式宏包
slashbox.sty           # 表格斜线宏包
Makefile               # 编译脚本
```

## 编译

需要 XeLaTeX + BibTeX 环境（推荐 TeX Live / CTeX）。

```bash
cd thesis        # 或 thesis-anonymous
make             # 等价于 xelatex → bibtex → xelatex × 2
make view        # 查看生成的 PDF
make clean       # 清理编译临时文件
make cleanall    # 连同 PDF 一并清理
```

LaTeX 编译临时文件（`*.aux`/`*.log` 等）已在 `.gitignore` 中忽略；编译好的 PDF 与 figures 矢量图均纳入版本控制。

## 版本管理

终稿存于 `thesis/` 与 `thesis-anonymous/`；早期版本与答辩材料完整归档于 `archive/`。

## 致谢

格式模板基于湘潭大学数学院校友提供的 `xtuformat.sty` 改写。
