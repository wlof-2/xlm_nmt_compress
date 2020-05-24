# Cross-lingual Language Model Pretraining + NMT task
Implementation of XLM pretrained model with NMT task

### Contents

* [Installation](#installation)
* [Usage](#usage)
  * [Train](#train)

---

## Installation
```
virtualenv venv -p python3
source venv/bin/activate
-PyTorch (currently tested on version 0.4 and 1.0) https://pytorch.org/get-started/locally/
-fastBPE (generate and apply BPE codes) https://github.com/facebookresearch/XLM/tree/master/tools#fastbpe
-Moses (scripts to clean and tokenize text only - no installation required) https://github.com/facebookresearch/XLM/tree/master/tools#tokenizers
-Apex (for fp16 training) https://github.com/nvidia/apex#quick-start
```

## Usage

### Train XLM + UNMT
Download model mlm_17_1280.pth (en-pt) (cd ./)
https://dl.fbaipublicfiles.com/XLM/mlm_ende_1024.pth

Download corpus en-pt (cd ./data-en-pt/mono)
https://drive.google.com/open?id=1MMMLWYpqq0d6HLQXzhYOJni-X5zno834

Preprocess data (Will create the "/data-en-pt/processed" folder)
```
./get-data-nmt.sh --src en --tgt pt --reload_codes codes_xnli_17.txt --reload_vocab vocab_xnli_17.txt
```

Train (CPU)
```
bash train.sh
```
Train (GPU)
```
bash train-gpu.sh
```