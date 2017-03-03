#!/bin/bash

cd /project/target

# Fetch dependencies, compile classes and test-classes
sbt test:compile
