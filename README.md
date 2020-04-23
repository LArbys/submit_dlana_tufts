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



