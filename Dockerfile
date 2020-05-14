FROM rocker/verse as dev
# install texlive packages
RUN tlmgr install \
    memoir \
    lm-math \
    unicode-math \
    xcolor \
    mdwtools \
    ucharcat \
    filehook \
    doi \
    multirow \
    colortbl \
    wrapfig \
    pgf \
    ms \
    tabu \
    varwidth \
    threeparttable \
    atbegshi \
    atveryend \
    auxhook \
    bigintcalc \
    bitset \
    etexcmds \
    gettitlestring \
    hycolor \
    hyperref \
    intcalc \
    kvdefinekeys \
    kvsetkeys \
    letltxmacro \
    ltxcmds \
    pdfescape \
    refcount \
    rerunfilecheck \
    stringenc \
    uniquecounter \
    url \
    zapfding \
    tools \
    latex-tools-dev \
    caption \
    amsfonts \
    amsmath \
    latex-amsmath-dev \
    pdftexcmds \
    infwarerr \
    kvoptions \
    grffile \
    newfloat \
    natbib \
    bibtex \
    geometry \
    amscls \
    float \
    pdflscape \
    fancyvrb \
    framed \
    epstopdf \
    ltxcmds \
    epstopdf-pkg

WORKDIR ~/
COPY . .

FROM dev as build
RUN rm -rf _bookdown_files/figures && cp -r figures _bookdown_files/figures
RUN make -B all

FROM build as artifact
COPY --from=build ~/stachelek-dissertation.pdf test.pdf
ENTRYPOINT ["~/"]
