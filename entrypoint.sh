#!/bin/bash

git config --global --add safe.directory /opt
exec "$@"
