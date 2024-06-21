#!/bin/bash

# Threshold tstat image at specified p-value using TFCE -logp map

home='/Users/ely/Desktop/data_local/VG/OHBM_2024_brainhack_demo'

# threshold = 1.602 = -log10(0.05/2), corrects for multiple comparisons across 2 source images (corical + subcortical maps)
wb_command -cifti-math '((a*(b>=1.602))+(a*(c>=1.602)))' \
	$home/palm_merged_ciftis/pTT05tfce-mcfwep_vox_tstat_all_xASdm_Shock_N26_MSMAll_uS4_n1000.dscalar.nii \
	-var a $home/palm_merged_ciftis/vox_tstat_c1_all_xASdm_Shock_N26_MSMAll_uS4_n1000.dscalar.nii \
	-var b $home/palm_merged_ciftis/tfce_tstat_mcfwep_c1_all_xASdm_Shock_N26_MSMAll_uS4_n1000.dscalar.nii \
	-var c $home/palm_merged_ciftis/tfce_tstat_mcfwep_c2_all_xASdm_Shock_N26_MSMAll_uS4_n1000.dscalar.nii
wb_command -set-map-names $home/palm_merged_ciftis/pTT05tfce-mcfwep_vox_tstat_all_xASdm_Shock_N26_MSMAll_uS4_n1000.dscalar.nii -map 1 p05_TFCE_tstat
