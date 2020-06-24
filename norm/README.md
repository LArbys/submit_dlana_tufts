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
| -------- :|: ------ :|: ------ :|: ------- :|: ------- :|: -------:|: ----- :|
| Delivered |  1.896   |   3.305  |     0.501 |    2.653  |    3.759 |  12.114 |
| To tape   |  1.832   |   3.123  |     0.483 |    2.530  |    3.577 |  11.545 |
| With good beam quality | 1.813 | 3.051  | 0.442 | 2.226 | 3.367 | 10.898 |
| After runcat cuts      | 1.792 | 2.744  | 0.441 | 2.222 | 3.277 | 10.477 |
| After manual cuts      | 1.711 | 2.744  | 0.441 | 2.222 | 3.206 | 10.324 |
| After reco-metric cuts | 1.683 | 2.674  | 0.439 | 2.166 | 3.153 | 10.115 |


Total for RUNS1+2+3: `6.962e20` if 100% processing

# RUN 1

Total Processed: ` 1.544e20 / 1.683e20 = 91.7% `

## RUN 1 C1 FIRST PASS

```
Read 54360 lines from dlana_data_bnb_dlreco_wc_ubdlana_v1_1_0_run1_ssnet_C1_merged_dlana/reco1uniqueparents_dlana_data_bnb_dlreco_wc_ubdlana_v1_1_0_run1_ssnet_C1_merged_dlana.list
           EXT         Gate2        E1DCNT        tor860        tor875   E1DCNT_wcut   tor860_wcut   tor875_wcut
    30310480.0    37202478.0    37272955.0      1.56e+20     1.558e+20    34457492.0     1.544e+20     1.542e+20
```

## RUN 1 C1 MAKEUP


## RUN 1 C1 EMPTY

# RUN 2

Total processed: ` 1.595e+20 / 2.674e+20 = (59.6%) `

## RUN 2 D1 FIRST PASS

```
[ tmw@uboonebuild02 workdir_xfer_prod_to_tufts ]$ python getDataInfo.py -v2 --file-list=dlana_data_bnb_dlreco_wc_ubdlana_v1_1_0_run2_ssnet_D2_merged_dlana/reco1uniqueparents_dlana_data_bnb_dlreco_wc_ubdlana_v1_1_0_run2_ssnet_D2_merged_dlana.list 
Read 41803 lines from dlana_data_bnb_dlreco_wc_ubdlana_v1_1_0_run2_ssnet_D2_merged_dlana/reco1uniqueparents_dlana_data_bnb_dlreco_wc_ubdlana_v1_1_0_run2_ssnet_D2_merged_dlana.list
           EXT         Gate2        E1DCNT        tor860        tor875   E1DCNT_wcut   tor860_wcut   tor875_wcut
    66763579.0    39047565.0    39123798.0     1.632e+20      1.63e+20    35063854.0     1.595e+20     1.593e+20
```

## RUN 2 D1 MAKEUP


## RUN 2 D1 EMPTY



# RUN 3

Total Processed: ` ( 1.482e+20 + 2.589e+19 + 1.162e+17 )/ 2.166e+20 (80.4%) `

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