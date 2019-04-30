FROM frolvlad/alpine-glibc:alpine-3.9_glibc-2.28

RUN mkdir /tmp/install-tl-unx

WORKDIR /tmp/install-tl-unx

COPY texlive.profile .

# Install TeX Live with some basic collections
RUN apk --no-cache add perl wget xz tar && \
	wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz && \
	tar --strip-components=1 -xvf install-tl-unx.tar.gz && \
	./install-tl --profile=texlive.profile && \
	apk del perl wget xz tar && \
	cd && rm -rf /tmp/install-tl-unx

ENV PATH="/usr/local/texlive/2019/bin/x86_64-linux:${PATH}"

# Install additional packages
RUN apk --no-cache add perl wget python py-pygments && \
	tlmgr install FAQ-en MemoirChapStyles Type1fonts ae amscls amscls-doc amsfonts amslatex-primer amsmath anysize apalike-german around-the-bend ascii-chart automata awesomebox babel babel-english babel-german babelbib bbcard beamer bera biblatex-cheatsheet bibleref-german bibtex bibtex.x86_64-linux bidi-atbegshi bidicontour bidipagegrid bidipresentation bidishadowtext blockdraw_mp booktabs booktabs-de bpolynomial breakurl breqn businesscard-qrcode calcage caption carlisle cite cm cmap cmarrows collection-langenglish collection-langgerman collection-latex colortbl components-of-TeX comprehensive cqubeamer crop csquotes csquotes-de ctable datatool datenumber dehyph dehyph-exptl dhua dickimaw docsurvey drv dtxtut dviincl dvipdfmx dvipdfmx.x86_64-linux dvips dvips.x86_64-linux ec einfuehrung einfuehrung2 emp enctex enumitem epsincl eso-pic etdipa etex etex-pkg etoolbox etoolbox-de euenc euler everypage expressg exteps extsizes fancybox fancyhdr fancyref fancyvrb featpost feynmf feynmp-auto fifinddo-info filehook first-latex-doc fix2col fixlatvian float fnumprint fontbook fontspec fontwrap forest-quickstart fp framed fvextra garrigues gentle geometry geometry-de german germbib germkorr glossaries glossaries.x86_64-linux glyphlist gmp graphics graphics-cfg graphics-def gsftopk gsftopk.x86_64-linux guide-to-latex happy4th hatching hausarbeit-jura hyperref hyph-utf8 hyphen-base hyphen-english hyphen-german ifluatex ifmtarg ifplatform iftex impatient index interchar intro-scientific jknapltx knuth knuth-lib knuth-local koma-script koma-script-examples kpathsea kpathsea.x86_64-linux l2picfaq l2tabu l2tabu-english l3experimental l3kernel l3packages latex latex-bib-ex latex-bib2-ex latex-bin latex-bin.x86_64-linux latex-brochure latex-course latex-doc-ptr latex-fonts latex-graphics-companion latex-referenz latex-refsheet latex-tabellen latex-veryshortguide latex-web-companion latex2e-help-texinfo latex4wp latexbug latexcheat latexcheat-de latexconfig latexcourse-rug latexfileinfo-pkgs latexmk latexmk.x86_64-linux latexmp lineno listings lm lshort-english lshort-german ltablex ltxmisc lua-alt-getopt lualatex-doc-de luatex luatex.x86_64-linux lwarp lwarp.x86_64-linux macros2e makecmds makeindex makeindex.x86_64-linux marvosym math-e math-into-latex-4 maths-symbols mathspec mathtools mcf2graph mdframed mdwtools memdesign memoir metafont metafont-beginners metafont.x86_64-linux metago metalogo metaobj metaplot metapost metapost-examples metapost.x86_64-linux metauml mfirstuc mflogo mfnfss mfpic mfpic4ode mfware mfware.x86_64-linux microtype microtype-de milog minted mp3d mparrows mpattern mpcolornames mpgraphics mptopdf mptopdf.x86_64-linux mptrees ms na-position natbib needspace ntgclass numprint oberdiek pageslts parskip patgen2-tutorial pdfpages pdftex pdftex.x86_64-linux pgf pgfopts pgfplots philokalia pictexsum piechartmp plain plain-doc polyglossia powerdot presentations presentations-en psfrag pslatex psnfss pspicture ptext quran r_und_s rcs realscripts repere roex roundrect sansmath scheme-basic scheme-infraonly scheme-minimal section seminar sepnum setspace shapes short-math-guide simple-resume-cv simple-thesis-dissertation simplified-latex slideshow splines suanpan subfig substr svg-inkscape tabu tabulars-e tamethebeast tds templates-fenn templates-sommer termcal-de tetex tetex.x86_64-linux tex tex-font-errors-cheatsheet tex-ini-files tex-overview tex-refs tex.x86_64-linux texbytopic texlive-common texlive-de texlive-docindex texlive-en texlive-msg-translations texlive-scripts texlive-scripts.x86_64-linux texlive.infra texlive.infra.x86_64-linux textcase textpath textpos threeddice thumbpdf thumbpdf.x86_64-linux tipa tipa-de titlepages tlc2 tools tracklang translation-arsclassica-de translation-biblatex-de translation-chemsym-de translation-ecv-de translation-enumitem-de translation-europecv-de translation-filecontents-de translation-moreverb-de translator typehtml ucharcat ucharclasses udesoftec uhrzeit ulem umlaute undergradmath underscore undolabl unicode-bidi unicode-data unicode-math unisugar updmap-map upquote url varwidth visualfaq voss-mathcol wallpaper webguide wrapfig xcolor xdvi xdvi.x86_64-linux xebaposter xechangebar xecjk xecolor xecyr xeindex xesearch xespotcolor xevlna xfor xifthen xkeyval xltxtra xpatch xstring xunicode && \
	mkdir /workdir

WORKDIR /workdir

VOLUME ["/workdir"]
