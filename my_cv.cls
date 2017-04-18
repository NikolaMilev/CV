\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{my_cv}[6/6/2013 custom CV class]
\LoadClass{article}
\RequirePackage{titlesec}
\usepackage{xcolor}
\usepackage{tabularx} 
\usepackage[top=4.5cm, bottom=0cm, left=5cm, right=2cm]{geometry}
% colours that I used in this CV
\definecolor{maincolor}{RGB}{0,128,128}
\definecolor{workplace}{HTML}{0395DE}
\definecolor{sidesections}{HTML}{0395DE}
\definecolor{maingray}{HTML}{B9B9B9}
\definecolor{bodycolor}{RGB}{26,26,26}

\RequirePackage[quiet]{fontspec}
\RequirePackage[math-style=TeX]{unicode-math}
\newfontfamily\bodyfont
[Color=bodycolor,BoldFont=texgyreheros-bold.otf,
ItalicFont=texgyreheros-italic.otf,
BoldItalicFont=texgyreheros-bolditalic.otf]
{texgyreheros-regular.otf}
\newfontfamily\namefont
[Color=white,BoldFont=texgyreheros-bold.otf,
ItalicFont=texgyreheros-italic.otf,
BoldItalicFont=texgyreheros-bolditalic.otf]
{texgyreheros-regular.otf}
\newfontfamily\thinfont[]{Lato-Hairline.ttf}
\newfontfamily\headingfont[]{texgyreheros-bold.otf}
\defaultfontfeatures{Mapping=tex-text}
\setmainfont
[Mapping=tex-text, Color=textcolor,
BoldFont=texgyreheros-bold.otf,
ItalicFont=texgyreheros-italic.otf,
BoldItalicFont=texgyreheros-bolditalic.otf
]
{texgyreheros-regular.otf}
\setmathfont{texgyreheros-regular.otf}
\usepackage{xunicode}
\usepackage{tikz}
\usetikzlibrary{calc}
\usepackage{tikzpagenodes}
\usepackage{hyperref}
\usetikzlibrary{positioning}
\usepackage{bbding}
\usepackage{ wasysym }
\usepackage{fontawesome}
\usepackage{tgadventor}
\usepackage{titlesec}
\usepackage{multicol}



\titleformat{\section}         % Customise the \section command 
  {\headingfont\Large\scshape\raggedright\color{sidesections}} % Make the \section headers large (\Large),
                               % small capitals (\scshape) and left aligned (\raggedright)
  {}{0em}                      % Can be used to give a prefix to all sections, like 'Section ...'
  {}                           % Can be used to insert code before the heading
% \titlespacing*{<command>}{<left>}{<before-sep>}{<after-sep>}
\titlespacing*{\section}{0pt}{1pt}{2pt}
  \titleformat{\subsection}
  {\large\scshape\raggedright}
  {}{0em}
  {}
  
  \newcommand{\datedsection}[2]{ %
  \section[#1]{ #1 \hfill #2}%
}
\newcommand{\datedsubsection}[2]{ %
  \subsection[#1]{#1 \hfill #2}%
}

% custom header
\newcommand{\pageheader}[8]{\fontfamily{cmss}\selectfont %
	% the rectangle on the top of the page   
   \begin{tikzpicture}[remember picture,overlay]
		\node (header) [shape=rectangle, fill=maincolor, minimum height=5cm, minimum width=\paperwidth, anchor=north west] at (current page.north west) {};
	
	% the full name
	\node(text) [anchor=south, xshift=1.5cm] (name) at (header) {%
      \fontsize{40pt}{62pt}\color{white}\selectfont%
      {\namefont #1}{\headingfont #2}
    };
    % the rest of the information
    \node(text) [anchor=north] (contact) at (name.south) {%
      \fontsize{10pt}{16pt}\color{white}\selectfont%
      {\headingfont \faEnvelope~ #4 |~ \headingfont \phone~ #3 |~\headingfont \faGithub ~ #5 ~|~\headingfont \faLinkedinSquare ~ #6}
    };
    \node(text) [anchor=north] (addrbirth) at (contact.south) {%
      \fontsize{10pt}{16pt}\color{white}\selectfont%
      {\faHome \headingfont #7 |~ \faBirthdayCake ~\headingfont #8}
    };
    
    % the picture
	\node[xshift=2.5cm, yshift=-2.2cm] (mypic) at (header.west)
    {\includegraphics[width=.28\textwidth]{nikola_cv_photo.png}};    
	\end{tikzpicture}
}


% for the side bar
\RequirePackage[absolute,overlay]{textpos}
\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}
\newenvironment{aside}{%
  \let\oldsection\section
  \renewcommand{\section}[1]{
    \par\vspace{\baselineskip}{\Large\headingfont\color{sidesections} ##1}
  }
  \begin{textblock}{3}(1, 6)
  \begin{flushleft}
  \obeycr`
}{%
  \restorecr
  \end{flushleft}
  \end{textblock}
  \let\section\oldsection

}
% Command for printing skill progress bars; max level is 3; non-integers allowed
\newcommand{\skills}[1]{%
\tikzset{node distance = 0.2cm and 0.2cm}
\begin{tikzpicture}[remember picture]
\foreach [count=\i] \x/\y in {#1}{
				\fill[fill=maingray] (0,\i) rectangle (3,\i+0.2);
				\fill[fill=maincolor](0,\i) rectangle (\y,\i+0.2);
				\node [above right] at (0,\i+0.2) {\x};
			}
\end{tikzpicture}%
}

% the entries for education/work
\setlength{\tabcolsep}{0pt}
\newenvironment{entrylist}{%
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
  \end{tabular*}
}
\renewcommand{\bfseries}{\headingfont\color{maincolor}}
\newcommand{\entry}[4]{%
 \parbox[t]{2cm}{\bodyfont #1}\parbox[t]{12.8cm}{%
    \textbf{\bodyfont \hfill #2\\}%
    \hfill%
    {\footnotesize\bodyfont \addfontfeature{Color=workplace} #3}\\%
   \bodyfont \vspace{1pt} #4%  \vspace{\parsep} (ili neki broj)<- to se moze dodati pre #4 ako cu da ubacim vertical space
  }\\}
  
\setlength{\tabcolsep}{0pt}
\newenvironment{aplist}{%
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
  \end{tabular*}
}

\newcommand{\apentry}[2]{%
 \parbox[t]{2cm}{\bodyfont #1}\parbox[t]{12.8cm}{%
    \textbf{\bodyfont\color{black} #2\\}%
  }\\}
  
% remove page numbers from the document
\pagenumbering{gobble}

\newenvironment{absolutelynopagebreak}
  {\par\nobreak\vfil\penalty0\vfilneg
   \vtop\bgroup}
  {\par\xdef\tpd{\the\prevdepth}\egroup
   \prevdepth=\tpd}