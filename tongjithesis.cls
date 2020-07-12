\NeedsTeXFormat{LaTeX2e}[2007/10/19]
\ProvidesClass{tongjithesis}[2019/05/17 v0.2.5 The LaTeX template for bachelor thesis of Tongji University]
\typeout{Document Class `tongjithesis' v0.2.5 by SXKDZ (2019/05)}

%%% class options %%%
\newif\iftongji@color\tongji@colorfalse
\newif\iftongji@debug\tongji@debugfalse
\newif\iftongji@compressed\tongji@compressedfalse
\newif\iftongji@notimes\tongji@notimesfalse
\DeclareOption{color}{\tongji@colortrue}
\DeclareOption{debug}{\tongji@debugtrue}
\DeclareOption{notimes}{\tongji@notimestrue}
\DeclareOption{compressed}{\tongji@compressedtrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions\relax

\LoadClass[zihao=5,a4paper,oneside]{ctexbook}

% compress space between punctuations by `punct=banjiao`
\iftongji@compressed
\ctexset{
	punct=banjiao
}
\fi

%%% global packages %%%
\RequirePackage{ifthen}

%%% Chinese support %%%
\RequirePackage{xeCJK}

% support circled numbers and special characters
\xeCJKsetcharclass{`①}{`⑩}{1}
\XeTeXcharclass`┊=1

%%% space setting %%%
\RequirePackage{setspace}

%%% page geometry %%%
\RequirePackage[top=24mm,bottom=20mm,left=35mm,right=20mm,includefoot]{geometry}

%%% font specification %%%
\setCJKmainfont[BoldFont=FZHei-B01S, ItalicFont=FZKai-Z03S,Mapping=fullwidth-stop]{FZShuSong-Z01S}
\setCJKmonofont[Mapping=fullwidth-stop]{FZKai-Z03S}

\setCJKfamilyfont{kai}[Mapping=fullwidth-stop]{FZKai-Z03S}
\setCJKfamilyfont{hei}[Mapping=fullwidth-stop]{FZHei-B01S}
\setCJKfamilyfont{cuhei}[Mapping=fullwidth-stop]{FZDaHei-B02S}
\setCJKfamilyfont{songhei}[Mapping=fullwidth-stop]{FZSongHei-B07S}

\newcommand{\kaiti}{\CJKfamily{kai}}
\renewcommand{\heiti}{\CJKfamily{hei}}
\newcommand{\cuheiti}{\CJKfamily{cuhei}}
\newcommand{\songheiti}{\CJKfamily{songhei}}

%%% hyperref and url %%%
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

\PassOptionsToPackage{hyphens}{url}
\def\UrlFont{\ttfamily}

%%% math symbols %%%
\RequirePackage{amsmath,amssymb,amsfonts,mathrsfs,bm}
\RequirePackage[amsmath,thmmarks,hyperref]{ntheorem}
\RequirePackage{lmodern}

\DeclareMathOperator*{\argmin}{argmin}
\DeclareMathOperator*{\argmax}{argmax}

\RequirePackage{accents}
% left arrow over text
\DeclareRobustCommand{\cev}[1]{%
	\mathpalette\do@cev{#1}%
}
\newcommand{\do@cev}[2]{%
	\fix@cev{#1}{+}%
	\reflectbox{$\m@th#1\vec{\reflectbox{$\fix@cev{#1}{-}\m@th#1#2\fix@cev{#1}{+}$}}$}%
	\fix@cev{#1}{-}%
}
\newcommand{\fix@cev}[2]{%
	\ifx#1\displaystyle
		\mkern#23mu
	\else
		\ifx#1\textstyle
			\mkern#23mu
		\else
			\ifx#1\scriptstyle
				\mkern#22mu
			\else
				\mkern#22mu
			\fi
		\fi
	\fi
}

% change global font to Times New Roman
\RequirePackage{fontspec}
\ifthenelse{\NOT \boolean{tongji@notimes}}{\setmainfont{Times New Roman}}{}

% change equation numbering with Chinese parenthesis
\def\tagform@#1{\maketag@@@{（\ignorespaces#1\unskip\@@italiccorr）}}

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
\RequirePackage[backend=biber,style=gb7714-2015,gbpub=false]{biblatex}
\renewcommand{\citet}[1]{\textcite{#1}}

%%% glutter %%%
\RequirePackage{fancybox}
\fancyput(-0.75cm,-13cm){\parbox{1em}{┊┊┊┊┊┊┊┊┊┊┊┊┊装┊┊┊┊┊订┊┊┊┊┊线┊┊┊┊┊┊┊┊┊┊┊┊┊}}

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
\newcommand*{\tabref}[1]{\tablename~\ref{#1}}
\newcommand*{\figref}[1]{\figurename~\ref{#1}}
\newcommand*{\algoref}[1]{算法~\ref{#1}}
\newcommand*{\listingref}[1]{\lstlistingname~\ref{#1}}
\renewcommand*{\eqref}[1]{公式（\ref{#1}）}
\newcommand*{\secref}[1]{第~\ref{#1}~节}
\newcommand*{\chapref}[1]{第~\ref{#1}~章}

%%% tables %%%
\RequirePackage{booktabs,multirow,longtable,diagbox}

% redefining table/tabular/tabularx/longtable environments with texts of \zihao{-5}
\renewcommand{\arraystretch}{1.2}

\AtBeginEnvironment{table}{\zihao{-5}}
\AtBeginEnvironment{tabular}{\zihao{-5}}
\AtBeginEnvironment{tabularx}{\zihao{-5}}
\AtBeginEnvironment{longtable}{\zihao{-5}}

%%% captions %%%
\RequirePackage[skip=3pt,width=.8\textwidth,font=small,labelsep=space]{caption}

\RequirePackage{subcaption}
\DeclareCaptionLabelFormat{quanjiaoparens}{（{#2}）}
\captionsetup[sub]{font=small,labelformat=quanjiaoparens}

% continued captions for longtables
\DeclareCaptionLabelFormat{continuedlabel}{续#1#2}
\DeclareCaptionStyle{continued}[justification=raggedleft]{skip=3pt,width=.75\textwidth,font=small,labelformat=continuedlabel}

%%% figures %%%
\RequirePackage{graphicx,float}

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
\RequirePackage{xcolor}
\RequirePackage[chapter]{minted}	% listings sucks, use minted, require installation of pygmentize
\RequirePackage{mdframed}	%achieve code box
\mdfdefinestyle{codebox}{
	leftmargin=3em,
	rightmargin=3em,
	innertopmargin=1em,
	innerbottommargin=1em,
	linewidth=0.6pt
}
\newminted{python}{
	linenos=true,
	breaklines=true,
	breakanywhere=true,
	frame=none,
	python3=true,
	fontsize=\zihao{5},
	numbersep=2em,
	style=default,
	tabsize=2,
	xleftmargin=0.5em,
	xrightmargin=0.5em,
	}
\newminted{bash}{
	linenos=true,
	breaklines=true,
	breakanywhere=true,
	frame=none,
	fontsize=\zihao{5},
	numbersep=2em,
	style=default,
	tabsize=2,
	xleftmargin=0.5em,
	xrightmargin=0.5em,
	}
\newminted{cpp}{
	linenos=true,
	breaklines=true,
	breakanywhere=true,
	frame=none,
	fontsize=\zihao{5},
	numbersep=2em,
	style=default,
	tabsize=2,
	xleftmargin=0.5em,
	xrightmargin=0.5em,	
	}
\iftongji@color
	\relax
\else
	\usemintedstyle{bw}
\fi
\renewcommand{\theFancyVerbLine}{\rmfamily \textcolor{gray}{\zihao{5} \oldstylenums{\arabic{FancyVerbLine}}}} %re-define line numbers format
\renewcommand{\listingscaption}{代码}

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
\newcommand{\circled}[2][]{
	\tikz[baseline=(char.base)]{
		\node[shape = circle, draw, inner sep = 1pt]
		(char) {\phantom{\ifblank{#1}{#2}{#1}}};%
		\node at (char.center)
		{\makebox[0pt][c]{#2}};
	}
}
\robustify{\circled}
\newcommand{\dcircled}[1]{\circled[00]{#1}}

\RequirePackage{enumitem,calc}
\setlist[enumerate,1]{label=（\arabic*）}
\setlist[enumerate,2]{label=\circled{\arabic*}}

% first line indention only
\newlist{fitemize}{itemize}{1}
\setlist[fitemize]{
	label={\(\bullet\)},
	align=right,
	labelwidth=2.5em,
	labelsep=.5em,
	itemindent=3em,
	leftmargin=0pt,
	nosep
}

\newlist{fbenumerate}{enumerate}{1}
\setlist[fbenumerate]{
	label={[\arabic*]},
	align=right,
	labelwidth=2.5em,
	labelsep=.5em,
	itemindent=3em,
	leftmargin=0pt,
	nosep
}

\setlist[itemize]{
	labelwidth=*,
	labelindent=\parindent,
	leftmargin=*,
	labelsep=.5em,
	nosep
}
\setlist[enumerate]{
	labelwidth=*,
	labelindent=\parindent,
	leftmargin=*,
	labelsep=0pt,
	nosep
}

%%% misc %%%
\renewcommand{\frontmatter}{
	\cleardoublepage
	\@mainmatterfalse
	\pagenumbering{Roman}
}

% debug for framing and line numbering
\iftongji@debug
	\geometry{showframe}
	
	\RequirePackage[mathlines]{lineno}
	\setpagewiselinenumbers
	\linenumbers
	% \modulolinenumbers[5]
\fi

% circled numbering for footnote
\RequirePackage[perpage,symbol*]{footmisc}
\DefineFNsymbols{fncircled}{①②③④⑤⑥⑦⑧⑨⑩}
\setfnsymbol{fncircled}
\renewcommand\@makefntext[1]{\@thefnmark~#1}

%%% front cover %%%
\let\oldtabular\tabular
\let\endoldtabular\endtabular
\newenvironment{information}[1][h!]{
	\renewcommand{\arraystretch}{1.5}
	\setlength{\tabcolsep}{8pt}
	\zihao{-3}\oldtabular[#1]
	}{\renewcommand{\arraystretch}{1.2}\endoldtabular
}
\newcommand{\ulinecentered}[1]{\uline{\makebox[18em][c]{#1}}}
%\newcommand{\ulinecentered}[1]{\fbox[b]{\parbox[t]{18em}{\centering #1}}}

\RequirePackage{array}
\newcolumntype{M}[1]{>{\centering\arraybackslash}m{#1}}

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

	\begin{information}{M{4em}M{18em}}	
		课题名称 & \ulinecentered{\tongji@thesistitle}\\
		副\enskip{}标\enskip{}题 & \ulinecentered{\tongji@thesissubtitle}\\
		学\quad{}\quad{}院 & \ulinecentered{\tongji@school}\\
		专\quad{}\quad{}业 & \ulinecentered{\tongji@major}\\
		学生姓名 & \ulinecentered{\tongji@thesisauthor}\\
		学\quad{}\quad{}号 & \ulinecentered{\tongji@authorschoolnumber}\\
		指导教师 & \ulinecentered{\tongji@advisor}\\
		日\quad{}\quad{}期 & \ulinecentered{\tongji@thesisyear{}年\tongji@thesismonth{}月\tongji@thesisday{}日}\\
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
