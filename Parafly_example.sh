#PBS -l nodes=1:ppn=20
#PBS -l walltime=30:00:00
#PBS -N Parafly_test
#PBS -o /depot/cms/users/bakshi3/CMSSW_9_1_0_pre3/delphes/SUSY_delphesization_jobs/Parafly_test.log
#PBS -e /depot/cms/users/bakshi3/CMSSW_9_1_0_pre3/delphes/SUSY_delphesization_jobs/Parafly_test.err
#PBS -q cms
#!/bin/sh

#Neccesary for parallizing the jobs
module load utilities
module load parafly

#set up the CMSSW environment
echo `hostname`
echo `date`
source /cvmfs/cms.cern.ch/cmsset_default.sh
cp /depot/cms/users/bakshi3/CMSSW_9_1_0_pre3/CMSSW.tgz .
echo 'Un-tarring the CMSSW environment'
tar -zxf CMSSW.tgz
rm CMSSW.tgz
echo 'Done with that'
ls -lhart
cd CMSSW_9_1_0_pre3/src
scramv1 b ProjectRename
eval `scramv1 runtime -sh`

WORK_DIR="/mnt/hadoop/store/mc/RunIISummer16MiniAODv2/SMS-T2tt_3J_xqcut-20_top-corridor_2Lfilter_TuneCUETP8M1_13TeV-madgraphMLM-pythia8/MINIAODSIM/PUMoriond17_GridpackScan_80X_mcRun2_asymptotic_2016_TrancheIV_v6-v2/00000"
HOME_DIR="/depot/cms/top/bakshi3/SUSY_Delphesized_Temp"
cd $PWD/../delphes/
echo 'Begin processing files in Parafly_inputs ::' 

#Replace this line with stuff ::
#./DelphesCMSFWLite cards/CMS_PhaseII/CMS_PhaseII_200PU_v03.tcl  $HOME_DIR/Delphes_200PU_$i  $WORK_DIR/$i
ParaFly -c /depot/cms/users/bakshi3/CMSSW_9_1_0_pre3/delphes/SUSY_delphesization_jobs/Parafly_inputs_1  -CPU 20 -failed_cmds rerun.txt

echo 'Done with Parafly inputs'
cd ../
rm -rf CMSSW_9_1_0_pre3
echo `date`
