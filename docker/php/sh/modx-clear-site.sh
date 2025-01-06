#!/bin/bash

echo "Start cleaning site directory: ${ROOT_PATH} ..."
find "${ROOT_PATH}" -mindepth 1 -delete
echo "Finish cleaning site directory"