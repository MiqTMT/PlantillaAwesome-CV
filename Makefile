.PHONY: cv-en cv-es resume-generic-en resume-generic-es resume-company-template-en resume-company-template-es all

TEX = xelatex

all: cv-en cv-es resume-generic-en resume-generic-es

cv-en:
	$(TEX) cv/en.tex

cv-es:
	$(TEX) cv/es.tex

resume-generic-en:
	$(TEX) resumes/generic/en.tex

resume-generic-es:
	$(TEX) resumes/generic/es.tex

resume-company-template-en:
	$(TEX) resumes/company-template/en.tex

resume-company-template-es:
	$(TEX) resumes/company-template/es.tex
