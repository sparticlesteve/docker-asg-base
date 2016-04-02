from sfarrell/ubuntu-root:gcc49-root60412
MAINTAINER Steve Farrell <Steven.Farrell@cern.ch>

RUN apt-get update -y

# Copy local software checkouts to the image
COPY rcSetup /atlas/rcSetup
COPY AnalysisBase /atlas/AnalysisBase

RUN cd /atlas/AnalysisBase/2.3.48 && \
    bash -c 'source /atlas/root_current/bin/thisroot.sh && \
             source RootCore/scripts/setup.sh && \
             rc find_packages && rc compile'
