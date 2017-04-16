\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{my_cv}[6/6/2013 custom CV class]
\LoadClass{article}
\RequirePackage{titlesec}

\RequirePackage[quiet]{fontspec}
\RequirePackage[math-style=TeX]{unicode-math}
\newfontfamily\bodyfont
[BoldFont=texgyreheros-bold.otf,
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
\usepackage{xcolor}
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

\definecolor{maincolor}{RGB}{0,128,128}
\definecolor{workplace}{HTML}{0395DE}
\definecolor{sidesections}{HTML}{0395DE}
\definecolor{maingray}{HTML}{B9B9B9}

\titleformat{\section}         % Customise the \section command 
  {\headingfont\Large\scshape\raggedright\color{sidesections}} % Make the \section headers large (\Large),
                               % small capitals (\scshape) and left aligned (\raggedright)
  {}{0em}                      % Can be used to give a prefix to all sections, like 'Section ...'
  {}                           % Can be used to insert code before the heading

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
\newcommand{\pageheader}[8]{\fontfamily{cmss}\selectfont %
   \begin{tikzpicture}[remember picture,overlay]
		\node (header) [shape=rectangle, fill=maincolor, minimum height=5cm, minimum width=\paperwidth, anchor=north west] at (current page.north west) {};
	
	%\node [below left,align=center, anchor=south](name) at (header){#1 #2};
	\node(text) [anchor=south, xshift=1.5cm] (name) at (header) {%
      \fontsize{40pt}{62pt}\color{white}\selectfont%
      {\bodyfont #1}{\headingfont #2}
    };
    \node(text) [anchor=north] (contact) at (name.south) {%
      \fontsize{10pt}{16pt}\color{white}\selectfont%
      {\headingfont \faEnvelope~ #4 |~ \headingfont \phone~ #3 |~\headingfont \faGithub ~ #5 ~|~\headingfont \faLinkedinSquare ~ #6}
    };
    \node(text) [anchor=north] (addrbirth) at (contact.south) {%
      \fontsize{10pt}{16pt}\color{white}\selectfont%
      {\faHome \headingfont #7 |~ \faBirthdayCake ~\headingfont #8}
    };
    
	\node[xshift=2.5cm, yshift=-2.2cm] (mypic) at (header.west)
    {\includegraphics[width=.33\textwidth]{nikola_cv_photo.png}};    
	\end{tikzpicture}
}



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
\newcommand{\grade}[1]{%
\tikzset{node distance = 0.2cm and 0.2cm}
\begin{tikzpicture}[remember picture]
\foreach [count=\i] \x/\y in {#1}{
				\fill[fill=maingray] (0,\i) rectangle (3,\i+0.2);
				\fill[fill=maincolor](0,\i) rectangle (\y,\i+0.2);
				\node [above right] at (0,\i+0.2) {\x};
			}
\end{tikzpicture}%
}

\setlength{\tabcolsep}{0pt}
\newenvironment{entrylist}{%
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
  \end{tabular*}
}
\renewcommand{\bfseries}{\headingfont\color{maincolor}}
\newcommand{\entry}[4]{%
 \parbox[t]{2cm}{\bodyfont #1}\parbox[t]{11.8cm}{%
    \textbf{\bodyfont \hfill #2\\}%
    \hfill%
    {\footnotesize\bodyfont \addfontfeature{Color=workplace} #3}\\%
   \bodyfont #4\vspace{\parsep}%
  }\\}
\pagenumbering{gobble}