#!/bin/bash

# environment builder, just do:
# 1- assume a conda env `rlt` was created and activated:
# `conda create -n rlt python=3.11  -y`
# 2- then you run this script: `bash setup.sh`

# CKG's recipe -- works to spin up repo with pinned versions in requirements.txt
uv pip install torch==2.6.0 --index-url https://download.pytorch.org/whl/cu124
uv pip install vllm==0.8.3 tensorboard

uv pip install -r requirements_08.txt

# NOTE: flash-attn's version wasn't pinned upstream, quite problematic
# + additionally, one ought install after all the other deps, to avoid
#   rather odd issues with bindings to torch and CUDA
uv pip install flash-attn==2.7.1.post4 --no-build-isolation
uv pip install flashinfer-python -i https://flashinfer.ai/whl/cu124/torch2.6/

