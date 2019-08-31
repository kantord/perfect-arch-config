#! bash

echo "Adding package $1"
yay -S $1 && echo "$1" >> ~/repos/perfect-arch-config/packages.txt
cat ~/repos/perfect-arch-config/packages.txt | sort | uniq > /tmp/tmp_pkg_list.txt
cat /tmp/tmp_pkg_list.txt > ~/repos/perfect-arch-config/packages.txt

