#!/bin/bash

# You should have password-less authentication to checkout from svn.cern.ch
# in order to run this script.

set -e

# Setup environment
source scripts/config.sh

# Checkout rcSetup
if [ -d rcSetup ]; then
    echo "Reusing local rcSetup checkout"
else
    echo "Checking out rcSetup from SVN..."
    svn co svn+ssh://svn.cern.ch/reps/atlasoff/rcSetup/trunk rcSetup
fi

# Checkout analysis release
if [ -d AnalysisBase/$ASG_BASE_RELEASE ]; then
    echo "Reusing local AnalysisBase checkout"
else
    echo "Checking out AnalysisBase $ASG_BASE_RELEASE..."
    source rcSetup/rcSetup.sh -d Base,$ASG_BASE_RELEASE
    
    # For now, need to patch the TrigDecisionTool lib flags
    patch -p0 < patches/TrigDecisionTool.patch

    # Prune out all of the SVN meta-data.
    cd AnalysisBase
    rm -rf $(find . -name .svn)
fi
