FROM docker.io/btip2024/rstudio-verse-shiny-opencpu-seurat

RUN \
    apt-get update -y && \
    apt-get upgrade -y

RUN mkdir -p /scripts

COPY installation.R /scripts

RUN Rscript /scripts/installation.R

WORKDIR "/root"
RUN git clone https://github.com/BTIP2024/DR-scRNAseq
RUN git clone https://github.com/BTIP2024/api-docu-seurat-opencpu
RUN git clone https://github.com/BTIP2024/final-presentation

RUN cp -R /root/DR-scRNAseq /srv/shiny-server/
RUN cp -R /root/api-docu-seurat-opencpu /srv/shiny-server/
RUN cp -R /root/final-presentation /srv/shiny-server/

EXPOSE 80
EXPOSE 443
EXPOSE 3838
EXPOSE 8787
EXPOSE 8004

CMD ["/init"]
