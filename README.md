# Jupyter PyVista Container

This container provides a Jupyter Notebook server for scientific visualisation. It contains:

- The JupyterHub SciPy environment (NumPy, SciPy, etc.)
- The [PyVista](https://pypi.org/project/pyvista/) interface to the powerful VTK visualisation environment

## GPU acceleration

For portabililty, the container does not utilise any type of hardware acceleration by default. Rendering relies on Mesa and Xvfb.

There is, however, a variant that can utilise Nvidia GPU cards. To build the Nvidia-enabled container use

```bash
docker build -f Dockerfile.nvidia -t jupyter-pyvista-nvidia .
```

This container does **not* contain the Nvidia device drivers. Rather it expects that these are mounted from the host as is done by the Kubernetes device plugin. By default, the driver files should be mounted to `/usr/local/nvidia`. This can be changed by adjusting the `NVIDIA_PATH` environment variable. 

!!! note
    The hardware accelerated container relies on a standard X11 server (rather than Xvfb). This requires access to at tty and the container needs to run in **privileged** mode.
