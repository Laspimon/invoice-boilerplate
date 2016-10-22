TEX = pandoc
src = invoice.tex details.yml
FLAGS = --latex-engine=xelatex
now = $(shell date +"%Y-%m-%d_%H-%M-%S")

output.pdf : $(src)
	$(TEX) $(filter-out $<,$^ ) -o $@ --template=$< $(FLAGS)
	cp output.pdf pdfs/output_$(now).pdf
	cp details.yml yml/details_$(now).yml
	open pdfs/output_$(now).pdf

.PHONY: clean
clean :
	rm output.pdf
