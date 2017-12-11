FROM tjhei/aspect-jupyter

USER root

COPY Notebook/* /home/$NB_USER/

COPY ModelInput /home/$NB_USER/aspect/model_input

COPY ["onset of convection/onset-of-convection+debug.ipynb", "/home/$NB_USER/"]

COPY ["onset of convection/convection-box-base.prm", "/home/$NB_USER/aspect/model_input/" ]

RUN chown $NB_USER:users /home/$NB_USER/ASPECT_Jupyter.ipynb

USER $NB_USER

RUN jupyter trust /home/$NB_USER/*.ipynb

RUN conda update \
    --yes \
    --channel conda-forge \
    conda \
    jupyterhub \
    notebook

CMD ["jupyterhub-singleuser"]

