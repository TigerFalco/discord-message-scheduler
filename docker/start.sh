#!/bin/bash
cd /var/www/html/app

rails server -b 0.0.0.0
# Need this here to keep the docker container running
/bin/bash
tail -f /dev/null