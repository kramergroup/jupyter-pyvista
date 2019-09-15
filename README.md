# Jupyter PyVista Container

This container provides a Jupyter Notebook server for scientific visualisation. It contains:

- The JupyterHub SciPy environment (NumPy, SciPy, etc.)
- The [PyVista](https://pypi.org/project/pyvista/) interface to the powerful VTK visualisation environment

## GPU acceleration

For portabililty, the container does not utilise any type of hardware acceleration. Rendering relies on Mesa and Xvfb.