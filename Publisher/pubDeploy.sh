#!/bin/bash
echo "Deploying containers ..."
docker run -it -d --network ds-net --name pub1 -e "PORT=1883" -e "TOPIC=node/ds" -e "NOMBREBROK=broker" nodejs
docker run -it -d --network ds-net --name pub2 -e "PORT=1883" -e "TOPIC=node/ds" -e "NOMBREBROK=broker" nodejs
docker run -it -d --network ds-net --name pub3 -e "PORT=1883" -e "TOPIC=node/ds" -e "NOMBREBROK=broker" nodejs
docker run -it -d --network ds-net --name pub4 -e "PORT=1883" -e "TOPIC=node/ds" -e "NOMBREBROK=broker" nodejs
docker run -it -d --network ds-net --name pub5 -e "PORT=1883" -e "TOPIC=node/ds" -e "NOMBREBROK=broker" nodejs