FROM rocker/rstudio AS base
RUN apt-get update && apt-get install -y pandoc 

RUN mkdir /final_project
WORKDIR  /final_project

RUN mkdir scripts
RUN mkdir output
RUN mkdir data
COPY scripts scripts
COPY Makefile .
COPY final_report.Rmd .
COPY data data

COPY .Rprofile .
COPY renv.lock .
RUN mkdir renv
COPY renv/activate.R renv
COPY renv/settings.json renv

RUN R -e "install.packages('cardx')"
RUN R -e "install.packages('broom')"
RUN R -e "install.packages('broom.helpers')"
RUN R -e "install.packages('car')"
RUN R -e "install.packages('parameters')"
RUN R -e "install.packages('gtsummary')"


RUN Rscript -e "renv::restore(prompt=FALSE)"
RUN mkdir report
CMD make && mv final_report.html report



###### DO NOT EDIT STAGE 1 BUILD LINES ABOVE ######