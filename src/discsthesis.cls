%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%% File: discsthesis.cls, version 3.1, October 10, 2005
%%% Modifications for DISCS thesis format are copyrighted (c) 2005 by
%%% Andrei Coronel, Reena Estuar, JP Vergara and Eric Vidal.  All rights
%%% reserved.
%%%
%%% Please note that most of the instructions below are not valid for this
%%% version.  We will probably need to integrate our changes with the Math
%%% department's template in the future.
%%%
%%% Original copyright notice follows.
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%% File: admuthesis.cls, version 3.0, May 11, 2005
%%% ===============================================
%%% Copyright (c) 2005 by Felix Pozon Muga II.  All rights reserved.
%%% =============================================
%%%
%%%
%%% (1) This copyright notice is kept intact on all modified copies.
%%% (2) If you modify this file, you MUST NOT use the original file name.
%%%
%%% This file defines macros used for preparing theses for
%%% Ateneo de Manila University Mathematics Department.
%%% It has been tested with LaTeX2e.
%%% I do NOT guarantee that it will meet all requirements of the
%%% Graduate School; however, if you find that something violates the
%%% specifications, please send me email at <fpmuga@admu.edu.ph> and
%%% I will try to fix it.
%%%
%%% ADMUTHESIS.CLS v3.0 is based on UTTHESIS.STY written by Dinesh Das
%%%
%%% Usage:
%%% ======
%%%
%%% To use this file with LaTeX2e, make sure your TEXINPUTS environment
%%% variable contains the directory in which this file is located.
%%% Include this file as a package in the preamble:
%%%
%%% \documentclass{admuthesis}
%%%
%%% On non-UNIX systems, there might be different environment variables
%%% that might need to be set.  I know nothing about such machines,
%%% however; consult your local guru for details.
%%%
%%% A template for a thesis is provided in the file "admuthesis.tex", available
%%% from the same place where you obtained this file.
%%% Another template "admuthesis2.tex" breaks the thesis into many sub-files.
%%% The subfiles are classified into 3 groups determined by its extension name.
%%% These are: 1. frontmatter files -- "xxx.fmf"
%%%            2. mainmatter files  -- "xxx.mmf"
%%%            3. backmatter files  -- "xxx.bmf"
%%% Frontmatter files are:
%%%           acknowledgement page  -- "acknowledge.fmf"
%%%           abstract page         -- "abstract.fmf"
%%% Mainmatter files are:
%%%           Chapter 1 file        -- "chapter1.mmf"
%%%           Chapter 2 file        -- "chapter2.mmf"
%%%           Chapter 3 file        -- "chapter3.mmf"
%%%             . . .
%%%           Chapter n file        -- "chaptern.mmf"
%%% Backmatter files are:
%%%           Bibliography file     -- "biblio.bmf"
%%%           Appendix 1 file       -- "appendix1.bmf"
%%%           Appendix 2 file       -- "appendix2.bmf"
%%%             . . .
%%%           Appendix n file       -- "appendixn.bmf"
%%%
%%% Command Names:
%%% ==============
%%%
%%% ALL command names used in this file that are used to format the
%%% thesis begin with "thesis" (e.g., \ThesisAuthor).  All of these
%%% commands can be changed by the user using
%%%
%%% \ThesisAuthor{Felix P. Muga II}
%%%
%%% after loading the package in LaTeX2e.
%%%
%%% The following is a list of all thesis-related variables used together
%%% with their default values:
%%%
%%% \UniversityName    %% Name of the University
%%% \ThesisAuthor      %% Name of the author; defaults to "Ako Estudyante".
%%% \DateOfDefense %% Date of Thesis Defense; defaults to "10 May 2005".
%%% \ThesisDefenseYear %% Year of graduation; defaults to "2005".
%%% \ThesisTitle       %% Full title of dissertation; defaults to "Title".
%%% \ThesisAdviser     %% Name of thesis adviser; defaults to "Adviser"
%%% \ThesisType        %% Type of thesis; defaults to "M.S.".
%%% \ThesisDegree      %% Degree for which thesis is submitted; defaults to
%%%                    %% "Master of Science".
%%% \CompreDatesPassed %% Date or Dates the Comprehensive is taken and passed
%%% \ThesisGrade       %% Grade of the Thesis or Dissertation
%%% \SchoolHead        %% Dean of the School
%%% \SchoolHeadPosition      %% Actual Position, either Dean or Acting Dean
%%% \DepartmentName   %% Name of the Department or Program
%%% \DepartmentHead   %% Chair of the Department or Program
%%% \DepartmentHeadPosition     %% Actual Position, either Chair, Acting Chair, or
%%% \FirstPanelMember  %% Thesis/Dissertation Panel Member
%%% \SecondPanelMember %% Thesis/Dissertation Panel Member
%%% \ThirdPanelMember  %% Thesis/Dissertation Panel Member
%%% \FourthPanelMember %% Thesis/Dissertation Panel Member
%%% \ThesisArea        %% The area or field of the thesis. Default is Mathematics
%%%
%%%
%%% In addition to the above variables, the following commands are
%%% provided to generate the optional sections of the thesis:
%%%
%%% \ThesisTitlePage %% Generates the title page.
%%% \ThesisRecommendationPage
%%%                  %% Generates the recommendation for oral defense
%%% \MSThesisAcceptancePage
%%%                  %% Generates the acceptance page signed by the
%%%                  %% MS thesis panel.
%%% \PhDThesisAcceptancePage
%%%                  %% Generates the acceptance page signed by the
%%%                  %% thesis panel.
%%%
%%% There are also a few environments to generate paragraph-like text:
%%%
%%% \thesisacknowledgments
%%%                  %% Text of acknowledgments.
%%% \thesisabstract   %% Text of abstract.
%%%
%%% Bells and Whistles:
%%% ===================
%%%
%%% The following commands are provided purely for playing around with.
%%% They should be used in the document preamble (before \begin{document}).
%%%
%%% \thesisdraft     %% Prints a timestamp at the top of each page.  This
%%%                  %% must be invoked in the document preamble (before
%%%                  %% \begin{document}).
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 \NeedsTeXFormat{LaTeX2e}
 \ProvidesClass{discsthesis}[2005/05/11 v3.0 Ateneo de Manila University DISCS Thesis Class]
 \RequirePackage{amsmath,newcent,epsfig,
                 amssymb,calc,multicol,array,tabularx,pifont,
                 enumerate,latexsym,ifthen}
 \DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
 \ProcessOptions \LoadClass[12pt]{report}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 \typeout{*************************************************************}
 \typeout{** ADMU DISCS Thesis Class File, version 3.1, 10 Oct 2005}
 \typeout{** Originally Written by Felix Pozon Muga II }
 \typeout{**                       Mathematics Department }
 \typeout{**                       Ateneo de Manila University }
 \typeout{**                       fmuga@ateneo.edu}
 \typeout{** With modifications by Andrei Coronel, Reena Estuar, }
 \typeout{**                       JP Vergara and Eric Vidal }
 \typeout{*************************************************************}
 \typeout{** This Thesis Class File has been updated as of 11 May 2024}
 \typeout{** Modified by Jason Eclarinal, M.S., to satisfy the}
 \typeout{** conditions of the OAVPGE.}
 \typeout{** May this help any and all students and bring lesser}
 \typeout{** headaches from the style reader requirements.}
 \typeout{** (renamed the file because of stipulation 2 above.)}
 \typeout{*************************************************************}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Page layout (margins are set with geometry in main.tex).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 \setlength{\parindent}{12mm}
 \setlength{\headheight}{.375truein}
 \setlength{\headsep}{20pt}
 \setlength{\marginparwidth}{0pt}
 \setlength{\marginparsep}{0pt}
 \setlength{\footskip}{0truein}
 \renewcommand{\baselinestretch}{1.8}
 \pagenumbering{roman}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Thesis fields: \Foo{value} stores the value in \@Foo.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 \newcommand{\@thesisfield}[1]{%
   \expandafter\gdef\csname @#1\endcsname{}%
   \expandafter\newcommand\csname #1\endcsname[1]{%
     \expandafter\gdef\csname @#1\endcsname{##1}}}
 \@for\@tempa:=ThesisTitle,ThesisAuthor,ThesisType,ThesisDegree,ThesisArea,%
   ThesisDefenseYear,DefenseDate,ThesisGrade,ThesisAdviser,UniversityName,%
   SchoolName,SchoolHead,SchoolHeadPosition,DepartmentHead,%
   DepartmentHeadPosition,FirstPanelMember,SecondPanelMember,%
   ThirdPanelMember,FirstColumnAdjust,SecondColumnAdjust%
   \do{\expandafter\@thesisfield\expandafter{\@tempa}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Optional fields: setting them switches on the co-adviser / fourth
%%% panel member layouts further down.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 \newif\ifThesisCoAdviserSet
 \@thesisfield{ThesisCoAdviser}
 \let\@ThesisCoAdviserSetter\ThesisCoAdviser
 \renewcommand{\ThesisCoAdviser}[1]{\@ThesisCoAdviserSetter{#1}\ThesisCoAdviserSettrue}

 \newif\ifFourthPanelMemberSet
 \@thesisfield{FourthPanelMember}
 \let\@FourthPanelMemberSetter\FourthPanelMember
 \renewcommand{\FourthPanelMember}[1]{\@FourthPanelMemberSetter{#1}\FourthPanelMemberSettrue}

 \ThesisDefenseYear{2021}
 \DepartmentHead{ANDREI D. CORONEL, Ph.D.}
 \DepartmentHeadPosition{Chair}
 \SchoolHead{RAPHAEL A. GUERRERO, Ph.D.}
 \SchoolHeadPosition{Dean}
 \SchoolName{School of Science and Engineering}
 \ThesisDegree{Master of Science}
 \ThesisArea{Computer Science}
 \UniversityName{Ateneo de Manila University}
 \FirstColumnAdjust{\hspace*{0pt}}
 \SecondColumnAdjust{\hspace*{0pt}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% \ThesisStyle{MS|PhD}{Final|FinalWithCorner|Draft}{nudge1}{nudge2}
%%% generates the title/recommendation/acceptance pages. FinalWithCorner
%%% leaves the corner marks and draft timestamp on; Final and Draft call
%%% \thesisdraft, which switches them off.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 \newcommand{\@textpagestyle}{myheadings}

 \newcommand{\ThesisStyle}[4]{
  \FirstColumnAdjust{\hspace*{#3}}
  \SecondColumnAdjust{\hspace*{#4}}
   \ifthenelse{\equal{#1}{MS}}
              {\ThesisType{THESIS}
               \ThesisDegree{Master of Science}
               \ifthenelse{\equal{#2}{FinalWithCorner}}
                          {\ThesisTitlePage
                           \ThesisRecommendationPage
                           \MSThesisAcceptancePage}
                          {\ifthenelse{\equal{#2}{Final}}
                                      {\thesisdraft
                                      \ThesisTitlePage
                                      \ThesisRecommendationPage
                                      \MSThesisAcceptancePage
                                      }
                                     {\thesisdraft
                                      \ThesisTitlePage}}
              }
              {\ThesisType{DISSERTATION}
               \ThesisDegree{Doctor of Philosophy}
              \ifthenelse{\equal{#2}{FinalWithCorner}}
              {\ThesisTitlePage
               \ThesisRecommendationPage
               \PhDThesisAcceptancePage}
              {\ifthenelse{\equal{#2}{Final}}
                                      {\thesisdraft
                                      \ThesisTitlePage
                                      \ThesisRecommendationPage
                                      \PhDThesisAcceptancePage
                                      }
                                     {\thesisdraft
                                      \ThesisTitlePage}}
              }
    }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Corner marks and page styles. The defaults below print the corner
%%% marks (cornerhead); \thesisdraft (further down) redefines the three
%%% page styles to drop them.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 \newcommand{\cornerx}{
  \setlength{\unitlength}{1mm}
  \begin{picture}(0,0)
        \linethickness{2pt}
        \put(-7,7){\path(0,-4)(0,0)(4,0)}
        \put(158,7){\path(-4,0)(0,0)(0,-4)}
        \put(158,-222){\path(-4,0)(0,0)(0,4)}
        \put(-7,-222){\path(0,4)(0,0)(4,0)}
        \put(-20,-100){\begin{sideways}
                       \textsl{Draft of \timestamp}
                       \end{sideways}}
      \end{picture}
}
  \newcommand{\cornerhead}{
  \setlength{\unitlength}{1mm}
  \begin{picture}(0,0)
        % ericvids - fixed so that corners work with pdflatex
        \linethickness{0.3pt}
        \put(-7,7){\line(0,-1){4}}
        \put(-7,7){\line(1,0){4}}
        \put(158,7){\line(-1,0){4}}
        \put(158,7){\line(0,-1){4}}
        \put(158,-222){\line(-1,0){4}}
        \put(158,-222){\line(0,1){4}}
        \put(-7,-222){\line(0,1){4}}
        \put(-7,-222){\line(1,0){4}}
      \end{picture}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 \newcommand{\@chaptertype}{\chaptername}
 \newcommand{\@appendix}{0}

\def\ps@empty{%
  \let\@mkboth\@gobbletwo
  \let\@oddfoot\@empty
  \def\@oddhead{\cornerhead\reset@font\hfil$\;$}
  \let\@evenfoot\@empty
  \let\@evenhead\@oddhead
      }
\def\ps@myheadings{\let\@mkboth\@gobbletwo
     \let\@oddfoot\@empty
     \def\@oddhead{\cornerhead\reset@font\hfil\thepage}
     \let\@evenfoot\@empty
     \let\@evenhead\@oddhead
    }
\def\ps@plain{\let\@mkboth\@gobbletwo
  \def\@oddhead{\cornerhead\reset@font\hfil$\;$}
  \def\@oddfoot{\reset@font\hfil\thepage\hfil}
  \let\@evenhead\@oddhead
  \let\@evenfoot\@oddhead
    }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Title page.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 \newcommand{\ThesisTitlePage}{
   \pagestyle{empty}
  \begin{center}
  ATENEO DE MANILA UNIVERSITY
  \vfill
  \textnormal{\@ThesisTitle}

  \vfill
  A \uppercase{\@ThesisType} SUBMITTED TO

  THE GRADUATE FACULTY OF

  THE SCHOOL OF SCIENCE AND ENGINEERING

  IN CANDIDACY FOR THE DEGREE OF

  \MakeUppercase{\@ThesisDegree} IN

  \MakeUppercase{\@ThesisArea}

  \vfill
  DEPARTMENT OF INFORMATION SYSTEMS\\AND COMPUTER SCIENCE

  \vspace{\fill}
  BY

  \MakeUppercase{\textnormal{\@ThesisAuthor}}\\[20pt]

  QUEZON CITY, PHILIPPINES

  \@ThesisDefenseYear
  \end{center}
  \newpage}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Signature block: line, name, and role (role may contain \\).
%%% \@panelmembers and \@advisersignature switch to the two-column
%%% layouts only when \FourthPanelMember / \ThesisCoAdviser were set.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 \newcommand{\@signature}[2]{%
   \shortstack{\underline{\phantom{#1}}\\[0pt]#1\\[0pt]#2}}
 \newcommand{\@deansignature}{%
   \begin{center}
   \begin{tabular}{c}
   \@signature{\@SchoolHead}{\@SchoolHeadPosition\\[0pt]\@SchoolName}
   \end{tabular}
   \end{center}}
% The \if must wrap whole tabular environments, not a mid-table row: a
% conditional as the first token of a tabular body confuses its alignment
% scanning.
 \newcommand{\@panelmembers}{%
   \ifFourthPanelMemberSet
     \begin{center}
     \small
     \begin{tabular}{lcl}
     \@FirstColumnAdjust\@signature{\@FirstPanelMember}{Member} & \quad\;\: &
     \@SecondColumnAdjust\@signature{\@SecondPanelMember}{Member}\\[28pt]
     \@FirstColumnAdjust\@signature{\@ThirdPanelMember}{Member} & \quad &
     \@SecondColumnAdjust\@signature{\@FourthPanelMember}{Member}
     \end{tabular}
     \end{center}
   \else
     \begin{center}
     \small
     \begin{tabular}{lcl}
     \@FirstColumnAdjust\@signature{\@FirstPanelMember}{Member} & \quad\;\: &
     \@SecondColumnAdjust\@signature{\@SecondPanelMember}{Member}\\[28pt]
     \multicolumn{3}{c}{\@signature{\@ThirdPanelMember}{Member}}
     \end{tabular}
     \end{center}
   \fi}
 \newcommand{\@advisersignature}{%
   \ifThesisCoAdviserSet
     \begin{center}
     \begin{tabular}{ll}
     \@signature{\@ThesisAdviser}{Adviser} & \@signature{\@ThesisCoAdviser}{Adviser}
     \end{tabular}
     \end{center}
   \else
     \begin{center}
     \begin{tabular}{c}
     \@signature{\@ThesisAdviser}{Adviser}
     \end{tabular}
     \end{center}
   \fi}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Recommendation for oral defense.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 \newcommand{\ThesisRecommendationPage}{
  \setlength{\topmargin}{-0.6cm}
  \pagestyle{\@textpagestyle}
  \noindent
  The \uppercase\expandafter{\@ThesisType} entitled:

  \begin{center}
  \textbf{\@ThesisTitle}
  \end{center}

  \noindent submitted by \textbf{\@ThesisAuthor{}} has been examined and is recommended for \textbf{Oral Defense}.

  \vfill
  \ifThesisCoAdviserSet
    \begin{center}
    \small
    \begin{tabular}{lcl}
    \multicolumn{3}{c}{\@signature{\@DepartmentHead}{\@DepartmentHeadPosition}}\\[28pt]
    \@FirstColumnAdjust\@signature{\@ThesisAdviser}{Adviser} & \quad &
    \@SecondColumnAdjust\@signature{\@ThesisCoAdviser}{Adviser}
    \end{tabular}
    \end{center}
  \else
    \begin{center}
    \small
    \begin{tabular}{lcl}
    \@FirstColumnAdjust\@signature{\@DepartmentHead}{\@DepartmentHeadPosition} &
    \@SecondColumnAdjust\@signature{\@ThesisAdviser}{Adviser}\\[28pt]
    \end{tabular}
    \end{center}
  \fi

  \vfill
  \small
  \vspace*{-4.5cm}
  \@deansignature

  \strut\vfill
  \newpage}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Acceptance page signed by the MS thesis panel.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 \newcommand{\MSThesisAcceptancePage}{
    \setlength{\topmargin}{-0.6cm}
    \pagestyle{\@textpagestyle}
    \noindent
   The Faculty of the Department of Information Systems and Computer Science, School of Science and Engineering,
   \@UniversityName{}\\ ACCEPTS THE THESIS entitled:

  \vfill
  \begin{center}
  \textbf{\@ThesisTitle}
  \end{center}

   \vfill
  \noindent submitted by \textbf{\@ThesisAuthor{}} in partial fulfillment of the requirements for the degree of
 {\@ThesisDegree{}} in \@ThesisArea.

  \vfill
  \@panelmembers

  \vfill
  \@advisersignature

  \vfill
  \@deansignature

  \vfill
  \noindent Grade: {\@ThesisGrade}\\[-8pt]
  Date:$\;\;\;$ \@DefenseDate
\newpage}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Acceptance page signed by the dissertation panel.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 \newcommand{\PhDThesisAcceptancePage}{
    \setlength{\topmargin}{0.0in}
    \noindent
    The Faculty of the Department of Information Systems and Computer Science, School of Science and Engineering,
    \@UniversityName{}\\ \uppercase{accepts the}
    \uppercase\expandafter{\@ThesisType} entitled:

  \begin{center}
  \textbf{\@ThesisTitle}
  \end{center}

   \vfill
  \noindent submitted by \@ThesisAuthor{} in partial fulfillment of the requirements for the Degree of
  \@ThesisDegree{} in \@ThesisArea.
  \vfill

  \vfill
  \@panelmembers

  \vfill
  \@advisersignature

  \vfill
  \@deansignature

  \vfill
  \noindent Grade: {\@ThesisGrade}\\[8pt]
  Date:$\;\;\;$ \@DefenseDate
  \newpage}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Abstract and acknowledgments: titled, double-spaced front-matter pages.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 \newcommand{\@frontmatterpage}[1]{%
   \setlength{\topmargin}{-0.6cm}%
   \pagestyle{\@textpagestyle}%
   \vspace*{-1.5cm}%
   \centerline{\textbf{#1}}%
   \addcontentsline{toc}{chapter}{#1}%
   \vspace*{18pt}%
   \begin{spacing}{2}}
 \newenvironment{acknowledgments}
   {\@frontmatterpage{ACKNOWLEDGMENTS}}
   {\end{spacing}\par\newpage}
 \newenvironment{thesisabstract}
   {\@frontmatterpage{ABSTRACT}}
   {\end{spacing}\par\newpage}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Table of contents, list of figures, list of tables.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 \renewcommand{\contentsname}{TABLE OF CONTENTS}
 \renewcommand{\listfigurename}{LIST OF FIGURES}
 \renewcommand{\listtablename}{LIST OF TABLES}

 \renewcommand{\tableofcontents}{%
   \setlength{\baselineskip}{18pt}%
   \setlength{\topmargin}{-0.6cm}%
   \pagestyle{\@textpagestyle}%
   \vspace*{-1.2cm}%
   \centerline{\textbf{\contentsname}}%
   \vspace*{18pt}%
   \@starttoc{toc}%
   \vfill
   \newpage}

% #1 = title, #2 = file extension, #3 = extra material added to the TOC
 \newcommand{\@thesislist}[3]{%
   \setlength{\topmargin}{-0.6cm}%
   \pagestyle{\@textpagestyle}%
   \vspace*{9.0mm}%
   \centerline{\textbf{#1}}%
   \vspace*{18pt}%
   \addcontentsline{toc}{chapter}{#1}%
   #3%
   \@starttoc{#2}%
   \vfill
   \newpage}
 \renewcommand{\listoffigures}{\@thesislist{\listfigurename}{lof}{}}
 \renewcommand{\listoftables}{\@thesislist{\listtablename}{lot}{%
   \addtocontents{toc}{\protect\contentsline{part}{\normalsize\textnormal{CHAPTER}}{}{}}}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Chapters and appendices. \appendix{Title} starts a lettered appendix.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 \renewcommand{\thechapter}{\arabic{chapter}}

 \renewcommand{\chapter}{
   \setlength{\topmargin}{-0.6cm}
   \clearpage
   \ifnum\@appendix=1
      \renewcommand{\@chapapp}{\appendixname}%
      \renewcommand{\thechapter}{\Alph{chapter}}
      \renewcommand{\@chaptertype}{\appendixname}
   \else
      \renewcommand{\@chaptertype}{\chaptername}
   \fi
   \vspace*{5.3mm}
   \thispagestyle{empty}%
   \global\@topnum\z@
   \@afterindentfalse
   \secdef\@chapter\@schapter
   }

 \renewcommand\appendix{\par
  \setcounter{section}{0}%
   \setlength{\topmargin}{0.0in}
   \clearpage
   \ifnum\@appendix=1
     \renewcommand{\@chapapp}{\appendixname}%
     \renewcommand{\thechapter}{\Alph{chapter}}
     \renewcommand{\@chaptertype}{\appendixname}
   \else
     \setcounter{chapter}{0}
     \renewcommand{\thechapter}{\Alph{chapter}}
     \renewcommand{\@chapapp}{\appendixname}
     \renewcommand{\@chaptertype}{\appendixname}
     \renewcommand{\@appendix}{1}
   \fi
   \thispagestyle{empty}%
   \global\@topnum\z@
   \@afterindentfalse
   \secdef\@chapter\@schapter
   }

 \def\@chapter[#1]#2{
   \ifnum \c@secnumdepth >\m@ne
     \refstepcounter{chapter}%
     \typeout{\@chapapp\space\thechapter.}%
     \ifnum\@appendix=0
       \addcontentsline{toc}{chapter}{\hspace*{30pt}\protect\numberline{\Roman{chapter}} #1}%
     \else
       \addcontentsline{toc}{chapter}{\hspace*{30pt}\protect\numberline{\Alph{chapter}} #1}%
     \fi
   \else
     \addcontentsline{toc}{chapter}{\@chaptertype{} #1}%
   \fi
   \ifnum\value{chapter}=1
     \ifnum\@appendix=0
       \pagestyle{\@textpagestyle}%
       \pagenumbering{arabic}%
     \fi
   \fi
   \chaptermark{#1}%
   \addtocontents{lof}{\protect\addvspace{10\p@}}%
   \addtocontents{lot}{\protect\addvspace{10\p@}}%
   \@makechapterhead{#2}%
   \@afterheading}

 \def\@makechapterhead#1{%
   {\parindent\z@ \centering \reset@font
     \ifnum \c@secnumdepth >\m@ne
       \ifnum\@appendix=0
         \bfseries \MakeUppercase\@chapapp{} \Roman{chapter}
       \else
         \bfseries \MakeUppercase\@chapapp{} \Alph{chapter}
       \fi
       \par
       \vskip 5\p@
     \fi
     #1\par
     \nobreak
     \vskip 30\p@
   }}
 \def\@makeschapterhead#1{%
   \vspace*{2\p@}%
   {\parindent \z@ \centering \reset@font
     \bfseries #1\par
     \nobreak
     \vskip 30\p@
   }}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% TOC entries: dotted leaders for chapters too.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 \def\Dotfill{%
  \leavevmode
  \cleaders \hb@xt@ .75em{\hss.\hss}\hfill
  \kern\z@}
 \renewcommand*\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip 1.0em \@plus\p@
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak\Dotfill
      \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
      \penalty\@highpenalty
    \endgroup
  \fi}
 \renewcommand*\l@section{\@dottedtocline{1}{4.25em}{2.3em}}
 \renewcommand*\l@subsection{\@dottedtocline{2}{6.55em}{3.2em}}
 \renewcommand*\l@subsubsection{\@dottedtocline{3}{10.75em}{4.1em}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Bibliography (from report.cls, (c) LaTeX3 Project).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 \renewenvironment{thebibliography}[1]
     { \chapter*{
        \vspace*{-2.0cm}
        {\MakeUppercase\bibname}
        \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}}%
      \setlength{\baselineskip}{30pt}
      \addcontentsline{toc}{chapter}{\MakeUppercase\bibname}
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Command to print draft version of the thesis.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 \newcommand{\thesisdraft}{
   \renewcommand{\@textpagestyle}{myheadings}
     \def\ps@myheadings{\let\@mkboth\@gobbletwo%
     \let\@oddfoot\@empty
      \def\@oddhead{\reset@font\hfil\thepage}
      \let\@evenfoot\@empty
      \let\@evenhead\@oddhead
    }
  \renewcommand\ps@empty{%
  \let\@mkboth\@gobbletwo
  \let\@oddfoot\@empty
  \let\@oddhead\@empty
  \let\@evenfoot\@empty
  \let\@evenhead\@oddhead
   }
  \renewcommand\ps@plain{\let\@mkboth\@gobbletwo
    \def\@oddhead{\reset@font\hfil$\;$}
    \def\@oddfoot{\reset@font\hfil\thepage\hfil}
    \let\@evenhead\@oddhead
    \let\@evenfoot\@oddhead
     }
    }
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Code to compute current timestamp.  Some parts by Martin Minow.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 \newcount\hour \newcount\minute
 \hour=\time  \divide \hour by 60 \minute=\time \loop \ifnum
 \minute > 59 \advance \minute by -60 \repeat
 \def\thesistime{\ifnum \hour<13 \number\hour:%
                      \ifnum \minute<10 0\fi
                      \number\minute
                      \ifnum \hour<12 \ am\else \ pm\fi
         \else \advance \hour by -12 \number\hour:%
                      \ifnum \minute<10 0\fi
                      \number\minute \ pm\fi}

 \def\DateOfDefense{\ifcase\month\or
 January\or February\or March\or April\or May\or June\or July\or
 August\or September\or October\or November\or December\fi
 \space\number\day, \number\year}

 \newcount\dow
 \newcount\leap
 \newcount\x
 \newcount\y

%leap = year + (month - 14)/12
 \leap=\month \advance\leap by -14 \divide\leap by 12
  \advance\leap by \year

%dow = (13 * (month + 10 - (month + 10)/13*12) - 1)/5
 \dow=\month \advance\dow by 10
  \y=\dow \divide\y by 13 \multiply\y by 12
  \advance\dow by -\y \multiply\dow by 13 \advance\dow by -1 \divide\dow by 5

%dow += day + 77 + 5 * (leap % 100)/4
 \advance\dow by \day \advance\dow by 77
  \x=\leap \y=\x \divide\y by 100 \multiply\y by 100 \advance\x by -\y
  \multiply\x by 5 \divide\x by 4 \advance\dow by \x

%dow += leap / 400
 \x=\leap \divide\x by 400 \advance\dow by \x

%dow -= leap / 100 * 2;
%dow = (dow % 7)
 \x=\leap \divide\x by 100 \multiply\x by 2 \advance\dow by -\x
  \x=\dow \divide\x by 7 \multiply\x by 7 \advance\dow by -\x

 \def\thesisdayofweek{\ifcase\dow
 Sunday\or Monday\or Tuesday\or Wednesday\or Thursday\or Friday\or
 Saturday\fi}

 \def\timestamp{\thesistime, \thesisdayofweek, \DateOfDefense}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Line spacing. spacing environment from spacing.sty (Stephen Page) / MIT;
%%% footnotes are single-spaced (from the Stanford thesis style).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 \def\@newbaseline{%
   \ifx\undefined\setnew@baselineskip
     \baselineskip\f@baselineskip\relax
   \else
     \setnew@baselineskip
   \fi
   \baselineskip\baselinestretch\baselineskip
   \setbox\strutbox\hbox{\vrule\@height.7\baselineskip
     \@depth.3\baselineskip \@width\z@}%
   \normalbaselineskip\baselineskip}
 \long\def\@footnotetext#1{\insert\footins{\def\baselinestretch{1}\footnotesize
   \interlinepenalty\interfootnotelinepenalty
   \splittopskip\footnotesep
   \splitmaxdepth \dp\strutbox \floatingpenalty \@MM
   \hsize\columnwidth \@parboxrestore
   \edef\@currentlabel{\csname p@footnote\endcsname\@thefnmark}\@makefntext
   {\rule{\z@}{\footnotesep}\ignorespaces
     #1\strut}}}
 \def\spacing#1{\par
   \begingroup
   \def\baselinestretch{#1}
   \@newbaseline}
 \def\endspacing{\par
   \vskip \parskip
   \vskip \baselineskip
   \endgroup
   \vskip -\parskip
   \vskip -\baselineskip}

 \renewcommand\section{\@startsection{section}{1}{\z@}%
                                    {-3.5ex \@plus -1ex \@minus -.2ex}%
                                    {2.3ex \@plus.2ex}%
                                    {\normalfont\bfseries}}
 \renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                      {-3.25ex\@plus -1ex \@minus -.2ex}%
                                      {1.5ex \@plus .2ex}%
                                      {\normalfont\bfseries}}
 \renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                      {-3.25ex\@plus -1ex \@minus -.2ex}%
                                      {1.5ex \@plus .2ex}%
                                      {\normalfont\bfseries}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Captions: "Figure 1.1. Caption" (period instead of colon).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 \long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{#1. #2}%
  \ifdim \wd\@tempboxa >\hsize
    #1. #2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}
