# $(BINTEX) est la nom du fichier tex
BINTEX = SkelBasedGI
# $(BIN) est le nom du fichier include
BIN = SkelBasedGI-body
# $(OBJECTS) sont les objets qui seront générés après la compilation
OBJECTS = $(BINTEX).pdf
# $(TEX) latex
TEX = pdflatex
# Liste des objets
MALISTE=$(BINTEX).dvi $(BINTEX).ps $(BINTEX).pdf $(BINTEX).aux $(BINTEX).log $(BINTEX).bbl $(BINTEX).blg $(BINTEX).brf $(BINTEX).lbl


# all est la première règle à être exécutée car elle est la première
# dans le fichier Makefile. Notons que les dépendances peuvent être
# remplacées par une variable, ainsi que n'importe quel chaine de
# caractères des commandes
all: $(OBJECTS)

# ensuite les autres règles
$(BINTEX).pdf: $(BINTEX).tex
	@echo "=========================== COMPILATION LATEX !";
	$(TEX) $(BINTEX).tex

force: $(BINTEX).tex 
	$(TEX) $(BINTEX).tex

viewpdf: pdf
	xpdf $(BINTEX).pdf &

edit:
	gedit $(BINTEX).tex &

bib: $(BINTEX).tex 
	bibtex $(BINTEX)

clean:
	@echo "=========================== CLEANING !";
	@rm -f $(BINTEX).bbl $(BINTEX).blg $(BINTEX).brf $(BINTEX).lbl 
	@rm -f $(BINTEX).aux 
	@rm -f $(BINTEX).log 
	@rm -f $(BINTEX).dvi 
	@rm -f $(BINTEX).ps 
	@rm -f $(BINTEX).pdf 
