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
  foot_space=2cm,
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

\NewPageStyle{fully-empty}{
  odd_running_head=,
  even_running_head=,
  nombre=
}
\pagestyle{fully-empty}
