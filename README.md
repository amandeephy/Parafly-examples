# Delphes job submission

An example CMS job parallelized using Parafly 

The CMS job is to convert MiniAOD files to simulate future detector conditions using the Delphes FW.
These require the Delphes FW be installed, to do the same :

```
cd DelphesNtuplizer
cmsrel CMSSW_10_0_5
cd CMSSW_10_0_5
cmsenv
cd ..
git clone https://github.com/delphes/delphes.git
cd delphes
git checkout tags/3.4.2pre17
./configure
sed -i -e 's/c++0x/c++1y/g' Makefile
make -j 10
cp libDelphes.so ..
```

Parafly is a PBS option that helps you parallelize inputs across processors on a given cluster node.
The example uses the hammer cluster at Purude, where in there are 20 processors per node.

The input file takes in the command to be executed per processor, while the example file is the submission file with all the PBS directives.

To submit just : qsub Parafly_example

