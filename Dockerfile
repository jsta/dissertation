FROM rocker/verse

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
    everyshi

WORKDIR /usr/src

COPY . .

RUN make -B all
