import os,sys

#sample="mcc9_v29e_dl_run3b_bnb_nu_overlay_nocrtremerge"
#sample="mcc9_v29e_dl_run3b_bnb_intrinsic_nue_overlay_nocrtremerge"
#sample="mcc9_v40a_dl_run3b_bnb_intrinsic_nue_overlay_CV"
#sample="mcc9_v40a_dl_run3b_bnb_overlay_CV"
#sample="mcc9_v40a_dl_run3b_bnb_intrinsic_nue_overlay_wiremodX"
#sample="mcc9_v29e_dl_run3_G1_extbnb"
sample="mcc9_v28_wctagger_run3_bnb1e19"

finput = open("inputlists/"+sample+".list",'r')
linput = finput.readlines()
finput.close()

fout = os.popen("find $PWD/outputdir/%s/ -name merged_dlana*root | sort"%(sample))
pout = fout.readlines()

outjobids = []

for out in pout:
    out = os.path.basename(out.strip())
    jobid = int(out.split("jobid")[-1][:-len(".root")])
    #print out," jobid=",jobid
    outjobids.append(jobid)

inputfiles = {}

os.system("mkdir -p processing_results")

goodlist = open("processing_results/%s_goodlist.list"%(sample),'w')
badlist  = open("processing_results/%s_badlist.list"%(sample),'w')
badjobid  = open("processing_results/%s_badjobid.list"%(sample),'w')
for jobid,l in enumerate(linput):
    l = l.strip()

    if jobid in outjobids:
        print>>goodlist,l
    else:
        print os.path.basename(l)," jobid=",jobid," is missing"
        print>>badlist,l
        print>>badjobid,jobid

