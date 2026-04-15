% ara-proposal.cls
% LaTeX class for Amazon Research Awards (ARA) proposals
% Usage: \documentclass[11pt]{ara-proposal}
%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ara-proposal}[2026/04/12 Amazon Research Awards Proposal Class]

% Pass options to the base class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[11pt]{article}

% ==============================
% REQUIRED PACKAGES
% ==============================
\RequirePackage[margin=1in]{geometry}
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage{lmodern}
\RequirePackage{microtype}
\RequirePackage{setspace}
\RequirePackage{parskip}
\RequirePackage{enumitem}
\RequirePackage{hyperref}
\RequirePackage{titlesec}

% ==============================
% GLOBAL SETTINGS
% ==============================
\setlength{\parindent}{0pt}
\setlength{\parskip}{0.4em}
\linespread{1.15}

% Section style
\titleformat{\section}
  {\normalfont\large\bfseries}
  {\thesection}{0.5em}{}
  [\vspace{0.1em}\titlerule]
\titlespacing*{\section}{0pt}{1.2em}{0.4em}

\titleformat{\subsection}
  {\normalfont\normalsize\bfseries}
  {\thesubsection}{0.5em}{}
\titlespacing*{\subsection}{0pt}{1em}{0.3em}

\titleformat{\subsubsection}
  {\normalfont\normalsize\bfseries\itshape}
  {\thesubsubsection}{0.5em}{}
\titlespacing*{\subsubsection}{0pt}{0.8em}{0.2em}

% Compact lists
\setlist[itemize]{topsep=0.2em,itemsep=0.15em,parsep=0pt,leftmargin=1.2em}
\setlist[enumerate]{topsep=0.2em,itemsep=0.15em,parsep=0pt,leftmargin=1.5em}
\setlist[description]{topsep=0.2em,itemsep=0.3em,parsep=0pt,leftmargin=1em}

% Hyperref
\hypersetup{
  colorlinks = true,
  linkcolor  = black,
  urlcolor   = blue,
  citecolor  = blue,
}

% ==============================
% MACROS FOR METADATA
% ==============================
\newcommand{\piName}[1]{\def\@piName{#1}}
\newcommand{\piTitle}[1]{\def\@piTitle{#1}}
\newcommand{\piDepartment}[1]{\def\@piDepartment{#1}}
\newcommand{\piUniversity}[1]{\def\@piUniversity{#1}}

\newcommand{\copiName}[1]{\def\@copiName{#1}}
\newcommand{\copiTitle}[1]{\def\@copiTitle{#1}}
\newcommand{\copiDepartment}[1]{\def\@copiDepartment{#1}}
\newcommand{\copiUniversity}[1]{\def\@copiUniversity{#1}}

\newcommand{\cashFunding}[1]{\def\@cashFunding{#1}}
\newcommand{\awsCredits}[1]{\def\@awsCredits{#1}}
\newcommand{\amazonContact}[2]{%
  \def\@amazonContactName{#1}%
  \def\@amazonContactEmail{#2}%
}
\newcommand{\keywords}[1]{\def\@keywords{#1}}

% Default values (empty)
\piName{}\piTitle{}\piDepartment{}\piUniversity{}
\copiName{}\copiTitle{}\copiDepartment{}\copiUniversity{}
\cashFunding{}\awsCredits{}
\amazonContact{}{}
\keywords{}

% ==============================
% ARA TITLE AND HEADER
% ==============================
\newcommand{\makeAraTitle}{%
  \begin{center}
    {\LARGE\bfseries \@title}
  \end{center}
  \vspace{0.4em}
  \noindent\textbf{PI:} \@piName, \@piTitle, \@piDepartment, \@piUniversity
  \ifx\@copiName\@empty\else
    \par\vspace{0.4em}
    \noindent\textbf{Co-PI:} \@copiName, \@copiTitle, \@copiDepartment, \@copiUniversity
  \fi

  \noindent\textbf{Cash funding needed:} \@cashFunding

  \noindent\textbf{AWS Promotional Credits needed:} \@awsCredits

  \noindent\textbf{Amazon contact (optional):} \@amazonContactName, \@amazonContactEmail

  \noindent\textbf{Keywords:} \@keywords\par
  \vspace{1em}
  \hrule height 1pt
  \vspace{2pt}
  \hrule height 1pt
  \vspace{1.5em}
}

% ==============================
% ABSTRACT
% ==============================
\renewenvironment{abstract}{%
  \begin{center}
    \textbf{\Large Abstract}
  \end{center}
  \vspace{-0.2em}
  \begin{quote}
    \itshape
}%
{
  \end{quote}
  \vspace{1em}
}

% ==============================
% APPENDIX WITH PAGE BREAK
% ==============================
\newcommand{\newappendix}[1]{%
  \clearpage
  \section*{#1}%
  \addcontentsline{toc}{section}{#1}%
  \markboth{#1}{#1}%
}
