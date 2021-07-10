LATEX=platex
BIBTEX=pbibtex
# BIBTEX=pbibtex			# pbibtex が無い時は、jbibtex
DVIPDF=dvipdfmx
RM=rm

all: sample-rejume.pdf sample-thesis.pdf tebiki1-b4.pdf tebiki2-b4.pdf tebiki3-b4.pdf

.SUFFIXES: .tex .pdf

# 論文は BibTeX が必要
sample-thesis.pdf: sample-thesis.tex define.tex
	$(LATEX) $*
	$(BIBTEX) $*
	$(LATEX) $*
	$(LATEX) $*
	$(DVIPDF) $*

sample-rejume.pdf: sample-rejume.tex define.tex
tebiki1-b4.pdf: tebiki1-b4.tex define.tex
tebiki2-b4.pdf: tebiki2-b4.tex define.tex
tebiki3-b4.pdf: tebiki3-b4.tex define.tex

# BibTeXが必要無い場合 (暗黙のルール)
.tex.pdf:
	$(LATEX) $*
	$(LATEX) $*
	$(DVIPDF) $*

# 中間生成ファイルを削除
semiclean: 
	-$(RM) *.aux *.log *.dvi *.toc *.blg *.bbl
# 先頭の '-' は、消すべきファイルが無くエラーとなったときに、エラーを無
# 視するため

# 目的のファイル (PDF) や、バックアップも含め、ソース以外を全て削除
clean: semiclean
	-$(RM) *.pdf *~
# 先頭の '-' は、消すべきファイルが無くエラーとなったときに、エラーを無
# 視するため
