docker run -d --rm --name qtumd_node1 --network=qtum_network -v %cd%/node1_qtumd.conf:/home/qtum/qtum.conf:ro -v %cd%/node1_data:/data loopring/qtum:latest qtumd
docker run -d --rm --name qtumd_node2 --network=qtum_network -v %cd%/node2_qtumd.conf:/home/qtum/qtum.conf:ro -v %cd%/node2_data:/data loopring/qtum:latest qtumd
docker run -d --rm --name qtumd_node3 --network=qtum_network -v %cd%/node3_qtumd.conf:/home/qtum/qtum.conf:ro -v %cd%/node3_data:/data loopring/qtum:latest qtumd
docker ps
