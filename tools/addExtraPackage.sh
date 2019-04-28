#! bash

echo "Adding extra package $1"
yay -S $1 && echo "$1" >> ~/repos/perfect-arch-config/extra_packages.txt
