#!/usr/bin/env bash
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo ""

if [ $# -gt 1 -a "$1" == "push" ]
then
    TAG=$2

    echo "Pushing Bitwarden MsSql ($TAG)"
    echo "========================"
    
    docker push aiir42/bitwarden_tiny_mssql:$TAG
elif [ $# -gt 1 -a "$1" == "tag" ]
then
    TAG=$2
    
    echo "Tagging Bitwarden MsSql as '$TAG'"
    
    docker tag aiir42/bitwarden_tiny_mssql aiir42/bitwarden_tiny_mssql:$TAG
else
    echo "Building Bitwarden MsSql"
    echo "=================="

    chmod u+x $DIR/util/MsSql/build.sh
    $DIR/util/MsSql/build.sh
fi
