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
      \draw[thin]
      ([shift={(\horizontaloffset-\columnsep,\verticaloffset-\columnsep)}]current page.south west)
      rectangle
      ([shift={(\horizontaloffset+\textwidth+\columnsep,\verticaloffset+\textheight+\columnsep)}]current page.south west);
      \draw[thin]
      ([shift={(\horizontaloffset-\columnsep,\verticaloffset+\textheight+\columnsep-5mm)}]current page.south west)
      -- ([shift={(\horizontaloffset+\textwidth+\columnsep,\verticaloffset+\textheight+\columnsep-5mm)}]current page.south west);
      
      \ifnum\value{page}=1
      \draw[thin]
      ([shift={(\horizontaloffset+\textwidth/2+\columnsep,\verticaloffset+\textheight+\columnsep-5mm)}]current page.south west)
      -- ([shift={(\horizontaloffset+\textwidth/2+\columnsep,\verticaloffset+\textheight+\columnsep-15mm)}]current page.south west);
      \draw[thin]
      ([shift={(\horizontaloffset+3\textwidth/4+\columnsep,\verticaloffset+\textheight+\columnsep-5mm)}]current page.south west)
      -- ([shift={(\horizontaloffset+3\textwidth/4+\columnsep,\verticaloffset+\textheight+\columnsep-10mm)}]current page.south west);
      \draw[thin]
      ([shift={(\horizontaloffset+\textwidth/2+\columnsep,\verticaloffset+\textheight+\columnsep-10mm)}]current page.south west)
      -- ([shift={(\horizontaloffset+\textwidth+\columnsep,\verticaloffset+\textheight+\columnsep-10mm)}]current page.south west);
      \draw[thin]
      ([shift={(\horizontaloffset-\columnsep,\verticaloffset+\textheight+\columnsep-15mm)}]current page.south west)
      -- ([shift={(\horizontaloffset+\textwidth+\columnsep,\verticaloffset+\textheight+\columnsep-15mm)}]current page.south west);
      \fi
    \end{tikzpicture}
  }%
}

\endinput
