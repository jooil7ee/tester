#!/bin/bash

PYTHON=/usr/local/bin/python3
TESTER_HOME=$HOME/staging/tester
VENV=storage

export GOOGLE_APPLICATION_CREDENTIALS=$HOME/key/aidp-all@sktaic-datahub.json

echo -e "> Run tester..."
# create tester home
if [[ ! -e $TESTER_HOME ]]; then
  echo -e "- create tester home"
  mkdir -p $TESTER_HOME
fi

# create python venv
cd $TESTER_HOME
if [[ -e $VENV ]]; then
  echo -e "- using venv: $TESTER_HOME/$VENV"
else
  echo -e "- create venv: $TESTER_HOME/$VENV"
  $PYTHON -m venv $VENV 2>&1 >/dev/null 

  echo -e "- install packages"
  source $TESTER_HOME/$VENV/bin/activate
  python -m pip install google-cloud-storage 2>&1 >/dev/null 
  deactivate
fi
cd -

echo -e "\n- run tester.py"
source $TESTER_HOME/$VENV/bin/activate
python tester.py 
deactivate

echo -e "- end test"
