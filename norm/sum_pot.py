import os,sys
import ROOT as rt
from array import array

#sample="mcc9_v29e_dl_run3b_bnb_nu_overlay_nocrtremerge"
sample="mcc9_v29e_dl_run3b_bnb_intrinsic_nue_overlay_nocrtremerge"

finput = open("../inputlists/%s.list"%(sample),'r')
linput = finput.readlines()

ifile = 0
potsum = 0.0

for l in linput:
    l = l.strip()
    print "[",ifile,"] ",l
    rfile   = rt.TFile( l )
    pottree = rfile.Get("potsummary_generator_tree")
    nentries = pottree.GetEntries()
    #print " nentries=",nentries
    for ientry in xrange(nentries):
        pottree.GetEntry(ientry)
        potsum += pottree.potsummary_generator_branch.totgoodpot
    ifile += 1
    #if ifile>=10:
    #    break

print "POT SUM: ",potsum

