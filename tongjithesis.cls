\NeedsTeXFormat{LaTeX2e}[2007/10/19]
\ProvidesClass{tongjithesis}[2019/03/24 v0.1 The LaTeX template for bachelor thesis of Tongji University]
\typeout{Document Class `tongjithesis' v0.1 by SXKDZ (2019/03)}

%%% class options %%%
\newif\iftongji@color\tongji@colorfalse
\DeclareOption{color}{\tongji@colortrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions\relax

\LoadClass[zihao=5,a4paper,oneside]{ctexbook}

%%% global packages %%%
\RequirePackage{ifthen}

%%% Chinese support %%%
\RequirePackage{xeCJK}

% change equation numbering with Chinese parenthesis
\def\tagform@#1{\maketag@@@{（\ignorespaces#1\unskip\@@italiccorr）}}

%%% space setting %%%
\RequirePackage{setspace}

%%% page geometry %%%
\RequirePackage{geometry}
\newgeometry{
	top=24mm, bottom=20mm, left=35mm, right=20mm,
	includefoot,
	% showframe
}
\savegeometry{tongji@bachelorgeometry}
\loadgeometry{tongji@bachelorgeometry}

%%% font specification %%%
\setCJKmainfont[BoldFont=FZHei-B01S, ItalicFont=FZKai-Z03S,Mapping=fullwidth-stop]{FZShuSong-Z01S}
\setCJKmonofont[Mapping=fullwidth-stop]{FZKai-Z03S}

\setCJKfamilyfont{hei}{FZHei-B01S}
\setCJKfamilyfont{cuhei}{FZDaHei-B02S}
\setCJKfamilyfont{songhei}{FZSongHei-B07S}

\renewcommand{\heiti}[0]{\CJKfamily{hei}}
\newcommand{\cuheiti}{\CJKfamily{cuhei}}
\newcommand{\songheiti}{\CJKfamily{songhei}}

%%% math symbols %%%
\RequirePackage{amsmath,amssymb,amsfonts,mathrsfs,bm}
\RequirePackage[amsmath,thmmarks,hyperref]{ntheorem}
\RequirePackage{lmodern}
\DeclareMathOperator*{\argmin}{argmin}
\DeclareMathOperator*{\argmax}{argmax}

%%% theorem %%%
\theoremsymbol{\ensuremath{\square}}
\theoremheaderfont{\itshape}
\theoremseparator{：}
\newtheorem*{proof}{证明}
\theoremheaderfont{\normalfont\bfseries}
\theoremstyle{plain}
\theoremsymbol{}
\theoremseparator{：}
\newtheorem{assumption}{假设}[chapter]
\newtheorem{definition}{定义}[chapter]
\newtheorem{proposition}{命题}[chapter]
\newtheorem{lemma}{引理}[chapter]
\newtheorem{theorem}{定理}[chapter]
\newtheorem{axiom}{公理}[chapter]
\newtheorem{corollary}{推论}[chapter]
\newtheorem{exercise}{练习}[chapter]
\newtheorem{example}{例}[chapter]
\newtheorem{remark}{注释}[chapter]
\newtheorem{problem}{问题}[chapter]
\newtheorem{conjecture}{猜想}[chapter]

%%% bibliographies %%%
\usepackage{natbib}
\usepackage{gbt7714}
\setlength{\bibsep}{0.0pt}

%%% glutter %%%
\usepackage{fancybox}
\newfontfamily\adobesong{Adobe Song Std}
\fancyput(-0.75cm,-13cm){\adobesong{\parbox{10pt}{┊\\┊\\┊\\┊\\┊\\┊\\┊\\┊\\┊\\┊\\┊\\┊\\┊\\装\\┊\\┊\\┊\\┊\\┊\\订\\┊\\┊\\┊\\┊\\┊\\线\\┊\\┊\\┊\\┊\\┊\\┊\\┊\\┊\\┊\\┊\\┊\\┊\\┊}}}

%%% header and footer %%%
\RequirePackage{fancyhdr,lastpage}

\setlength{\headheight}{40pt}
\setlength{\footskip}{20pt}

\pagestyle{fancyplain}
\fancyhf{} % clear all header and footer fields
\lhead{\quad\includegraphics[width=4.5cm]{logo.pdf}}
\rhead{\raisebox{2.5ex}{\zihao{4}{毕业设计（论文）}}}
\renewcommand{\headrulewidth}{0.75pt}

\cfoot{\zihao{-4}\thepage}
\renewcommand{\footrulewidth}{0pt}

\def\headrule{{
	\hrule\@height\headrulewidth\@width\headwidth
	\vskip 2pt % 2pt between lines
	\hrule\@height\headrulewidth\@width\headwidth % another lower line
	\vskip-\headrulewidth
	\vskip-1.5pt
}}

\def\footrule{{
	\vskip\footruleskip\vskip\footrulewidth
	\hrule\@width\headwidth\@height\footrulewidth
}}

% modify mainmatter with another footer style
\let\oldmainmatter\mainmatter
\renewcommand{\mainmatter}[0]{%
	\oldmainmatter
	\cfoot{}\rfoot{\zihao{-4}{共~~\pageref{LastPage}~~页~~~第~~\thepage~~页\quad{}}}
	\renewcommand{\footrulewidth}{0.75pt}
}

%%% cross reference %%%
\RequirePackage[xetex,unicode]{hyperref}
\iftongji@color
	\hypersetup{colorlinks}
\else
	\hypersetup{hidelinks}
\fi
\hypersetup{
	bookmarksnumbered,
	bookmarksopen,
	pdfdisplaydoctitle,
	pdfsubject=同济大学毕业设计（论文）,
	pdfcreator=TongjiThesis by SXKDZ,
}

\RequirePackage{etoolbox}
\AtBeginDocument{
	\hypersetup{
		pdftitle=\tongji@thesistitle,
		pdfauthor=\tongji@thesisauthor,
		pdfkeywords=\tongji@keyword,
	}
}

%%% tables %%%
\RequirePackage{booktabs,multirow,longtable}
\newcommand{\ulinecvcbc}[1]{\uline{\makebox[18em][c]{#1}}}

% redefining table/tabular/tabularx/longtable environments with texts of \zihao{-5}
\renewcommand{\arraystretch}{1.2}

\AtBeginEnvironment{table}{\zihao{-5}}
\AtBeginEnvironment{tabular}{\zihao{-5}}
\AtBeginEnvironment{tabularx}{\zihao{-5}}
\AtBeginEnvironment{longtable}{\zihao{-5}}

%%% captions %%%
\RequirePackage[skip=3pt,width=.75\textwidth,font=small,labelsep=space]{caption}

% continued captions for longtables
\DeclareCaptionLabelFormat{continuedlabel}{续#1#2}
\DeclareCaptionStyle{continued}[justification=raggedleft]{skip=3pt,width=.75\textwidth,font=small,labelformat=continuedlabel}

%%% figures %%%
\RequirePackage{graphicx}
\graphicspath{{figure/}}

%%% title formatting %%%
\setcounter{secnumdepth}{5}

\ctexset{
	chapter={
		name={,},
		number={\arabic{chapter}},
		format={\centering\zihao{4}\heiti},
		nameformat={},
		aftername={\quad},
		titleformat={},
		beforeskip={-.5\baselineskip},
		afterskip={.5\baselineskip},
	},
	section={
		format={\zihao{5}\heiti},
		aftername={\space},
		beforeskip={.5\baselineskip},
		afterskip={.5\baselineskip},
	},
	subsection={
		format={\zihao{5}\heiti},
		aftername={\space},
		beforeskip={.5\baselineskip},
		afterskip={.5\baselineskip},
		indent={2em},
	},
	subsubsection={
		numbering={true},
		number={\Alph{subsubsection}},
		format={\zihao{5}\heiti},
		aftername={. },
		beforeskip={0pt},
		afterskip={0pt},
		indent={2em},
	},
	paragraph={
		numbering={true},
		number={\alph{paragraph}},
		format={\zihao{5}\heiti},
		aftername={. },
		aftertitle={\par},
		beforeskip={0pt},
		afterskip={0pt},
		indent={2em},
	},
}

\newcommand{\Title}[1]{{\centering{\cuheiti\zihao{-2}{#1}}}}
\newcommand{\TitleEng}[1]{{\centering\zihao{-2}{\textbf{#1}}}}

%%% toc %%%
\RequirePackage{titletoc}
\renewcommand{\contentsname}{\zihao{4}{\textbf{目~录}}}
\newcommand{\toc}{
	\tableofcontents
	\titlecontents{chapter}[0em]{}
		{\contentspush{\thecontentslabel\ }}
		{}{\titlerule*[4pt]{.}\contentspage}
	\titlecontents{section}[2em]{}
		{\contentspush{\thecontentslabel\ }}
		{}{\titlerule*[4pt]{.}\contentspage}    
	\titlecontents{subsection}[4em]{}
		{\contentspush{\thecontentslabel\ }}
		{}{\titlerule*[4pt]{.}\contentspage}
}

%%% code listing %%%
\RequirePackage{listings,xcolor}
\lstset{
	backgroundcolor=\color{white},
	basicstyle=\zihao{5}\ttfamily,
	columns=flexible,
	breakatwhitespace=false,
	breaklines=true,
	captionpos=b,
	frame=single,
	numbers=left,
	numbersep=5pt,
	showspaces=false,
	showstringspaces=false,
	showtabs=false,
	stepnumber=1,
	rulecolor=\color{black},
	tabsize=2,
	texcl=true,
	title=\lstname,
	escapeinside={\%*}{*)},
	extendedchars=false,
	mathescape=true,
	xleftmargin=3em,
	xrightmargin=3em,
}
\iftongji@color
	\lstset{
		numberstyle=\color{gray},
		keywordstyle=\color{blue},
		commentstyle=\itshape\color{green!40!black},
		stringstyle=\color{orange},
	}
\else
   \lstset{
	   numberstyle=\color{black},
	   keywordstyle=\color{black},
	   commentstyle=\itshape\color{black},
	   stringstyle=\color{black},
   }
\fi
\renewcommand{\lstlistingname}{代码}

%%% algorithm pseudocode %%%
\RequirePackage[linesnumbered,ruled,vlined]{algorithm2e}
\renewcommand{\algorithmcfname}{算法}
\SetKwInput{KwIn}{输入}
\SetKwInput{KwOut}{输出}
\newcommand{\commentstyle}[1]{\texttt{#1}}
\SetCommentSty{commentstyle}

%%% lists %%%
% circled numbers
\RequirePackage{tikz}
\newcommand*\circled[1]{\tikz[baseline=(char.base)]{%
	\node[shape=circle,fill=blue!20,draw,inner sep=2pt] (char) {#1};}}

\RequirePackage{enumitem}
\setlist{noitemsep}
\setlist[1,2]{labelindent=\parindent}
\setlist[enumerate,1]{label=（\arabic*）}
\setlist[enumerate,2]{label=\circled{\arabic*}}
\setlist{
	topsep=0pt,
	itemsep=0pt,
	partopsep=0pt,
	parsep=\parskip,
}

%%% misc %%%
\renewcommand{\frontmatter}{
	\cleardoublepage
	\@mainmatterfalse
	\pagenumbering{Roman}
}

%%% front cover %%%
\let\oldtabular\tabular
\let\endoldtabular\endtabular
\newenvironment{information}[1][h!]{
	\renewcommand{\arraystretch}{1.5}
	\setlength{\tabcolsep}{8pt}
	\zihao{-3}\oldtabular[#1]
	}{\renewcommand{\arraystretch}{1.2}\endoldtabular
}

\newcommand{\MakeFrontCover}{
	\begin{titlepage}
	\begin{center}

	\thisfancyput(-0.75cm,-13cm){}
	\vspace*{\fill}

	\includegraphics[height=2.25cm]{logo.pdf}

	\zihao{-2}\MakeUppercase{\textbf{\tongji@universityeng}}
	\vskip 30pt

	\zihao{1}{\textbf{毕业设计（论文）}}
	\vskip 80pt

	\begin{information}{cc}	
		课题名称 & \ulinecvcbc{\tongji@thesistitle}\\
		副\enskip{}标\enskip{}题 & \ulinecvcbc{\tongji@thesissubtitle}\\
		学\quad{}\quad{}院 & \ulinecvcbc{\tongji@school}\\
		专\quad{}\quad{}业 & \ulinecvcbc{\tongji@major}\\
		学生姓名 & \ulinecvcbc{\tongji@thesisauthor}\\
		学\quad{}\quad{}号 & \ulinecvcbc{\tongji@authorschoolnumber}\\
		指导教师 & \ulinecvcbc{\tongji@advisor}\\
		日\quad{}\quad{}期 & \ulinecvcbc{\tongji@thesisyear{}年\tongji@thesismonth{}月\tongji@thesisday{}日}\\
	\end{information}

	\vspace*{\fill}

	\end{center}
	\end{titlepage}
}

%%% abstracts %%%
\newenvironment{cabstract}{%
	\newpage
	\vspace*{9pt}
	\begin{center}
		\begin{minipage}[h]{.8\textwidth}
			\centering{\Title{\tongji@thesistitle}}
		\end{minipage}
	\end{center}
	\vspace*{18pt}
	\centerline{\zihao{4}{\textbf{摘~要}}}
	\vskip 9pt
	\par
	}{%
	\vskip 18pt
	\noindent{\songheiti{关键词：}}\tongji@keyword
}

\newenvironment{eabstract}{%
	\newpage
	\vspace*{9pt}
	\begin{center}
		\begin{minipage}[h]{.8\textwidth}
			\centering{\TitleEng{\tongji@thesistitleeng}}
		\end{minipage}
	\end{center}
	\vspace*{18pt}
	\centerline{\zihao{4}{\textbf{ABSTRACT}}}
	\vskip 9pt
	\par
	}{%
	\vskip 18pt
	\noindent{{\textbf{Keywords:}}} \tongji@keywordeng
}

%%% custom information %%%

\renewcommand{\maketitle}{%
	\MakeFrontCover
	\frontmatter
}

\def\tongji@university{同济大学}
\def\tongji@universityeng{Tongji University}
\newcommand{\university}[2]{%
	\def\tongji@university{#1}
	\def\tongji@universityeng{#2}
}

\def\tongji@school{}
\def\tongji@schooleng{}
\newcommand{\school}[2]{%
	\def\tongji@school{#1}
	\def\tongji@schooleng{#2}
}

\def\tongji@major{}
\def\tongji@majoreng{}
\newcommand{\major}[2]{%
	\def\tongji@major{#1}
	\def\tongji@majoreng{#2}
}

\def\tongji@thesistitle{}
\def\tongji@thesissubtitle{}
\def\tongji@thesistitleeng{}
\def\tongji@thesissubtitleeng{}
\newcommand{\thesistitle}[4]{%
	\def\tongji@thesistitle{#1}
	\def\tongji@thesissubtitle{#2}
	\def\tongji@thesistitleeng{#3}
	\def\tongji@thesissubtitleeng{#4}
}

\def\tongji@thesisauthor{}
\def\tongji@thesisauthoreng{}
\newcommand{\thesisauthor}[2]{%
	\def\tongji@thesisauthor{#1}
	\def\tongji@thesisauthoreng{#2}
}

\def\tongji@authorschoolnumber{}
\newcommand{\schoolnumber}[1]{%
	\def\tongji@authorschoolnumber{#1}
}

\def\tongji@advisor{}
\def\tongji@advisoreng{}
\newcommand{\advisor}[2]{%
	\def\tongji@advisor{#1}
	\def\tongji@advisoreng{#2}
}

\def\tongji@thesisyear{}
\def\tongji@thesismonth{}
\def\tongji@thesisday{}
\newcommand{\thesisdate}[3]{%
	\def\tongji@thesisyear{#1}
	\def\tongji@thesismonth{#2}
	\def\tongji@thesisday{#3}
}

\def\tongji@keyword{}
\def\tongji@keywordeng{}
\newcommand{\keyword}[2]{%
	\def\tongji@keyword{#1}
	\def\tongji@keywordeng{#2}
}
