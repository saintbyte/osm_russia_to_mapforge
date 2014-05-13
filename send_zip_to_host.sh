#!/bin/bash
set +ue
set +x
rsync --partial --progress -avv ./zip/* root@ural.im:/var/www/ural.im/dmaps/
rsync --partial --progress -avv ./to_names root@ural.im:/var/www/ural.im/dmaps/
rsync --partial --progress -avv ./start.txt root@ural.im:/var/www/ural.im/dmaps/