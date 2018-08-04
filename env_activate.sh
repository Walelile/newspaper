#!/usr/bin/env sh

# Usage:
# $ sh install.sh

PY_BIN="python3.7"
PIP="pip3.7"

echo "> use venv dir name: $VENV"
echo "> use python3 bin: $PY_BIN"
echo "> if error, change them"
echo ""


PYTHON_VERSION_INFO=`$PY_BIN --version`

#echo "PYTHON_VERSION_INFO: $PYTHON_VERSION_INFO"
PYTHON_MAJOR=`expr "$PYTHON_VERSION_INFO" : 'Python \([0-9]\)'` 
PYTHON_MINOR=`expr "$PYTHON_VERSION_INFO" : 'Python ..\([0-9]\)'` 
PYTHON_VERSION="$PYTHON_MAJOR.$PYTHON_MINOR"

echo "major: $PYTHON_MAJOR"
echo "minor: $PYTHON_MINOR"
echo "python version: $PYTHON_VERSION"

VENV="venv$PYTHON_MAJOR$PYTHON_MINOR"


if [ ! -d $VENV ]; then
	case "$PYTHON_VERSION" in 
		"3.7")
			echo "$PY_BIN -m venv $VENV --system-site-packages"
			$PY_BIN -m venv $VENV --system-site-packages
			source $VENV/bin/activate
			$PIP install -e .
			;;

		"3.5")
			echo "$PY_BIN -m venv $VENV --system-site-packages"
			$PY_BIN -m venv $VENV --system-site-packages
			source $VENV/bin/activate
			$PIP install -e .
			;;
		"3.4")
			echo "$PY_BIN -m virtualenv -p $PY_BIN --system-site-packages $VENV"
			$PY_BIN -m virtualenv -p $PY_BIN  $VENV --system-site-packages
			source $VENV/bin/activate
			$PIP install -e .
			;;
		*)
			echo "not supported python: $PYTHON_VERSION, or fix this script"
			exit 1
			;;
	esac
else
	case "$PYTHON_VERSION" in 
		"3.7")
			source $VENV/bin/activate
			;;
		"3.5")
			source $VENV/bin/activate
			;;
		"3.4")
			source $VENV/bin/activate
			;;
		*)
			echo "not supported python: $PYTHON_VERSION, or fix this script"
			exit 1
			;;
	esac


fi

# update pip
pip3 install --upgrade pip

#if [ "$PYTHON_MAJOR" = "3" ]; then
#	if [ "$PYTHON_MINOR" = "5" ]; then
#		echo "jo"
#	else
#		echo "bo"
#	fi
#fi

## python3 3.4
#python3 -m virtualenv -p python3 --system-site-packages venv
#source venv/bin/activate
#
## python3 3.6
##python -m venv ./venv --system-site-packages
##source venv/Scripts/activate
#
#
#
## install pyutils as a dev package
##pip install -e .
#pip3 install -e .
#
#
## This script is for users that cannot install
## the dev version to system dir
##export PYTHONPATH="$HOME/project/pyutils"
#




## Test only

#H="Hallo World"
#echo `expr "$H" : '\(.[a-z]*\)'`
#echo `expr "$H" : '.[a-z]*'`
#echo `expr "$H" : '\(.*World\)'`
#echo `expr "$H" : '.*World'`


