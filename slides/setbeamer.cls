\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{setbeamer}[2024/07/11]

\RequirePackage{etoolbox}
\RequirePackage{substr}

% see <https://www.ojdo.de/wp/2015/03/how-to-horizontally-align-beamer-columns-with-surrounding-text/>
% and <https://github.com/josephwright/beamer/issues/262>
% for why the onlytextwidth argument is needed
\PassOptionsToClass{german, aspectratio=169, onlytextwidth}{tumbeamer}

\IfSubStringInString{\detokenize{handout}}{\jobname}{
    \PassOptionsToClass{handout=true}{tumbeamer}
}{}

\LoadClass{tumbeamer}

\RequirePackage{amsmath}
\RequirePackage{ragged2e}
\RequirePackage{ifthen}
\RequirePackage{tcolorbox}
\RequirePackage[outputdir=out/aux]{minted}
\usemintedstyle{lovelace}
\setminted{fontsize=\small,autogobble=true}

\tcbuselibrary{minted}

% see https://tex.stackexchange.com/questions/433256/inline-tcolorbox-with-rotated-title
% and https://tex.stackexchange.com/questions/181082/how-to-reproduce-this-box-in-tcolorbox
% and https://tex.stackexchange.com/questions/558875/tcolorbox-how-to-make-a-variant-of-the-mylib
\newtcbox{\TUMInlineBox}{enhanced, nobeforeafter, tcbox raise base,
    boxrule=0.05mm, top=0mm, bottom=0mm, right=0mm, left=0mm, arc=0.5mm, boxsep=0.4mm, before upper={\vphantom{dlg}},
    colback=TUMBlue!5!TUMWhite, colframe=TUMBlue}
\newcommand{\TUMCodeInline}[2]{\TUMInlineBox{\mintinline{#1}{#2}}}

\newcommand{\myhref}[2]{\href{#1}{\color{blue}#2}}
\newcommand{\myurl}[1]{{\color{blue}\url{#1}}}

\renewtcolorbox{TUMBox}[3][TUMBlue]{ TUMBox = #1, title = #3, #2 }
\renewtcolorbox{TUMBoxVariant}[3][TUMBlue]{ TUMBoxVariant = #1, title = #3, #2 }
\renewtcolorbox{TUMBoxFill}[3][TUMBlue]{ TUMBoxFill = #1, title = #3, #2 }
\renewtcolorbox{TUMBoxInverse}[3][TUMBlue]{ TUMBoxInverse = #1, title = #3, #2 }

\newtcblisting{TUMListing}[2][]{ TUMBox = TUMBlue, title = #2, #1 }
\newtcblisting{TUMCodeBlock}[3][]{ TUMBox = TUMBlue, listing only, title = #2, minted language = #3, #1 }

% https://tex.stackexchange.com/questions/30720/footnote-without-a-marker/30726#30726
\newcommand{\marklessfootnote}[1]{
    \begingroup
    \renewcommand{\thefootnote}{}
    \footnote{#1}
    \addtocounter{footnote}{-1}
    \endgroup
}

\author{Adrian Stein, Thomas Lindae}

\TUMbeamersetup {
    title page   = TUM tower,      % style of the title page
    part page    = TUM default,    % style of part pages
    section page = TUM centered,   % style of section pages
    content page = TUM more space, % style of normal content pages
    tower scale  = 1.0,            % scaling factor of TUM tower (if used)
    headline     = TUM empty,      % which variation of headline to use
    footline     = TUM infoline,   % which variation of footline to use
    % configure on which pages headlines and footlines should be printed
    headline on  = {title page},
    footline on  = {every page, title page=false},
}
% available frame styles for title page, part page, and section page:
% TUM default, TUM tower, TUM centered,
% TUM blue default, TUM blue tower, TUM blue centered,
% TUM shaded default, TUM shaded tower, TUM shaded centered,
% TUM flags
%
% additional frame styles for part page and section page:
% TUM toc
%
% available frame styles for content pages:
% TUM default, TUM more space
%
% available headline options:
% TUM empty, TUM oneliner, TUM twoliner, TUM threeliner, TUM logothreeliner
%
% available footline options:
% TUM empty, TUM default, TUM infoline
