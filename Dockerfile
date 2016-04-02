from sfarrell/ubuntu-root:gcc49-root60412
MAINTAINER Steve Farrell <Steven.Farrell@cern.ch>

RUN apt-get update -y

# Copy local software checkouts to the image
COPY rcSetup AnalysisBase /atlas/

RUN cd /atlas/AnalysisBase/2.3.48 && source RootCore/scripts/setup.sh && \
    rc find_packages && rc compile
