% Customized letter class:  university_letter.cls
% changes the letter class by adding letterhead
% option either "sign" (default) or "nosign"; the sign feature includes your signature
% which must be in a file signature.jpg

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{university_letter}

\RequirePackage{ifthen}

\newboolean{@sign}

% Defaults:  signed 
\setboolean{@sign}{true}
\DeclareOption{sign}{
	\setboolean{@sign}{true}}
\DeclareOption{nosign}{
	\setboolean{@sign}{false}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{letter}}

\ProcessOptions
\LoadClass{letter}


%\RequirePackage{times}
\RequirePackage{graphicx}
\RequirePackage{url}
\RequirePackage{fontspec}
\RequirePackage{xunicode}



\def\myauthor{Kieran Healy}
\def\mytitle{Vita}
\def\mycopyright{\myauthor}
\def\mybibliostyle{plain}
\def\mysubtitle{}
\def\myaffiliation{Duke University}
\def\myphone{\tiny\sffamily (919) 660-5737}
\def\myemail{\tiny\sffamily kieran.healy@duke.edu}
\def\myversion{}
\def\myrevision{}

\setlength{\topmargin}{-1.5cm}
\newsavebox{\tsheader}
\newsavebox{\universitylogo}

\sbox{\universitylogo}{\parbox{\textwidth}{
    \begin{tabular}{l}
     \includegraphics[scale=0.55]{/Users/timothyelder/Documents/UChicago_Graphic_Identity/University_Seal/RGB_PNG/university.seal.rgb.light.gray.png}
   \end{tabular}}}
		
\sbox{\tsheader}{\parbox[b]{\textwidth}{\usebox{\universitylogo}\raisebox{0cm}}}


\newcounter{figure}
\renewcommand \thefigure {\@arabic\c@figure}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename\nobreakspace\thefigure}
\newenvironment{figure}
               {\@float{figure}}
               {\end@float}
\newenvironment{figure*}
               {\@dblfloat{figure}}
               {\end@dblfloat}
\newcounter{table}
\renewcommand\thetable{\@arabic\c@table}
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename\nobreakspace\thetable}
\newenvironment{table}
               {\@float{table}}
               {\end@float}
\newenvironment{table*}
               {\@dblfloat{table}}
               {\end@dblfloat}
\newlength\abovecaptionskip
\newlength\belowcaptionskip
\setlength\abovecaptionskip{10\p@}
\setlength\belowcaptionskip{0\p@}
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{#1: #2}%
  \ifdim \wd\@tempboxa >\hsize
    #1: #2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}

\newcommand\figurename{Figure}
\newcommand\tablename{Table}

\renewcommand{\ps@firstpage}{%
  \setlength{\headheight}{0cm}\setlength{\headsep}{3.5cm}%
  \renewcommand{\@oddhead}{\usebox{\tsheader}}
  \renewcommand{\@oddfoot}{{\sffamily\tiny 268 Reuben-Cooke Building, Duke University, Durham, North Carolina 27708, USA. Phone: \myphone \, Email: \myemail}}%
    \renewcommand{\@evenhead}{}\renewcommand{\@evenfoot}{{\sffamily\tiny 268 Reuben-Cooke
      Building, Duke University, Durham, North Carolina 27708, USA. Phone:
      \myphone \, Email: \myemail}}%
  }

\providecommand{\@evenhead}{} \providecommand{\@oddhead}{}

\providecommand{\@evenfoot}{{\sffamily\tiny 268 Reuben-Cooke
      Building, Duke University, Durham, North Carolina 27708, USA. Phone:
      \myphone \, Email: \myemail}} \providecommand{\@oddfoot}{}

%\pagestyle{headings}


\renewcommand{\closing}[1]{
	\hspace*{4cm}
	\parbox{\textwidth}{
	\ifthenelse{\equal{#1}{}}{}{#1\\}
	\ifthenelse{\boolean{@sign}}{}{\bigskip \bigskip \bigskip \bigskip \bigskip \ifthenelse{\equal{#1}{}}{}{{ }\\}}	
	\raggedright \fromsig}}

\signature{
	Professor of Sociology.}
	
