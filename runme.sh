#!/bin/bash

service openvas-scanner restart
service openvas-manager restart
openvasmd --rebuild --progress

