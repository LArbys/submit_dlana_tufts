import os,sys
import ROOT as rt
from array import array


#sample="mcc9_v29e_dl_run3b_bnb_nu_overlay_LowE"
#sample="mcc9_v29e_dl_run3b_bnb_nu_overlay_nocrtremerge"
#sample="mcc9_v29e_dl_run3b_bnb_intrinsic_nue_overlay_nocrtremerge"
#sample="mcc9_v28_wctagger_extbnb"
#sample="mcc9_v28_wctagger_bnboverlay"
sample="mcc9_v28_wctagger_nueintrinsics"

finput = open("../inputlists/%s.list"%(sample),'r')
linput = finput.readlines()

ifile = 0
potsum = 0.0

for l in linput:
    l = l.strip()
    print "[",ifile,"] ",l
    rfile   = rt.TFile( l )
    try :
        pottree = rfile.Get("potsummary_generator_tree")
        nentries = pottree.GetEntries()
        #print " nentries=",nentries
        for ientry in xrange(nentries):
            pottree.GetEntry(ientry)
            potsum += pottree.potsummary_generator_branch.totgoodpot
    except:
        print "error with ",l
    ifile += 1
    #if ifile>=10:
    #    break

print "POT SUM: ",potsum

