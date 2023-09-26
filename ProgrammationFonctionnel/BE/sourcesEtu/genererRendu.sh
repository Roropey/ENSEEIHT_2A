#!/bin/sh -e

echo "Saisissez votre login ENSEEIHT :"
read login
mkdir $login
cp -p conway.ml $login
cp -p expression.ml $login
cp -p dune $login
cp -p dune-workspace $login
cp -p dune-project $login
tar -cvf  $login.tar $login
rm -rf $login

