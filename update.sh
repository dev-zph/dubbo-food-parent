#!/bin/bash

set -e

WORKSPACE=$(pwd)

GIT_UPDATE_PRO=${GIT_UPDATE_PRO:-"dubbo-food-common dubbo-food-dao dubbo-food-entity dubbo-food-service dubbo-food-service-work dubbo-food-web "}

GIT_CLONE_REPO=${GIT_CLONE_REPO:-"https://github.com/dev-zph/"}

gitclone(){
    cd_basedir
    for i in ${GIT_UPDATE_PRO};do
        if [ ! -d ${i} ];then
            git clone "${GIT_CLONE_REPO}${i}.git"
        else
            cd ${i}
            git pull
            cd ..
        fi
    done
}

cd_basedir(){
    cd "${WORKSPACE}"
    cd ..
}

gitclone