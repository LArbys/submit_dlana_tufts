# submit_dlana_tufts

* Step 0: decide on a sample name for file set. I have been using the definition name found by the `.json` file in the folder containing the files.
* Step 1: make an input list for a sample in `inputlists`. I find `find` does the trick for me:

      find [full_path_to_directory_to_scan] -name merged_dlreco*root | sort | > inputlists/[samplename].list

* Step 2: count the number of files

      cat inputlists/[samplename].list | wc -l

* Step 3: modify `run.sh` with the sample name
* Step 4: modify `submit.sh` to try a test sample. 

      #SBATCH --array=0-4

* Step 5: check files are good (using log and/or inspecting output files in outputdir)
* Step 6: full launch of `N+1` jobs, where N is `number of files-1`

      #SBATCH --array=5-N

## Sample tracking webpage

Ask Taritree for this. We should try to log our progress with the sample name and stages.

Stages:

  1. make metadata for sample
  2. transfer sample
  3. run dlana on files in sample
  4. hadd final sample file

This readme tries to outline the steps of this workflow.

Steps (3) and (4) are in the next secton. Steps (1) and (2) are in the one that follows the next.

## Updated BATCH workflow

Note, the folder `/cluster/tufts/wongjiradlab/larbys/run_dlana_jobs/` is shared by several users to run jobs.

You should make a copy of the scripts you use (labeled with `_name` for example) in order to not infere with other's scripts.

* Step 0: decide on a sample name to run. Input sample files found at

      /cluster/tufts/wongjiradlab/larbys/data/mcc9/mcc9_vXX_YYYY

* Step 1: decide on a name for this sample
* Step 2: copy the goodlist.txt from the input sample file folder into `inputlists` folder. You can make this `goodlist.txt`
  by running `make_bad_list.py` in the sample folder. Not in the folder? You can find a copy in past sample folders.
  Note that the name of the file in the `inputlists` folder should be `[sample-name].list`.
* Step 3: setup `submit_batch_mc.sh` with the sample name and run. Can play with STRIDE to modify how many jobs run and for how long.
* Step 4: once this finishes, edit and run `find_missing_jobs.py`. This will look for missing entries in the inputlist that does not 
  have a corresponding output.
* Step 5: edit and run `submit_makeup_job.sh` to run this sample. Number of jobs in the array should be the number of missing files.
  Repeat Steps 4+5 until there are no bad jobs. Or the files failing are due to a bug one cannot fix at the moment.
* Step 6: edit and run `submit_subfolder_hadd.sh` to make intermediate hadd files
* Step 7: edit and run `submit_final_hadd.sh` to make final, complete hadd file
* Step 8a: Normalize the sample by getting the POT, if MC. (to do)
* Step 8b: Normalize the sample by getting the POT and spills, if data. (to do)

## Workflow for xfer of samples

### Get the definition

First step is to get a definition for the sample you want.

Definitions for the detector variation samples are found [here for version MCC9 made 40a_dl](https://microboone-exp.fnal.gov/at_work/AnalysisTools/mc/mcc9.0/details_ssnet_detvar_v40a_dl.html).
Click on the number of events link under the `merged_dlreco` to get a page giving you the definition.

### Prepare metadata and filepath list 

Next, go to folder `/uboone/data/users/tmw/workdir_xfer_mcc9_detvar_to_tufts`

Note: if you are logging in for the first time, you need to setup ROOT and the tools to talk to the SAM data base.

To setup `ROOT` and `jobsub_client` tools

    source /cvmfs/uboone.opensciencegrid.org/products/setup_uboone.sh
    setup uboonecode v08_00_00_40a_dl -q e17:prof

To renew your certificates for accessing the SAM database

    kinit
    kx509
    voms-proxy-init -noregen -rfc -voms fermilab:/fermilab/uboone/Role=Analysis


Make the metadata files for the sample using `compile_filelist.py`

    python compile_filelist.py [defname]


This will make a folder `[defname]` containing two files, `[defname].json` and `[defname].pathlist`. We will want to transfer both to Tufts.

### Prestage the dataset

Finally, prestage the files:

    samweb prestage-dataset --defname=[defname]

### Transfer the metadata, filepath list, and files to Tufts

Now log into Tufts and make a directory in `/cluster/tufts/wongjiradlab/larbys/data/mcc9/`.

Make a directory in that folder for the files to go into. The folder name convention is:

     mcc9_[version]_dl_[run]_[sample description]

Then copy the metadata and pathlist to this folder.

Also copy two scripts we'll need:

    cp /cluster/tufts/wongjiradlab/larbys/data/mcc9/mcc9_v29e_dl_run3_G1_extbnb_dlana/xfer2.py [your folder]
    cp /cluster/tufts/wongjiradlab/larbys/data/mcc9/mcc9_v29e_dl_run3_G1_extbnb_dlana/make_bad_list.py [your folder]


We'll need to edit `xfer2.py` to tailor it to your definition.

First, change the script to read in the right json file. Change the following line:

    fjson = open('dlana_data_extbnb_run3_ssnet_G1_dlreco_wc_ssnet_G1_merged_dlana.json','r')

Next change the script to parse the Fermilab path correctly. Change the line:

    splitdir="ssnet_G1"

This determines the token used to split the path. We want to put the copied file in Tufts in a subdirectory similary to that on FNAL.
For example, the FNAL path of

    /pnfs/uboone/overlay/uboone/merged_dlreco/prod_v08_00_00_29e_dl/ssnet_nc_pi0_overlay_DetVar_CV_v08_00_00_29e_dl/run1_ssnet/00/00/54/35/merged_dlreco_b156491a-c8de-4388-abf1-e56e5d238a6f.root

would be split at "ssnet_G1" so that the file will be copied to Tufts at

   data/00/00/54/35/merged_dlreco_b156491a-c8de-4388-abf1-e56e5d238a6f.root


Finally, make sure the following line is looking for `merged_dlreco*root` filename patterns:

    plist = os.popen("find $PWD/data/ -name merged_dlreco*root")

Depending on what script you copied, this might be `merged_dlana*root`.

Once the script is modified, run it:

    python xfer2.py

Note: you'll have to kinit on Tufts to be given permission. Depending on the size of the sample, this might take awhile. 
If the transfer gets interupted the script should know how to ignore already transferred files.

### Make a goodlist

You want to run `make_bad_list.py` to find which files are missing key trees. (This is due to a known bug.)

In the script, make sure the following line is looking for `merged_dlreco*root` filename patterns:

    plist = os.popen("find $PWD/data/ -name merged_dlreco*root")

Depending on what script you copied, this might be `merged_dlana*root`.

You need to run this inside a container that is setup for ROOT.

    module load singularity
    singularity shell /cluster/tufts/wongjiradlab/larbys/larbys-containers/singularity_dldependencies_pytorch1.3.sing
    bash
    cd /cluster/tufts/wongjiradlab/twongj01/production/dllee_unified_v1_0_5
    source setup_tufts_container.sh
    source configure.sh

In the container, run:

    python make_bad_list.py


This will makea file, `goodlist.txt`. Copy this to `/cluster/tufts/wongjiradlab/larbys/run_dlana_jobs/inputlists/` the name of the file is ideally the name of the sample dir + ".list".

The use the instructions in the previous section to run the jobs.


        




