for fold in {0..4}
do
    # echo "nnUNetv2_train 1 3d_lowres $fold"
    nnUNetv2_train --npz 102 2d $fold 
done



# CUDA_VISIBLE_DEVICES=0 nnUNetv2_train --npz 101 2d 0 &
# CUDA_VISIBLE_DEVICES=5 nnUNetv2_train --npz 101 2d 1 &
# CUDA_VISIBLE_DEVICES=2 nnUNetv2_train 101 2d 2 &
# CUDA_VISIBLE_DEVICES=3 nnUNetv2_train 101 2d 3 &
# CUDA_VISIBLE_DEVICES=4 nnUNetv2_train 101 2d 4 &
# wait

# nnUNetv2_predict -i /remote-home/13595169576/lyy/projects/nnunet/nnUNet/DATASET/nnUNet_raw/Dataset101_seg/imagesTs -o /remote-home/13595169576/lyy/projects/nnunet/nnUNet/output/output_0701 -d 101 -c 2d --save_probabilities
# CUDA_VISIBLE_DEVICES=1 nnUNetv2_train --npz 103 2d 0

# 数据集预处理
# nnUNetv2_plan_and_preprocess -d DATASET_ID --verify_dataset_integrity

# 训练
# nnUNet_compile=False CUDA_VISIBLE_DEVICES=2 nnUNetv2_train --npz 103 2d 0 & CUDA_VISIBLE_DEVICES=3 nnUNetv2_train --npz 103 2d 2 & wait
# nnUNet_compile=False nnUNetv2_train DATASET_NAME_OR_ID UNET_CONFIGURATION FOLD
# CUDA_VISIBLE_DEVICES=0 nnUNetv2_train --npz 103 2d 0 --c & CUDA_VISIBLE_DEVICES=1 nnUNetv2_train --npz 103 2d 1 --c & CUDA_VISIBLE_DEVICES=3 nnUNetv2_train --npz 103 2d 3 --c & CUDA_VISIBLE_DEVICES=4 nnUNetv2_train --npz 103 2d 4 --c & wait

# 寻找最佳配置
# nnUNetv2_find_best_configuration DATASET_NAME_OR_ID -c CONFIGURATIONS 