#!/usr/bin/env bash

# please set the variable first!!!
LIP_DATASET_DIR=/home/user/dataset/LIP



# create virtual environment
function create_venv(){
    pip3 install --user virtualenv
    virtualenv -p python3 venv
}

function install_python_packages(){
    # install packages into virtual environment
    source venv/bin/activate
    pip install -r requirements.txt
    deactivate
}

function compile_modules(){
    # compile modules
    source venv/bin/activate
    pushd libs
    bash build.sh
    python build.py
    popd
    deactivate
}


function create_dataset(){
    # create LIP dataset structure
    mkdir -p dataset/LIP
    cd dataset/LIP
    ln -s ${DATASET_DIR}/TrainVal_images/TrainVal_images/train_images
    ln -s ${DATASET_DIR}/TrainVal_images/TrainVal_images/val_images
    ln -s ${DATASET_DIR}/Testing_images/Testing_images/testing_images 
    ln -s ${DATASET_DIR}/TrainVal_parsing_annotations/TrainVal_parsing_annotations/train_segmentations
    ln -s ${DATASET_DIR}/TrainVal_parsing_annotations/TrainVal_parsing_annotations/val_segmentations
    ln -s ${DATASET_DIR}/TrainVal_parsing_annotations/TrainVal_parsing_annotations/labels
    ln -s ${DATASET_DIR}/train_edges
    ln -s ${DATASET_DIR}/val_edges
}


# ln -s /home/dx/datasets/LIP/data/labels/segmentation/train_segmentations train_labels
# ln -s /home/dx/datasets/LIP/data/labels/segmentation/train_segmentations_reversed/ train_labels_rev
# ln -s /home/dx/datasets/LIP/data/labels/segmentation/val_segmentations val_labels
# ln -s /home/dx/datasets/LIP/data/labels/edges/* ./
# ln -s /home/dx/datasets/LIP/data/images/* ./


create_venv
install_python_packages
compile_modules
#create_dataset


# change script mode
chmod +x run.sh
chmod +x run_evaluate.sh

# prompt users
echo 'please download the models and LIP dataset'
echo 'and place the models into the dataset folder'
echo 'adn set the DATASET_DIR variable'
