\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{sheet}[2023/09/25 Custom Exercise Sheet Class based on scrartcl]

\RequirePackage{etoolbox}
\newbool{english}
\DeclareOption{english}{\booltrue{english}}
\ProcessOptions{\relax}

\LoadClass[paper=a4,DIV=calc]{scrartcl}
% \LoadClass[paper=a4,DIV=calc,usegeometry]{scrartcl}

\RequirePackage[headsepline=true,footsepline=false]{scrlayer-scrpage}
\RequirePackage{tumcolors}
\RequirePackage[use-files]{xsim}
\xsimsetup{
    exercise/within = section,
    exercise/the-counter = \thesection.\arabic{exercise}
}

% to reduce bottom margin
% also add 'usegeometry' to scrartcl class
% \RequirePackage[bottom=4cm]{geometry}

\newcommand{\shorttitle}[1]{
    \gdef\@shorttitle{#1}
}

% header style
\ihead{\@shorttitle}
\ohead{\@subtitle}

% conditional compilation
\RequirePackage{substr}
\IfSubStringInString{\detokenize{solution}}{\jobname}{
    \xsimsetup{solution/print=true}
}{}

% required for title page style
\RequirePackage[svgpath=resources, inkscapepath=out/aux]{svg}
\RequirePackage{tikz}
\usetikzlibrary{calc}

\renewcommand{\@maketitle}{
    \begin{tikzpicture}[overlay, remember picture]
        \node[anchor=north west] (infologo)
            at ($ (current page.north west) + (+24mm, -19mm) $)
            {\includesvg[height=15mm]{in-logo.svg}};

        \node[anchor=north east] (tumlogo)
            at ($ (current page.north east) + (-24mm, -19mm) $)
            {\includesvg[height=10mm]{tum-logo.svg}};
    \end{tikzpicture}

    \vspace{-10mm}

    \begin{center}
        Technical University of Munich

        \Large \textbf{\@title} \smallskip

        \normalsize \@date \smallskip

        \@author
    \end{center}

    \vspace{-7mm}

    \par\noindent\rule{\textwidth}{0.4pt}

    \vspace{-3mm}

    \begin{center}
        \Large \textbf{\@subtitle}
    \end{center}

    \smallskip
    \small
}

\ifbool{english}{
    \RequirePackage[english]{babel}
}{
    \RequirePackage[ngerman]{babel}
}
\RequirePackage[utf8]{inputenc}
\RequirePackage{amsmath}
\RequirePackage{amssymb}

\RequirePackage[T1]{fontenc} % fixes ~ in mintinline (see: https://github.com/gpoore/minted/issues/2)

\RequirePackage{microtype}
\RequirePackage{lmodern}
\RequirePackage{ragged2e}
\RequirePackage{hyperref}
\RequirePackage{cleveref}
\RequirePackage{calc}

\RequirePackage[outputdir=out/aux]{minted}
\usemintedstyle{lovelace}
\setminted{fontsize=\small, autogobble=true, bgcolor=TUMBlue!5!TUMWhite, breaklines=true}

\RequirePackage{tikz}
\usetikzlibrary{positioning}

\newcommand{\myhref}[2]{\href{#1}{\color{blue}#2}}
\newcommand{\myurl}[1]{{\color{blue}\url{#1}}}

\ifbool{english}{
    \crefname{exercise}{Exercise}{Exercises}
    \title{Exercises Productivity in digital Research}
}{
    \crefname{exercise}{Übung}{Übungen}
    \title{Übungen Rechnereinführung WS 2023/24}
}

\author{Adrian Stein Thomas Lindae Alexandros Stathakopoulos} % modify here and include the names in some copyright page
\date{October 2024}

\shorttitle{Productivity in digital Research WS 2024/25}
