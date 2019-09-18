#!/bin/bash
export DISPLAY=:99.0
export PYVISTA_OFF_SCREEN=true
export PYVISTA_USE_PANEL=true
export PYVISTA_PLOT_THEME=document
# This is needed for Panel - use with cuation!
export PYVISTA_AUTO_CLOSE=false

/lib/systemd/systemd-udevd --debug > /dev/null 2>&1 &
udevadm trigger

export PATH=$NVIDIA_PATH/bin:$PATH
export LD_LIBRARY_PATH=$NVIDIA_PATH/lib:$LD_LIBRARY_PATH

# Obtaint the NVidia card PCI bus ID
nvidia-xconfig --query-gpu-info
export NVIDIA_PCI=$(nvidia-xconfig --query-gpu-info | grep "PCI BusID" | cut -c 15-)

cat << EOF > /usr/share/X11/xorg.conf.d/10-nividiapath.conf
Section "Files"
  ModulePath "$NVIDIA_PATH/lib"
  ModulePath "/usr/lib/xorg/modules"
EndSection
EOF

nvidia-xconfig --allow-empty-initial-configuration --busid=$NVIDIA_PCI

X :99 > /dev/null 2>&1 &
sleep 3

exec "$@"
