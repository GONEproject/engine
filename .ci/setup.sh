#!/bin/bash

#  Copyright 2018 The node-gpu Project Authors. All rights reserved.
#  Use of this source code is governed by a BSD-style license that can be
#  found in the LICENSE file.

# Creates a new Pipeline Config and stores it inside the config directroy:
#     cd <project_root>/.ci/config/
#     cat *.yml
# 
# The generated file will be automatically added to the .gitignore file.
# Verify the .gitignore file before pushing or committing to your Repo:
#     cat <project_root>/.gitignore
#
# After generating the Pipeline Config a new CI Pipeline is setup via fly CLI
# To lean more about Concourse Fly CLI visit: https://concourse-ci.org/fly.html

# Exit when any command fails
set -e

# SET COLOR VARIABLES
RESET_CLR='\033[0m';
ERROR_CLR='\033[0;31m';
SUCCESS_CLR='\033[0;32m';
LINK_CLR='\033[4;36m\033[1;36m';
WARN_CLR='\033[0;35m';
JOB_CLR='\033[0;34m';

# CONFIGURATION
SETUP_CONFIG="default.yml";
PIPELINE_CONFIG="pipeline.yml";
PIPELINE_NAME="node-gpu";

# Check Git environment
if [ -d .git ]; then
  echo -e "${SUCCESS_CLR}➜ [OK] Detected valid Git environment!";
else
  echo -e "${ERROR_CLR}➜ [ERROR] Invalid Git envirnonment!";
  exit 1;
fi;

# Check if Fly CLI is installed
if type fly &>/dev/null; then
  echo -e "${SUCCESS_CLR}➜ [OK] Detected Fly CLI!";
else
  echo -e "${ERROR_CLR}➜ [ERROR] This script requires Fly CLI to setup pipelines... https://concourse-ci.org/fly.html\n";
  exit 1;
fi;

# Check if setup config file is available
if [ -f ".ci/config/${SETUP_CONFIG}" ]; then
  echo -e "${SUCCESS_CLR}➜ [OK] Detected ${SETUP_CONFIG}";
else
  echo -e "${ERROR_CLR}➜ [ERROR] Config ${SETUP_CONFIG} NOT FOUND!";
  exit 1;
fi;

# Check if pipeline config file is available
if [ -f ".ci/${PIPELINE_CONFIG}" ]; then
  echo -e "${SUCCESS_CLR}➜ [OK] Detected ${PIPELINE_CONFIG}";
else
  echo -e "${ERROR_CLR}➜ [ERROR] Config ${PIPELINE_CONFIG} NOT FOUND!";
  exit 1;
fi;


# Login
echo -e "\n${RESET_CLR}Login to Concouse CI:";
read -p "- Host address: " CONCOURSE_URL;
read -p "- Target name: " CONCOURSE_TARGET;
read -p "- Local username: " CONCOURSE_USERNAME;
read -sp "- Local password: " CONCOURSE_SECRET;
echo -e "\n";

# Run jobs
echo -e "${JOB_CLR}[JOB] Removing existing targets ...${RESET_CLR}";
fly logout -a # https://github.com/concourse/concourse/issues/2582 Hotfix

echo -e "${JOB_CLR}[JOB] Login to new target ...${RESET_CLR}";
fly -t ${CONCOURSE_TARGET} login -c ${CONCOURSE_URL} -u ${CONCOURSE_USERNAME} -p ${CONCOURSE_SECRET}

echo -e "${JOB_CLR}[JOB] Validating ${PIPELINE_CONFIG} ...${RESET_CLR}";
fly validate-pipeline --config .ci/${PIPELINE_CONFIG} --load-vars-from .ci/config/${SETUP_CONFIG}

echo -e "${JOB_CLR}[JOB] Set Pipeline ...${RESET_CLR}";
fly -t ${CONCOURSE_TARGET} set-pipeline -p ${PIPELINE_NAME} -c .ci/${PIPELINE_CONFIG} -l .ci/config/${SETUP_CONFIG} --non-interactive


# Exit
echo -e "${RESET_CLR}\n... Done!\n";

exit 0;