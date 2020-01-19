#!/usr/bin/env bash
outputDir=$1
backend="$outputDir/backend"
frontend="$outputDir/frontend"
images="$outputDir/images"
phpImage="$images/php-dev"

mkdir -p "$backend"
mkdir -p "$frontend"
mkdir -p "$images"
mkdir -p "$phpImage"
