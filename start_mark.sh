#!/bin/bash
set +ue
set -x
TMP_LANG=LANG # НЕ помню я как исоьзовать английскую локаль всегда в дате
LANG=en
date +%Y-%m-%d > start.txt
LANG=TMP_LANG