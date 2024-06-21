#!/bin/bash

# Combine cortical .gii and subcortical .nii outputs from PALM into scalar cifti file

home='/Users/ely/Desktop/data_local/VG/OHBM_2024_brainhack_demo'

# voxel/vertexwise tstat maps (c1 = positive, c2 = negative)
wb_command -cifti-create-dense-from-template \
	$home/Surface_files/91282_Greyordinates.dscalar.nii \
	$home/palm_merged_ciftis/vox_tstat_c1_all_xASdm_Shock_N26_MSMAll_uS4_n1000.dscalar.nii \
	-volume-all          $home/palm_split_outputs/palm_all_xASdm_Shock_Pain_over_Null_N26_MSMAll_uS4_Scortex_n1000_vox_tstat_c1.nii \
	-metric CORTEX_LEFT  $home/palm_split_outputs/palm_all_xASdm_Shock_Pain_over_Null_N26_MSMAll_uS4_Bcortex_n1000_dpv_tstat_m1_c1.gii \
	-metric CORTEX_RIGHT $home/palm_split_outputs/palm_all_xASdm_Shock_Pain_over_Null_N26_MSMAll_uS4_Bcortex_n1000_dpv_tstat_m2_c1.gii
wb_command -set-map-names $home/palm_merged_ciftis/vox_tstat_c1_all_xASdm_Shock_N26_MSMAll_uS4_n1000.dscalar.nii -map 1 voxelwise_tstat_pos

wb_command -cifti-create-dense-from-template \
	$home/Surface_files/91282_Greyordinates.dscalar.nii \
	$home/palm_merged_ciftis/vox_tstat_c2_all_xASdm_Shock_N26_MSMAll_uS4_n1000.dscalar.nii \
	-volume-all          $home/palm_split_outputs/palm_all_xASdm_Shock_Pain_over_Null_N26_MSMAll_uS4_Scortex_n1000_vox_tstat_c2.nii \
	-metric CORTEX_LEFT  $home/palm_split_outputs/palm_all_xASdm_Shock_Pain_over_Null_N26_MSMAll_uS4_Bcortex_n1000_dpv_tstat_m1_c2.gii \
	-metric CORTEX_RIGHT $home/palm_split_outputs/palm_all_xASdm_Shock_Pain_over_Null_N26_MSMAll_uS4_Bcortex_n1000_dpv_tstat_m2_c2.gii
wb_command -set-map-names $home/palm_merged_ciftis/vox_tstat_c2_all_xASdm_Shock_N26_MSMAll_uS4_n1000.dscalar.nii -map 1 voxelwise_tstat_neg

# TFCE -log10(p) maps (c1 = positive, c2 = negative)
wb_command -cifti-create-dense-from-template \
	$home/Surface_files/91282_Greyordinates.dscalar.nii \
	$home/palm_merged_ciftis/tfce_tstat_mcfwep_c1_all_xASdm_Shock_N26_MSMAll_uS4_n1000.dscalar.nii \
	-volume-all          $home/palm_split_outputs/palm_all_xASdm_Shock_Pain_over_Null_N26_MSMAll_uS4_Scortex_n1000_tfce_tstat_cfwep_c1.nii \
	-metric CORTEX_LEFT  $home/palm_split_outputs/palm_all_xASdm_Shock_Pain_over_Null_N26_MSMAll_uS4_Bcortex_n1000_tfce_tstat_mcfwep_m1_c1.gii \
	-metric CORTEX_RIGHT $home/palm_split_outputs/palm_all_xASdm_Shock_Pain_over_Null_N26_MSMAll_uS4_Bcortex_n1000_tfce_tstat_mcfwep_m2_c1.gii
wb_command -set-map-names $home/palm_merged_ciftis/tfce_tstat_mcfwep_c1_all_xASdm_Shock_N26_MSMAll_uS4_n1000.dscalar.nii -map 1 tfce_logp_pos

wb_command -cifti-create-dense-from-template \
	$home/Surface_files/91282_Greyordinates.dscalar.nii \
	$home/palm_merged_ciftis/tfce_tstat_mcfwep_c2_all_xASdm_Shock_N26_MSMAll_uS4_n1000.dscalar.nii \
	-volume-all          $home/palm_split_outputs/palm_all_xASdm_Shock_Pain_over_Null_N26_MSMAll_uS4_Scortex_n1000_tfce_tstat_cfwep_c2.nii \
	-metric CORTEX_LEFT  $home/palm_split_outputs/palm_all_xASdm_Shock_Pain_over_Null_N26_MSMAll_uS4_Bcortex_n1000_tfce_tstat_mcfwep_m1_c2.gii \
	-metric CORTEX_RIGHT $home/palm_split_outputs/palm_all_xASdm_Shock_Pain_over_Null_N26_MSMAll_uS4_Bcortex_n1000_tfce_tstat_mcfwep_m2_c2.gii
wb_command -set-map-names $home/palm_merged_ciftis/tfce_tstat_mcfwep_c2_all_xASdm_Shock_N26_MSMAll_uS4_n1000.dscalar.nii -map 1 tfce_logp_neg
