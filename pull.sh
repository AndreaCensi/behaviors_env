#!/bin/bash
set -e
set -x
ROOT=$PWD

repos=". contracts geometry dynamics raytracer vehicles procgraph fly_behaviors"
for repo in $repos; do
	cd $ROOT/src/$repo
	git pull
done
