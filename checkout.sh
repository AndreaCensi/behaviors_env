#!/bin/bash
set -e
set -x
ROOT=$PWD

# Download source in ./src/

mkdir -p $ROOT/src/

# Submodules/subtrees are a pain. Best solution I found is to simply add a project-specific branch in the dependencies.
git clone -b behaviors git@github.com:AndreaCensi/contracts.git  $ROOT/src/contracts
git clone -b behaviors git@github.com:AndreaCensi/geometry.git   $ROOT/src/geometry
git clone -b behaviors git@github.com:AndreaCensi/procgraph.git  $ROOT/src/procgraph
git clone -b behaviors git@github.com:AndreaCensi/dynamics.git   $ROOT/src/dynamics
git clone -b behaviors git@github.com:AndreaCensi/json-c.git     $ROOT/src/json-c
git clone -b behaviors git@github.com:AndreaCensi/raytracer.git  $ROOT/src/raytracer
git clone -b behaviors git@github.com:AndreaCensi/vehicles.git   $ROOT/src/vehicles
git clone              git@github.com:AndreaCensi/fly_behaviors  $ROOT/src/fly_behaviors

