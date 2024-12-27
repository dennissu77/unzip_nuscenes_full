#!/bin/bash

# 功能：解壓縮 nuScenes v1.0-mini 資料集

# 確保腳本執行過程中遇到錯誤會中止
set -e

# 輸出資料夾位置（絕對路徑）
DATA_OUTPUT_DIR="/home/ennis/data_save/nuscenes"

# 檢查 v1.0-mini 資料集是否存在
MINI_FILE="v1.0-mini.tar"
if [ ! -f ${MINI_FILE} ]; then
    echo "錯誤：找不到檔案 ${MINI_FILE}"
    exit 1
fi

# 建立目標資料夾（如果不存在）
mkdir -p ${DATA_OUTPUT_DIR}

# 解壓縮 v1.0-mini 到目標資料夾
tar -xvf ${MINI_FILE} -C ${DATA_OUTPUT_DIR}

# 提示解壓完成
echo "解壓縮完成！所有 mini 資料已存放於 ${DATA_OUTPUT_DIR}"

