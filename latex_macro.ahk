; Script adapted from https://tex.stackexchange.com/questions/61547/using-autohotkey-to-streamline-latex-document-authoring
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#Hotstring EndChars `n `t
#Hotstring c

; :o:   omit ending character
; :?:   triggers hotstring even between characters
; :c:   case sensitive
; :*:   no trigger
; ^     ctrl
; +     shift
; <!    left alt

; /// 1. BRACKETS WITH AUTO COMPLETION ///

:*:\left(::\left(  \right){Left 8}
:*:\left{::\left\{{}  \right\{}}{Left 8}
:*:\left[::\left[  \right]{Left 8}

; /// 1.2 BRACKETS WITHOUT AUTO COMPLETION ///

:*:\((::\left({Space}
:*:\))::\right){Space}
:*:\[[::\left[{Space}
:*:\]]::\right]{Space}

; /// 2. ENVIRONMENTS ///

:o:\begin{:: ; generic environment
    InputBox, OutputVar, Environment,,, 200, 120,,,,, eqnarray*
    SendInput, \begin{{}%OutputVar%{}}`r`r\end{{}%OutputVar%{}}{Up}`t
    Return

:o:\begin{eq::\begin{{}equation*{}}{enter 2}\end{{}equation*{}}{Up}
:o:\begin{pm::\begin{{}pmatrix{}}{enter 2}\end{{}pmatrix{}}{Up}

:o:\itemize::\begin{{}itemize{}}`r{Home}`r\end{{}itemize{}}{Up}`t\item{Space}
:o:\enumerate::\begin{{}enumerate{}}`r{Home}`r\end{{}enumerate{}}{Up}`t\item{Space}

; /// 3. BASIC MATH ///

; Commands
:o:\too::\longrightarrow{Space} ; -->
:o:\tooo::\longlongrightarrow{Space} ; ---> not always defined
:o*:\<=>::\Leftrightarrow ; <=>
:o*:\=>::\Rightarrow ; =>
:o:\<=::\Leftarrow ; <=

; Commands with arguments
:o:\frac::\frac{{}•{}}{{}•{}} •{Left 6}+{Left} ; \frac{•}{•} • +Left sert a selectionner le premier rond
:o:\int::\int_{{}•{}}{^}{{}•{}}{Left 5}+{Left} ; \int_{•}^{•}
:o:\langle::\langle • \rangle •{Left 10}+{Left} ; \langle • \rangle •
:o:\prod::\prod_{{}•{}}{^}{{}•{}}{Left 5}+{Left} ; \prod_{•}^{•}
:o:\sqrt::\sqrt{{}•{}}{Left}+{Left} ; \sqrt{•}•
:o:\sum::\sum_{{}•{}}{^}{{}•{}}{Left 5}+{Left} ; \sum_{•}^{•}

; /// 4. CUSTOM MATH MACRO ///

:oc:\Argmin::\underset{{}•{}}{{}\rm{{}argmin{}}{}}~{Space}•{Left 18}+{Left}
:oc:\Min::\underset{{}•{}}{{}\rm{{}min{}}{}}~{Space}•{Left 15}+{Left}
:o:\minimiser::\underset{{}•{}}{{}\rm{{}minimiser{}}{}}~{Space}•{Left 21}+{Left}
:o:\prox::\rm{{}prox{}}_{{}•{}}{Left 1}+{Left}

:o:\bd::{{}\rm{{}bd{}}{}}~{Space}
:o:\argmin::{{}\rm{{}argmin{}}{}}~{Space}
;:o:\cl::{{}\rm{{}cl{}}{}}~{Space}
:o:\co::{{}\rm{{}co{}}{}}~{Space}
:o:\cond::{{}\rm{{}cond{}}{}}~{Space}
:o:\cone::{{}\rm{{}cone{}}{}}~{Space}
:o:\crit::{{}\rm{{}crit{}}{}}~{Space}
:o:\diag::{{}\rm{{}diag{}}{}}~{Space}
:o:\dist::{{}\rm{{}dist{}}{}}~{Space}
:o:\epi::{{}\rm{{}epi{}}{}}~{Space}
:o:\gph::{{}\rm{{}gph{}}{}}~{Space}
:o:\Im::{{}\rm{{}Im{}}{}}~{Space}
:o:\inte::{{}\rm{{}int{}}{}}~{Space}
:o:\Ker::{{}\rm{{}Ker{}}{}}~{Space}
:o:\rank::{{}\rm{{}rank{}}{}}~{Space}
:o:\proj::{{}\rm{{}proj{}}{}}~{Space}
:o:\sp::{{}\rm{{}sp{}}{}}~{Space}
:o:\span::{{}\rm{{}span{}}{}}~{Space}
:o:\spec::{{}\rm{{}spec{}}{}}~{Space}
:o:\tr::{{}\rm{{}tr{}}{}}~{Space}



; /// 5. LETTERS ///

; Special
:o:\R::\mathbb{{}R{}}
:o:\N::\mathbb{{}N{}}
:o:Loja::Łojasiewicz{Space}

; Greek Letters small caps
:*:\aa::\alpha  
:*:\bb::\beta
:*:\cc::\chi
;:*:\dd::\delta
:*:\ee::\varepsilon
:*:\ff::\phi
:*:\gg::\gamma
:*:\hh::\eta
:*:\ii::\iota
:*:\kk::\kappa
:*:\ll::\lambda
:*:\mm::\mu
:*:\nn::\nu
:*:\pp::\pi
:*:\thh::\theta
:*:\rr::\rho
:*:\ss::\sigma
:*:\tt::\tau
:*:\uu::\upsilon
:*:\vv::\varphi
:*:\ww::\omega
:*:\xx::\xi
:*:\yy::\psi
:*:\zz::\zeta


; mathCAL 
:*:\Aa::\mathcal{{}A{}}
:*:\Bb::\mathcal{{}B{}}
:*:\Cc::\mathcal{{}C{}}
:*:\Dd::\mathcal{{}D{}}
:*:\Ee::\mathcal{{}E{}}
:*:\Ff::\mathcal{{}F{}}
:*:\Gg::\mathcal{{}G{}}
:*:\Hh::\mathcal{{}H{}}
:*:\Ii::\mathcal{{}I{}}
:*:\Jj::\mathcal{{}J{}}
:*:\Kk::\mathcal{{}K{}}
:*:\Ll::\mathcal{{}L{}}
:*:\Mm::\mathcal{{}M{}}
:*:\Nn::\mathcal{{}N{}}
:*:\Oo::\mathcal{{}O{}}
:*:\Pp::\mathcal{{}P{}}
:*:\Qq::\mathcal{{}Q{}}
:*:\Rr::\mathcal{{}R{}}
:*:\Ss::\mathcal{{}S{}}
:*:\Tt::\mathcal{{}T{}}
:*:\Uu::\mathcal{{}U{}}
:*:\Vv::\mathcal{{}V{}}
:*:\Ww::\mathcal{{}W{}}
:*:\Xx::\mathcal{{}X{}}
:*:\Yy::\mathcal{{}Y{}}
:*:\Zz::\mathcal{{}Z{}}

; mathBB 
:*:\AA::\mathbb{{}A{}}
:*:\BB::\mathbb{{}B{}}
:*:\CC::\mathbb{{}C{}}
:*:\DD::\mathbb{{}D{}}
:*:\EE::\mathbb{{}E{}}
:*:\FF::\mathbb{{}F{}}
:*:\GG::\mathbb{{}G{}}
:*:\HH::\mathbb{{}H{}}
:*:\II::\mathbb{{}I{}}
:*:\JJ::\mathbb{{}J{}}
:*:\KK::\mathbb{{}K{}}
:*:\LL::\mathbb{{}L{}}
:*:\MM::\mathbb{{}M{}}
:*:\NN::\mathbb{{}N{}}
:*:\OO::\mathbb{{}O{}}
:*:\PP::\mathbb{{}P{}}
:*:\QQ::\mathbb{{}Q{}}
:*:\RR::\mathbb{{}R{}}
:*:\SS::\mathbb{{}S{}}
:*:\TT::\mathbb{{}T{}}
:*:\UU::\mathbb{{}U{}}
:*:\VV::\mathbb{{}V{}}
:*:\WW::\mathbb{{}W{}}
:*:\XX::\mathbb{{}X{}}
:*:\YY::\mathbb{{}Y{}}
:*:\ZZ::\mathbb{{}Z{}}


; /// 6. TEXMAKER-LIKE TRICKS ///

; Jump to first occurance of • in the current line. (Continues search in the next line.)
+Tab:: ;
    ClipBackup := ClipboardAll
    clipboard := ""
    SendInput, {Home}+{End}
    SendInput, ^c
    Sleep 50 ; increase this number, if it doesn't work
    SearchedText := clipboard
    ; MsgBox, %SearchedText%    
    StringGetPos, pos, SearchedText, •
    if (pos >= 0)
        ; MsgBox, %Target% was found at %pos%.
        SendInput, {Home}{Right %pos%}+{Right}
    Clipboard := ClipBackup
    Return

; /// 7. OTHER COMMANDS ///


:*c:\AND::\quad \text{{} and {}} \quad{Space}
:*c:\ET::\quad \text{{} et {}} \quad{Space}
:*c:\SI::\quad \text{{} si {}} \quad{Space}
:*c:\IF::\quad \text{{} if {}} \quad{Space}
:*c:\ST::\quad \text{{} such that {}} \quad{Space}
:*c:\TQ::\quad \text{{} tel que {}} \quad{Space}
:?*:\.::$\cdot$
:?*:\"::\eg{{}•{}}{Left 1}+{Left}
