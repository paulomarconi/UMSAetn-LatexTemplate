\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Preamble/UMSAetn}[2015/07/20 UMSA-ETN-Bolivia]
%-------------------------------------------------------------------------------
\AtEndOfClass{
	%---- Paquetes genéricos ---------------------------------------------------
	\usepackage[utf8]{inputenc} %encoding multi-byte
	\usepackage[T1]{fontenc} %para los separación de palabras "can-ción"
	\usepackage[spanish]{babel} %traducir al español Chapters, Contents, etc.
	\usepackage{lmodern} %Estilo de fuente
	\usepackage{amsmath,amssymb,amsfonts,latexsym,textcomp} %paquetes matematicos
	\usepackage{array,multirow,booktabs,tabulary} %tablas y arrays
	\usepackage{graphicx}   
	\usepackage{caption,float,subfigure} %float=figuras flotantes.
	\usepackage{verbatim}  %texto raw 
	\usepackage[ampersand]{easylist} %http://en.wikibooks.org/wiki/LaTeX/List_Structures#Easylist_package 
	
	%---- Bibliografia bibtex+biblatex -----------------------------------------
	\usepackage[backend=bibtex,backref,natbib,sorting=none]{biblatex} %backref=hyperlinks de inversa, e.g.(vid. pag. xx)	
	
	%---- Colores --------------------------------------------------------------
	\ifJournal	
		\usepackage{color}
	\else
		\usepackage{color}
		\usepackage[usenames,dvipsnames,svgnames,table,x11names]{xcolor} 
	\fi
	
	%---- Indice de Palabras ---------------------------------------------------
	\usepackage{imakeidx}
	\makeindex[columns=3, intoc] %intoc=agrega "index" a tabla de contenido

	%---- Hyperlinks  ----------------------------------------------------------
	\usepackage[ %
		breaklinks, %
		colorlinks=true, %
		linkcolor=blue, %
		citecolor=blue, %
		urlcolor=blue %
	]{hyperref} 
	
	%---- Glosario y Acrónimos -------------------------------------------------
	\usepackage[toc,acronym]{glossaries} % toc=agrega glosarios a TablaDeContenido
	\renewcommand*{\glstextformat}[1]{\textcolor{black}{#1}}
	\makeglossaries
	
	%---- Algorithms2e ---------------------------------------------------------
	\usepackage[ruled,vlined,spanish]{algorithm2e} %probar vlined o lined
	% \SetKwProg{Prog}{Title}{is}{end} 
	\SetKwProg{Config}{config}{}{end} 
	\SetKwProg{Def}{def}{}{end} 
	\SetKwProg{Fn}{Function}{}{end} 
	\SetKwProg{Main}{main}{}{end} 
	
	%---- Usar otros fonts + símbolo \degree -----------------------------------
	\newcommand*{\myfont}{\fontfamily{lmtt}\selectfont}
	\DeclareTextFontCommand{\textmyfont}{\myfont}	
	\usepackage{gensymb} 
	
	%---- Graficos: eps + tikz + circuitikz ------------------------------------
	\usepackage{epstopdf}
	\usepackage{tikz} 
	\usepackage{circuitikz} %http://www.texample.net/tikz/examples/tag/circuitikz/
	
	%---- Animaciones con GNUplot ----------------------------------------------
	\usepackage{animate}
	
	\tikzset{overlap/.style={fill=yellow!30},
		block wave/.style={thick},
		function f/.style={block wave, red!50},
		function g/.style={block wave, green!50},
		convolution/.style={block wave, blue!50},
		function g position/.style={function g, dashed, semithick},
		major tick/.style={semithick},
		axis label/.style={anchor=west},
		x tick label/.style={anchor=north, minimum width=7mm},
		y tick label/.style={anchor=east},
	}
	\pgfkeys{/pgf/number format/.cd,fixed,precision=1}
	
	\pgfdeclarelayer{background}
	\pgfdeclarelayer{foreground}
	\pgfsetlayers{background,main,foreground}
	
	%---- Code highlighting con Listings ---------------------------------------
	\usepackage{listings}	
	\definecolor{mygreen}{rgb}{0.5,0.6,0.5}
	\definecolor{mygray}{rgb}{0.5,0.5,0.5}
	\definecolor{mymauve}{rgb}{0.58,0,0.82}
	\definecolor{mygray2}{rgb}{0.9764, 0.9764, 0.9762}
	%---- Config listings ------------------------------------------------------
	\lstset{ %
		backgroundcolor=\color{mygray2},	% background color
		basicstyle=\footnotesize\ttfamily,	% tamaño de las letras y tipo de letra
		breaklines=true,	% corte de linea (line breaking)solo en espacio blanco
		captionpos=t,		% posicion del caption b,t,n (top,bottom,none)
		commentstyle=\color{ForestGreen},	% estilo del comentario
		%escapeinside={\%*}{*},	% si se desea agregar codigo Latex dentro el codigo debe ser %*codigo latex*
		frame=single,	% agrega marco al codigo
		frameround=tttt,	% redondear el marco
		keepspaces=true,	% mantiene los espacios en el texto, util para mantener la indentacion del codigo (uso posible en columns=flexible)
		keywordstyle=\color{blue},	% estilo de los keywords
		stringstyle=\color{mymauve},	% estilo del string
		numbers=left,	% donde poner los numeros de linea, (none, left, right)
		numbersep=5pt,	% cuan lejos los numeros de linea estan del codigo
		xleftmargin=0pt,	% margen izquierdo
		showspaces=false,	% muestra espacios de codigo en todas partes usando el caracter barra baja "_", sobreescribe el comando 'showstringspaces'
		showstringspaces=false,	% muestra espacios solo en los strings
		tabsize=2,	% tabulacion por defecto =2
		title=\lstname	% muestra el nombre de lo archivos incluidos con \lstinputlisting; tambien se puede tratar con caption en vez de title
	}	
	%---- Config personalizada del caption -------------------------------------
	\DeclareCaptionFont{white}{ \color{white} }
	\DeclareCaptionFormat{listing}{
		\colorbox[cmyk]{0.43, 0.35, 0.35, 0.01 }{
			\parbox{0.96\linewidth}{\hspace{15pt}#1#2#3}
		}
	}
	\captionsetup[lstlisting]{ format=listing, 
		labelfont=white, 
		textfont=white, 
		singlelinecheck=false, 
		margin=0pt, 
		font={bf,footnotesize} }
	%---- Caracteres especiales ------------------------------------------------	
	% Por defecto, listings no soporta inputec para mostrar los acentos y caracteres especiales.
	% para manejar utf8 se debe enlistar los caracteres segun:
	\lstset{literate=
		{á}{{\'a}}1 {é}{{\'e}}1 {í}{{\'i}}1 {ó}{{\'o}}1 {ú}{{\'u}}1
		{Á}{{\'A}}1 {É}{{\'E}}1 {Í}{{\'I}}1 {Ó}{{\'O}}1 {Ú}{{\'U}}1
		{à}{{\`a}}1 {è}{{\`e}}1 {ì}{{\`i}}1 {ò}{{\`o}}1 {ù}{{\`u}}1
		{À}{{\`A}}1 {È}{{\'E}}1 {Ì}{{\`I}}1 {Ò}{{\`O}}1 {Ù}{{\`U}}1
		{ä}{{\"a}}1 {ë}{{\"e}}1 {ï}{{\"i}}1 {ö}{{\"o}}1 {ü}{{\"u}}1
		{Ä}{{\"A}}1 {Ë}{{\"E}}1 {Ï}{{\"I}}1 {Ö}{{\"O}}1 {Ü}{{\"U}}1
		{â}{{\^a}}1 {ê}{{\^e}}1 {î}{{\^i}}1 {ô}{{\^o}}1 {û}{{\^u}}1
		{Â}{{\^A}}1 {Ê}{{\^E}}1 {Î}{{\^I}}1 {Ô}{{\^O}}1 {Û}{{\^U}}1
		{œ}{{\oe}}1 {Œ}{{\OE}}1 {æ}{{\ae}}1 {Æ}{{\AE}}1 {ß}{{\ss}}1
		{ç}{{\c c}}1 {Ç}{{\c C}}1 {ø}{{\o}}1 {å}{{\r a}}1 {Å}{{\r A}}1
		{ñ}{{\~n}}1 {£}{{\pounds}}1 {°}{{\degree}}1
	}		
	%---- Macro de inclusión de documentos con listings ------------------------
	% [2]=numero de argumentos, #1=argumento 1, #2=argumento 2
	\newcommand{\includecode}[2]{\lstinputlisting[language=#1, caption=#2, label=#2]{#2}}		
}
	
%---- kvoptions ----------------------------------------------------------------
\usepackage{kvoptions}
\SetupKeyvalOptions{ %
	family=myclass, %
	prefix=myclass@ %
}
\DeclareBoolOption{Journal}\newif\ifJournal %por defecto está en false
\DeclareBoolOption{Article}
\DeclareStringOption{PageType}
\DeclareStringOption{FontSize}
\DeclareBoolOption{Profile}
\DeclareBoolOption{Thesis}
\DeclareBoolOption{Tutorial}
\ProcessKeyvalOptions{myclass}

%---- Journal ------------------------------------------------------------------
\ifmyclass@Journal
	\LoadClass[\myclass@FontSize]{report}
	\Journaltrue %definiendo en true	 
	\usepackage[top=2cm, bottom=2cm, left=2cm, right=2cm]{geometry}  
	\usepackage{pax}
	\usepackage{pdfpages}			
	
	\AtEndOfClass{
		%---- Fancy header y footer ------------------------------------------
		\usepackage{fancyhdr}
		\fancyhf{}
		\renewcommand{\headrulewidth}{0pt}
		\pagestyle{fancy}
		\cfoot{\thepage}
		\lhead{\textit\myHeader}			
		%---- Makechapterhead, redefine las clases book y report sin alterar el TOC --
		\makeatletter
		\def\@makechapterhead#1{%
			\vspace*{50\p@}
			{\parindent \z@ \raggedright \normalfont 
				\interlinepenalty\@M 
				\Huge\bfseries  \thechapter.\space #1\par\nobreak 
				\vskip 40\p@ 
			} 
		} 
		\makeatother
	}		
\fi

%---- Article ------------------------------------------------------------------
\ifmyclass@Article
	\LoadClass[twocolumn,\myclass@FontSize]{article}
	\usepackage[top=2cm, bottom=2cm, left=2cm, right=2cm]{geometry}  
	\usepackage[explicit]{titlesec}
	\renewcommand{\thesection}{\Roman{section}.}
	\titleformat{\section}{\normalfont}{\thesection}{10pt}{\centering\sc{#1}}
	\renewcommand{\thesubsection}{\Alph{subsection}.}
	\titleformat{\subsection}{\normalfont}{\textit{\thesubsection}}{10pt}{\textit{#1}}
	\renewcommand{\thesubsubsection}{\hspace{10pt}\arabic{subsubsection})}
	\titleformat{\subsubsection}{\normalfont}{\textit{\thesubsubsection}}{10pt}{\textit{#1}}{}	
	%--- Elegir PageType tipo Journal o Article para el documento Article.tex ---
	\newcommand{\myMaketitle}{ 
		\pagestyle{\myclass@PageType}
		\maketitle 
		\thispagestyle{\myclass@PageType}		
	}	
\fi

%---- Profile ------------------------------------------------------------------
\ifmyclass@Profile
	\LoadClass[\myclass@FontSize]{article}
	\usepackage[top=2.5cm, bottom=2.5cm, left=3cm, right=3cm]{geometry} 	
	%---- Salto de línea en parrafo --------------------------------------------
	\usepackage{parskip}
	\setlength{\parindent}{0pt}	 
\fi	

%---- Thesis -------------------------------------------------------------------
\ifmyclass@Thesis
	\LoadClass[oneside,\myclass@FontSize]{book}
	\usepackage[top=2.5cm, bottom=2.5cm, left=3cm, right=3cm]{geometry}  	
	%---- Salto de linea en parrafo --------------------------------------------
	\usepackage{parskip}
	\setlength{\parindent}{0pt}			
	
	\AtEndOfClass{
		%---- Fancy header y footer --------------------------------------------
		\usepackage{fancyhdr} 
		\pagestyle{fancy} 
		
		% con esto nos aseguramos que las cabeceras de capítulo y sección 
		% esten en minúscula con la primera letra en mayúscula
		\renewcommand{\chaptermark}[1]{\markboth{#1}{}}
		\renewcommand{\sectionmark}[1]{\markright{\thesection\ #1}}
		
		\fancyhf{} % borra la actual cabecera (header) y pie de pagina (footer)
		\fancyhead[LE,RO]{\thepage} %LE,RO para hojas de 2 paginas (twosides)
		\fancyhead[RE]{\textit{\leftmark}}
		\fancyhead[LO]{\textit{\rightmark}}
		\renewcommand{\headrulewidth}{0.5pt}
		\renewcommand{\footrulewidth}{0pt}
		\addtolength{\headheight}{1pt} % espacio para la regla
		
		\fancypagestyle{plain}{%
			\fancyhead{} % deshacemos los headers en paginas planas
			\renewcommand{\headrulewidth}{0pt} % ancho de la linea en el header
			\renewcommand{\footrulewidth}{0pt}
		}		
		%---- MakeChapterhead, redefine las clases book y report sin alterar el TOC:--	
		\makeatletter
		\def\@makechapterhead#1{%
			\vspace*{50\p@}%
			{\parindent \z@ \raggedright \normalfont
				\interlinepenalty\@M
				\Huge\bfseries  \thechapter.\space #1\par\nobreak
				\vskip 40\p@
			}
		}
		\makeatother
	}	
\fi	

%---- Tutorial -----------------------------------------------------------------
\ifmyclass@Tutorial
	\LoadClass[\myclass@FontSize]{article}
	\usepackage[top=2.5cm, bottom=2.5cm, left=3cm, right=3cm]{geometry} 	
	%---- Salto de linea en parrafo --------------------------------------------
	\usepackage{parskip}
	\setlength{\parindent}{0pt}	 
\fi	
%-------------------------------------------------------------------------------
\endinput