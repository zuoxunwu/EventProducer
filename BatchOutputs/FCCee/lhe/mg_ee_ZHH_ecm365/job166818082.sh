#!/bin/bash
unset LD_LIBRARY_PATH
unset PYTHONHOME
unset PYTHONPATH
mkdir job166818082_mg_ee_ZHH_ecm365
cd job166818082_mg_ee_ZHH_ecm365
export EOS_MGM_URL="root://eospublic.cern.ch"
source /cvmfs/sw.hsf.org/spackages2/key4hep-stack/2021-05-12/x86_64-centos7-gcc8.3.0-opt/iyafnfo5muwvpbxcoa4ygwoxi2smkkwa/setup.sh
source /cvmfs/sft.cern.ch/lcg/views/LCG_97a_FCC_4/x86_64-centos7-gcc8-opt/setup.sh 
mkdir /eos/experiment/fcc/ee/generation/lhe/
mkdir /eos/experiment/fcc/ee/generation/lhe/mg_ee_ZHH_ecm365
python /afs/cern.ch/work/h/helsens/public/FCCutils/eoscopy.py /eos/experiment/fcc/ee/generation/gridpacks//mg_ee_ZHH_ecm365.tar.gz .
tar -zxf mg_ee_ZHH_ecm365.tar.gz
cd process/
./run.sh 100000 166818082
echo "finished run"
xrdcp -N -v events.lhe.gz root://eospublic.cern.ch//eos/experiment/fcc/ee/generation/lhe//mg_ee_ZHH_ecm365/events_166818082.lhe.gz
echo "lhe file successfully copied on eos"
cd ..
rm -rf job166818082_mg_ee_ZHH_ecm365
