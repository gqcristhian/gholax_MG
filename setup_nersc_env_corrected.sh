#!/bin/bash
set -e

module load python

ENV_PREFIX="$HOME/conda-envs/gholax"

conda create --prefix "$ENV_PREFIX" python=3.13 pip ipykernel -y
conda activate "$ENV_PREFIX"

export PYTHONNOUSERSITE=1

pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu126
pip install --upgrade "jax[cuda12]==0.6.2"
pip install blackjax
mamba install numpy scipy pyyaml setuptools ipython jupyter cython gsl matplotlib h5py emcee --yes
pip install interpax==0.3.8 optax==0.2.4
pip install jaxopt
pip install flowjax==18.0.0
pip install git+https://github.com/sfschen/spinosaurus.git
pip install git+https://github.com/sfschen/velocileptors.git
pip install git+https://github.com/AemulusProject/aemulus_heft.git
python -m pip cache purge
pip install classy
pip install getdist --upgrade-strategy only-if-needed
pip install .

python -m ipykernel install --user --name gholax --display-name gholax