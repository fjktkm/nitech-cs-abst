\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{nitech-cs-abst}

\newif\ifnitech@twoside
\nitech@twosidetrue

\DeclareOption{twoside}{\nitech@twosidetrue}
\DeclareOption{oneside}{\nitech@twosidefalse}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{jlreq}}

\ProcessOptions\relax

\edef\nitech@jlreqoptions{
  twocolumn,
  a4paper,
  fontsize=9pt,
  head_space=2cm,
  foot_space=2cm
}
\ifnitech@twoside
  \edef\nitech@jlreqoptions{
    \nitech@jlreqoptions,
    twoside,
    fore-edge=2cm
  }
\else
  \edef\nitech@jlreqoptions{
    \nitech@jlreqoptions,
    oneside
  }
  
\fi

\LoadClass[\nitech@jlreqoptions]{jlreq}

\NewPageStyle{fully-empty}{nombre=}
\pagestyle{fully-empty}

\RequirePackage{atbegshi}
\RequirePackage{tikz}
\RequirePackage{ifoddpage}

\AtBeginShipout{%
  \AtBeginShipoutUpperLeft{%
    \ifodd\value{page}
      \edef\horizontaloffset{\dimexpr1in+\oddsidemargin\relax}
    \else
      \edef\horizontaloffset{\dimexpr1in+\evensidemargin\relax}
      
    \fi
    
    \edef\verticaloffset{\dimexpr1in+\topmargin+\headheight+\headsep\relax}
    
    \begin{tikzpicture}[remember picture,overlay]
      \draw[thick]
      ([shift={(\horizontaloffset-\columnsep,\verticaloffset-\columnsep)}]current page.south west)
      rectangle
      ([shift={(\horizontaloffset+\textwidth+\columnsep,\verticaloffset+\textheight+\columnsep)}]current page.south west);
    \end{tikzpicture}
  }%
}

\endinput
