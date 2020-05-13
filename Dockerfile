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

# RUN cat /opt/TinyTeX/texmf-var/web2c/tlmgr.log

WORKDIR /usr/src

COPY . .

# RUN R -q -e "install.packages(c('tinytex'), repos = 'https://cran.rstudio.com', lib='/usr/local/lib/R/site-library')"

# RUN Rscript -e "tinytex::install_tinytex()"

# RUN R -q -e 'bookdown::render_book("index.Rmd", "bookdown::pdf_book", output_dir = "")'

RUN make -B all
