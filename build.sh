#!/bin/sh
SYSTEM_NAME=getshells
#ROS=$(which ros)
#SBCL=$(which sbcl)

rm -rf target/

if [ -n "${ROS}" ];then
    COMMAND="${ROS} run"
elif [ -n "${SBCL}" ];then
    COMMAND="${SBCL}"
else
    echo "Cannot find roswell, nor sbcl. If you have a Common Lisp implementation installed with ASDF, just eval \"(asdf:make :{SYSTEM_NAME})\" to build project."
    exit 1
fi
${COMMAND} --eval "(ql:quickload :${SYSTEM_NAME})" --eval "(asdf:make :${SYSTEM_NAME})" --quit
