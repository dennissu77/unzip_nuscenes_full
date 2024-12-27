#!/bin/bash

# 功能：解壓縮 nuScenes_full 的相關檔案

# 確保腳本執行過程中遇到錯誤會中止
set -e

# 輸出資料夾位置（絕對路徑）
DATA_OUTPUT_DIR="/home/ennis/data_save/nuscenes"

# 檔案列表
FILES=(
    "nuScenes-map-expansion-v1.3.zip"
    "v1.0-test_blobs.tar"
    "v1.0-test_meta.tar"
    "v1.0-trainval_meta.tgz"
    "v1.0-trainval01_blobs.tar"
    "v1.0-trainval02_blobs.tar"
    "v1.0-trainval03_blobs.tgz"
    "v1.0-trainval04_blobs.tgz"
    "v1.0-trainval05_blobs.tgz"
    "v1.0-trainval06_blobs.tgz"
    "v1.0-trainval07_blobs.tgz"
    "v1.0-trainval08_blobs.tgz"
    "v1.0-trainval09_blobs.tgz"
    "v1.0-trainval10_blobs.tgz"
)

# 檢查所有檔案是否存在
for FILE in "${FILES[@]}"; do
    if [ ! -f ${FILE} ]; then
        echo "錯誤：找不到檔案 ${FILE}"
        exit 1
    fi
done

# 建立目標資料夾（如果不存在）
mkdir -p ${DATA_OUTPUT_DIR}/maps 

# 解壓縮 nuScenes-map-expansion-v1.3.zip 到 maps 資料夾
unzip "nuScenes-map-expansion-v1.3.zip" -d ${DATA_OUTPUT_DIR}/maps

# 依次解壓縮其他檔案到目標資料夾
for FILE in "${FILES[@]:1}"; do
    case ${FILE} in
        *.tar)
            tar -xvf ${FILE} -C ${DATA_OUTPUT_DIR}
            ;;
        *.tgz)
            tar -xzvf ${FILE} -C ${DATA_OUTPUT_DIR}
            ;;
        *)
            echo "警告：未知檔案類型 ${FILE}，跳過解壓縮"
            ;;
    esac
done

# 提示解壓完成
echo "解壓縮完成！所有檔案已存放於 ${DATA_OUTPUT_DIR}"

