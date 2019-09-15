FROM jupyter/scipy-notebook

USER root

RUN apt-get update && \
    apt-get install -y --no-install-recommends libgl1-mesa-dev xvfb && \
    rm -rf /var/lib/apt/lists/*

RUN conda install --quiet --yes bokeh pyviz_comms panel
RUN pip install git+git://github.com/pyvista/pyvista@master matplotlib pyct

COPY start_xvfb.sh /sbin/start_xvfb.sh
RUN chmod a+x /sbin/start_xvfb.sh

ENTRYPOINT ["tini", "-g", "--", "start_xvfb.sh"]
CMD ["start-notebook.sh"]

# Switch back to jovyan to avoid accidental container runs as root
USER $NB_UID