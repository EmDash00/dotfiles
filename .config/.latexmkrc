# how pdflatex will be executed
$pdflatex = 'pdflatex --shell-escape %O %S && python $(echo %S | cut -f 1 -d \'.\').sympy && pdflatex --shell-escape --synctex=1 %O %S ';
$latex = 'pdflatex --shell-escape %O %S && python $(echo %S | cut -f 1 -d \'.\').sympy && pdflatex --shell-escape --synctex=1 %O %S ';
