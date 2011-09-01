#!/bin/bash
set -e
set -x

ROOT=$PWD

# create virtual environment in ./deploy/
virtualenv --prompt=behaviors $ROOT/deploy
export PKG_CONFIG_PATH=$ROOT/deploy/lib/pkgconfig:$PKG_CONFIG_PATH

source $ROOT/deploy/bin/activate

cd $ROOT/src/contracts 
python setup.py develop 
nosetests -w src

cd $ROOT/src/geometry 
python setup.py develop 
bash tests_fast.sh

cd $ROOT/src/dynamics 
python setup.py develop 
nosetests -w src

cd $ROOT/src/procgraph 
python setup.py develop 
nosetests -w src

cd $ROOT/src/json-c
cmake -DCMAKE_INSTALL_PREFIX=$ROOT/deploy . 
make install

cd $ROOT/src/raytracer 
cmake -DCMAKE_INSTALL_PREFIX=$ROOT/deploy . 
make install

cd $ROOT/src/vehicles 
python setup.py develop 
bash tests_fast.sh

cd $ROOT/src/fly_behaviors 
python setup.py develop 
nosetests -w src



