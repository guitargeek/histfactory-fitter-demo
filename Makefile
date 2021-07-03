# Author: Yipeng Sun
# Last Change: Sun Jul 04, 2021 at 01:32 AM +0200

VPATH := src:gen

# Compiler settings
COMPILER	:=	$(shell root-config --cxx)
CXXFLAGS	:=	$(shell root-config --cflags)
LINKFLAGS	:=	$(shell root-config --libs)
ADDCXXFLAGS	:=	-O2
ADDLINKFLAGS	:=	-lRooFitCore -lRooFit -lRooStats -lHistFactory

HistFactDstTauDemo:

%: %.cpp
	$(COMPILER) $(CXXFLAGS) $(ADDCXXFLAGS) -o gen/$@ $< $(LINKFLAGS) $(ADDLINKFLAGS)

.PHONY: clean

clean:
	@rm -rf ./gen/*
