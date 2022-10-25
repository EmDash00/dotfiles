# how pdflatex will be executed
$pdflatex = 'pdflatex --shell-escape %O %S';
$latex = 'python $(echo %S | cut -f 1 -d \'.\').sympy && latex --shell-escape --synctex=1 %O %S';
