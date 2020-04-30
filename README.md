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



## Updated BATCH workflow

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