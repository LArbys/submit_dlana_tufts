Notes on normalization:

| sample  | normalization factor  |
| ------- | --------------------- |
| mcc9_v29e_dl_run3b_bnb_nu_overlay_nocrtremerge | 8.98773223801e+20 POT |
| mcc9_v29e_dl_run3b_bnb_intrinsic_nue_overlay_nocrtremerge | 4.70704675581e+22 POT |
| mcc9_v29e_dl_run3_G1_extbnb | 39566274.0 EXT spills |
| mcc9_v28_wctagger_run3_bnb1e19 | 8.786e+18 POT, 2263559 spills (no beam quality cuts)  |
| mcc9_v28_wctagger_run3_bnb1e19 | 7.795e+18 POT, 1882720 spills (with beam quality cuts)  |
| mcc9_v28_wctagger_bnboverlay (run 1) | 4.71578587829e+20 POT |
| mcc9_v28_wctagger_nueintrinsics (run 1) | 9.80336875336e+22 |

# Expected POT from Good Run Tech Note


| POT       |  Run I   |  Run II  | Run IIIa  | Run IIIb  |  Run IV  |  Total  |
| --------:|:------:|:------:|:-------:|:-------:|:-------:|:-----:|
| Delivered |  1.896   |   3.305  |     0.501 |    2.653  |    3.759 |  12.114 |
| To tape   |  1.832   |   3.123  |     0.483 |    2.530  |    3.577 |  11.545 |
| With good beam quality | 1.813 | 3.051  | 0.442 | 2.226 | 3.367 | 10.898 |
| After runcat cuts      | 1.792 | 2.744  | 0.441 | 2.222 | 3.277 | 10.477 |
| After manual cuts      | 1.711 | 2.744  | 0.441 | 2.222 | 3.206 | 10.324 |
| After reco-metric cuts | 1.683 | 2.674  | 0.439 | 2.166 | 3.153 | 10.115 |


Total for RUNS1+2+3: `6.962e20` if 100% processing

# Processed Sample Summary, DATA

Note that this table uses `E1DCNT` and `tor875`, which does not include the beam quality flags. 
If you use them to plot, you need to recalculate the POT and Spill sums for that run using `E1DCNT_wcut` and `tor875_wcut`.

| RUN Epoch         | POT (no cut) | Spills (no cut)   | SAM definition name |
|:-----------------:| ------------- | ---------------- |:------------------- |
| Run 1 C1          |  1.558e+20    |  37272955        |  dlana_data_bnb_dlreco_wc_ubdlana_v1_1_0_run1_ssnet_C1_merged_dlana    | 
| Run 1 C1, makeup  |  1.869e+19    |  4461878         |  dlana_data_bnb_dlreco_wc_ubdlana_v1_1_0_makeup_run1_C1_makeup_merged_dlana    | 
| Run 1 C1, empty   |  1.129e+17    |  163840          |  tmw_data_bnb_mcc9.1_ssnet_v08_00_00_29e_dl_dlreco_makeup_v1_0_6_run1_C1_merged_dlreco_empty |
| **Run 1 Available**   |  **1.746e+20** | **41898673**    |                     |
| Run 2 D2          |  1.63e+20     |  39123798        |  dlana_data_bnb_dlreco_wc_ubdlana_v1_1_0_run2_ssnet_D2_merged_dlana    | 
| Run 2 D2, makeup  |  2.964e+19    |  7089070         |  dlana_data_bnb_dlreco_wc_ubdlana_v1_1_0_makeup_run2_D2_makeup_merged_dlana    | 
| Run 2 D2, empty   |  1.239e+19    |  3209256         |  tmw_data_bnb_mcc9.1_ssnet_v08_00_00_29e_dl_dlreco_makeup_v1_0_6_run2_D2_merged_dlreco_empty |
| Run 2 E1          |  6.507e+19     |  19914275        |  dlana_data_bnb_dlreco_wc_ubdlana_v1_1_0_makeup_run2_ssnet_E1_merged_dlana    | 
| Run 2 E1, makeup  |  --    |  --         |  not made yet    | 
| Run 2 E1, empty   |  --    |  --         |  not made yet |
| **Run 2 Available**   |  **2.701e+20** | **69336399**    |                     |
| Run 3 F1          |  4.3e+19     |     11229268     |   dlana_data_bnb_dlreco_wc_ubdlana_v1_1_0_makeup_run3_ssnet_F1_merged_dlana   | 
| Run 3 F1, makeup  |  --    |  --         |   Not made yet   | 
| Run 3 F1, empty   |  --    |  --         |   Not made yet   |
| Run 3 G1          |  1.701e+20    |  43980680        |  dlana_data_bnb_dlreco_wc_ubdlana_v1_1_0_run3_ssnet_G1_merged_dlana    | 
| Run 3 G1, makeup  |  2.97e+19     |  7676729         |  dlana_data_bnb_dlreco_wc_ubdlana_v1_1_0_makeup_run3_G1_makeup_merged_dlana   | 
| Run 3 G1, empty   |  1.524e+17    |  47803           |  tmw_data_bnb_mcc9.1_ssnet_v08_00_00_29e_dl_dlreco_makeup_v1_0_6_run3_G1_merged_dlreco_empty |
| **Run 3 Available**   |  **2.430e+20** | **62934480**    |                     |
| **TOTAL AVAILABLE**  |  **6.877e+20** | **174169552**

# DATA filtered samples

## 1m1p

Made with June BDT.

File locations relative to MCC9 file directory: `/cluster/tufts/wongjiradlab/larbys/data/mcc9/`

| RUN Epoch         | POT (no cut) | Spills (no cut)   | Final Vertex Variable Tree, Tufts location |
|:-----------------:| ------------- | ---------------- |:------------------- |
| Run 1 C1          |  1.746e+20    |  41898673        | mcc9_v29e_dl_run1_C1_bnb_dlfilter_1m1p/mcc9_v29e_dl_run1_C1_bnb_dlfilter_1m1p_v1_1_2b_fvv.root |
| Run 2 D2          |  2.050e+20    |  49422124        | mcc9_v29e_dl_run2_D2_bnb_dlfilter_1m1p/mcc9_v29e_dl_run2_D2_bnb_dlfilter_1m1p_v1_1_2b_fvv.root | 
| Run 2 E1          |  6.507e+19    |  19914275        | in preparation    |
| Run 3 F1          |  4.3e+19      |  11229268        | mcc9_v29e_dl_run3_F1_bnb_dlfilter_1m1p/mcc9_v29e_dl_run3_F1_bnb_dlfilter_1m1p_v1_1_2b_fvv.root | 
| Run 3 G1          |  2.000e+20    |  51705212        | mcc9_v29e_dl_run3_G1_bnb_dlfilter_1m1p/mcc9_v29e_dl_run3_G1_bnb_dlfilter_1m1p_v1_1_2b_fvv.root |


# RUN 1

Total Processed: `1.544e20 + 1.851e+19 = 1.7291e+20 / 1.68e20 = 102.7% `

## RUN 1 C1 FIRST PASS

```
Read 54360 lines from dlana_data_bnb_dlreco_wc_ubdlana_v1_1_0_run1_ssnet_C1_merged_dlana/reco1uniqueparents_dlana_data_bnb_dlreco_wc_ubdlana_v1_1_0_run1_ssnet_C1_merged_dlana.list
           EXT         Gate2        E1DCNT        tor860        tor875   E1DCNT_wcut   tor860_wcut   tor875_wcut
    30310480.0    37202478.0    37272955.0      1.56e+20     1.558e+20    34457492.0     1.544e+20     1.542e+20
```

## RUN 1 C1 MAKEUP

```
[ tmw@uboonebuild02 workdir_xfer_prod_to_tufts ]$ python getDataInfo.py -v2 --file-list dlana_data_bnb_dlreco_wc_ubdlana_v1_1_0_makeup_run1_C1_makeup_merged_dlana/reco1parents_dlana_data_bnb_dlreco_wc_ubdlana_v1_1_0_makeup_run1_C1_makeup_merged_dlana.txt.running 
Read 6321 lines from dlana_data_bnb_dlreco_wc_ubdlana_v1_1_0_makeup_run1_C1_makeup_merged_dlana/reco1parents_dlana_data_bnb_dlreco_wc_ubdlana_v1_1_0_makeup_run1_C1_makeup_merged_dlana.txt.running
           EXT         Gate2        E1DCNT        tor860        tor875   E1DCNT_wcut   tor860_wcut   tor875_wcut
     3469568.0     4450931.0     4461878.0     1.872e+19     1.869e+19     4119444.0     1.851e+19     1.849e+19
```

## RUN 1 C1 EMPTY

```
[ tmw@uboonebuild02 workdir_xfer_prod_to_tufts ]$ python getDataInfo.py -v2 -d tmw_data_bnb_mcc9.1_ssnet_v08_00_00_29e_dl_dlreco_makeup_v1_0_6_run1_C1_merged_dlreco_empty
Definition tmw_data_bnb_mcc9.1_ssnet_v08_00_00_29e_dl_dlreco_makeup_v1_0_6_run1_C1_merged_dlreco_empty contains 2248 files
           EXT         Gate2        E1DCNT        tor860        tor875   E1DCNT_wcut   tor860_wcut   tor875_wcut
     1979378.0      162239.0      163840.0      1.13e+17     1.129e+17       25823.0     1.118e+17     1.116e+17
```

# RUN 2

Total processed: ` 1.595e+20 (D2 first pass) + 2.912e+19 (D2 makeup nonzero) + 1.186e+19 (D2 makeup empty!) + 6.377e+19 (E1) = 2.6425e+20 / 2.674e+20 = (59.6%) `

## RUN 2 D2 FIRST PASS

```
[ tmw@uboonebuild02 workdir_xfer_prod_to_tufts ]$ python getDataInfo.py -v2 --file-list=dlana_data_bnb_dlreco_wc_ubdlana_v1_1_0_run2_ssnet_D2_merged_dlana/reco1uniqueparents_dlana_data_bnb_dlreco_wc_ubdlana_v1_1_0_run2_ssnet_D2_merged_dlana.list 
Read 41803 lines from dlana_data_bnb_dlreco_wc_ubdlana_v1_1_0_run2_ssnet_D2_merged_dlana/reco1uniqueparents_dlana_data_bnb_dlreco_wc_ubdlana_v1_1_0_run2_ssnet_D2_merged_dlana.list
           EXT         Gate2        E1DCNT        tor860        tor875   E1DCNT_wcut   tor860_wcut   tor875_wcut
    66763579.0    39047565.0    39123798.0     1.632e+20      1.63e+20    35063854.0     1.595e+20     1.593e+20
```

## RUN 2 D2 MAKEUP

After DLANA processing (use this for plots):
```
[ tmw@uboonebuild02 workdir_xfer_prod_to_tufts ]$ python getDataInfo.py -v2 --file-list=dlana_data_bnb_dlreco_wc_ubdlana_v1_1_0_makeup_run2_D2_makeup_merged_dlana/reco1uniqueparents_dlana_data_bnb_dlreco_wc_ubdlana_v1_1_0_makeup_run2_D2_makeup_merged_dlana.list
Read 7530 lines from dlana_data_bnb_dlreco_wc_ubdlana_v1_1_0_makeup_run2_D2_makeup_merged_dlana/reco1uniqueparents_dlana_data_bnb_dlreco_wc_ubdlana_v1_1_0_makeup_run2_D2_makeup_merged_dlana.list
           EXT         Gate2        E1DCNT        tor860        tor875   E1DCNT_wcut   tor860_wcut   tor875_wcut
    11902666.0     7075885.0     7089070.0     2.968e+19     2.964e+19     6369424.0     2.902e+19     2.899e+19
```

After dlreco-stage:
```
[ tmw@uboonebuild02 workdir_xfer_prod_to_tufts ]$ python getDataInfo.py -v2 -d tmw_data_bnb_mcc9.1_ssnet_v08_00_00_29e_dl_dlreco_makeup_v1_0_6_run2_D2_merged_dlreco_nonzero
Definition tmw_data_bnb_mcc9.1_ssnet_v08_00_00_29e_dl_dlreco_makeup_v1_0_6_run2_D2_merged_dlreco_nonzero contains 7553 files
           EXT         Gate2        E1DCNT        tor860        tor875   E1DCNT_wcut   tor860_wcut   tor875_wcut
    11938982.0     7098563.0     7111807.0     2.978e+19     2.975e+19     6391575.0     2.912e+19     2.909e+19
```

## RUN 2 D2 MAKEUP-EMPTY

```
[ tmw@uboonebuild02 workdir_xfer_prod_to_tufts ]$ python getDataInfo.py -v2 -d tmw_data_bnb_mcc9.1_ssnet_v08_00_00_29e_dl_dlreco_makeup_v1_0_6_run2_D2_merged_dlreco_empty
Definition tmw_data_bnb_mcc9.1_ssnet_v08_00_00_29e_dl_dlreco_makeup_v1_0_6_run2_D2_merged_dlreco_empty contains 7332 files
           EXT         Gate2        E1DCNT        tor860        tor875   E1DCNT_wcut   tor860_wcut   tor875_wcut
    19750303.0      150410.0     3209256.0     1.241e+19     1.239e+19     2823554.0     1.186e+19     1.185e+19
```

## RUN 2 E1 FIRST PASS

```
[ tmw@uboonebuild02 workdir_xfer_prod_to_tufts ]$ python getDataInfo.py -v2 -d data_bnb_mcc9.1_ssnet_run2_v08_00_00_29e_dl_ssnet_E1_merged_dlreco
Definition data_bnb_mcc9.1_ssnet_run2_v08_00_00_29e_dl_ssnet_E1_merged_dlreco contains 26951 files
           EXT         Gate2        E1DCNT        tor860        tor875   E1DCNT_wcut   tor860_wcut   tor875_wcut
    28935539.0    19309114.0    19914275.0     6.516e+19     6.507e+19    18208461.0     6.377e+19     6.369e+19
Warning!! BNB data for some of the requested runs/subruns is not in the database.
9 runs missing BNB data (number of subruns missing the data): 11361 (1),11362 (2),11370 (1),11372 (3),11375 (1),11376 (1),11380 (1),11382 (1),11354 (2),
```

# RUN 3

Total Processed G1: ` 1.482e+20 + 2.589e+19 + 1.162e+17  = 1.742062e+20 / 2.166e+20 (80.4%) `

The missing 3e19 are the G1 files Matt talked about?

## RUN 3 G1 Open 1e19

```
[ tmw@uboonebuild02 workdir_xfer_prod_to_tufts ]$ python getDataInfo.py -v2 --file-list reco1parents_bnbrun3g_1e19.txt
Read 2515 lines from reco1parents_bnbrun3g_1e19.txt
EXT         Gate2        E1DCNT        tor860        tor875   E1DCNT_wcut   tor860_wcut   tor875_wcut
4542201.0     2253028.0     2263559.0     8.786e+18     8.806e+18     1882720.0     7.795e+18     7.812e+18

```

## RUN 3 G1 MAIN SAMPLE

```
[ tmw@uboonebuild02 workdir_xfer_prod_to_tufts ]$ python getDataInfo.py -v2 --file-list=reco1parents_dlfilter_bnb_wc_ssnet_v08_00_00_20e_ubdlana_v1_1_1_run3_G1_1m1p_dlfilter_1m1p.txt.running
Read 48994 lines from reco1parents_dlfilter_bnb_wc_ssnet_v08_00_00_20e_ubdlana_v1_1_1_run3_G1_1m1p_dlfilter_1m1p.txt.running
EXT              Gate2          E1DCNT          tor860          tor875          E1DCNT_wcut     tor860_wcut     tor875_wcut
89372166.0       43829262.0     43980680.0      1.697e+20       1.701e+20       35667138.0      1.482e+20       1.485e+20
Warning!! BNB data for some of the requested runs/subruns is not in the database.
1 runs missing BNB data (number of subruns missing the data): 16228 (1),
```

## RUN 3 G1 MAKEUP

```
Read 8311 lines from dlana_data_bnb_dlreco_wc_ubdlana_v1_1_0_makeup_run3_G1_makeup_merged_dlana/reco1parents_dlana_data_bnb_dlreco_wc_ubdlana_v1_1_0_makeup_run3_G1_makeup_merged_dlana.txt.running
           EXT         Gate2        E1DCNT        tor860        tor875   E1DCNT_wcut   tor860_wcut   tor875_wcut
    15431581.0     7650323.0     7676729.0     2.963e+19      2.97e+19     6225443.0     2.589e+19     2.595e+19
Warning!! BNB data for some of the requested runs/subruns is not in the database.
1 runs missing BNB data (number of subruns missing the data): 15185 (3),
```

## RUN 3 G1 EMPTY

```
[ tmw@uboonebuild02 workdir_xfer_prod_to_tufts ]$ python getDataInfo.py -v2 -d tmw_data_bnb_mcc9.1_ssnet_v08_00_00_29e_dl_dlreco_makeup_v1_0_6_run3_G1_merged_dlreco_empty
Definition tmw_data_bnb_mcc9.1_ssnet_v08_00_00_29e_dl_dlreco_makeup_v1_0_6_run3_G1_merged_dlreco_empty contains 1482 files
           EXT         Gate2        E1DCNT        tor860        tor875   E1DCNT_wcut   tor860_wcut   tor875_wcut
     6667668.0       47100.0       47803.0      1.52e+17     1.524e+17       28491.0     1.162e+17     1.165e+17
Warning!! BNB data for some of the requested runs/subruns is not in the database.
4 runs missing BNB data (number of subruns missing the data): 15185 (2),15191 (4),15187 (4),15201 (7),
```
## RUN 3F MAIN SAMPLE

```
[ tmw@uboonebuild02 workdir_xfer_prod_to_tufts ]$ python getDataInfo.py -v2 --file-list=dlana_data_bnb_dlreco_wc_ubdlana_v1_1_0_makeup_run3_ssnet_F1_merged_dlana/reco1uniqueparents_dlana_data_bnb_dlreco_wc_ubdlana_v1_1_0_makeup_run3_ssnet_F1_merged_dlana.list
Read 5454 lines from dlana_data_bnb_dlreco_wc_ubdlana_v1_1_0_makeup_run3_ssnet_F1_merged_dlana/reco1uniqueparents_dlana_data_bnb_dlreco_wc_ubdlana_v1_1_0_makeup_run3_ssnet_F1_merged_dlana.list
           EXT         Gate2        E1DCNT        tor860        tor875   E1DCNT_wcut   tor860_wcut   tor875_wcut
    14402674.0    11169605.0    11229268.0      4.29e+19       4.3e+19     9120753.0      3.92e+19     3.929e+19
```
