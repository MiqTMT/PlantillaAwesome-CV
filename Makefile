.PHONY: cv-en cv-es resume-generic-en resume-generic-es resume-company-template-en resume-company-template-es all

TEX = xelatex

all: cv-en cv-es resume-generic-en resume-generic-es

cv-en:
	cd cv && $(TEX) en.tex

cv-es:
	cd cv && $(TEX) es.tex

resume-generic-en:
	cd resumes/generic && $(TEX) en.tex

resume-generic-es:
	cd resumes/generic && $(TEX) es.tex

resume-company-template-en:
	cd resumes/company-template && $(TEX) en.tex

resume-company-template-es:
	cd resumes/company-template && $(TEX) es.tex
