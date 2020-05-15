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


```
[ tmw@uboonebuild02 workdir_xfer_prod_to_tufts ]$ python getDataInfo.py -v2 --file-list reco1parents_bnbrun3g_1e19.txt
Read 2515 lines from reco1parents_bnbrun3g_1e19.txt
EXT         Gate2        E1DCNT        tor860        tor875   E1DCNT_wcut   tor860_wcut   tor875_wcut
4542201.0     2253028.0     2263559.0     8.786e+18     8.806e+18     1882720.0     7.795e+18     7.812e+18

```