#! bash

echo "Adding package $1"
yay -S $1 && echo "$1" >> ~/repos/perfect-arch-config/packages.txt
