#!/bin/zsh
# setup_remote_sensing.sh
# This script installs key tools and packages for a climate scientist working in remote sensing on macOS.
# It uses Homebrew for package management, installs some GUI applications via Homebrew Cask,
# sets up Miniconda for environment management, and installs common Python packages.
# Usage:
# to use this script, put this in a desired folder. 
# (I use Documents/projects).
# Then, type this in the commandline
# chmod +x ~/Documents/projects/setup_tools.sh
# cd ~/Documents/projects/
# ./setup_tools.sh


# ---------------------------
# 1. Install Homebrew (if not installed)
# This is a program manager for Mac-OS
# ---------------------------
if ! command -v brew &> /dev/null; then
  echo "Homebrew not found. Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Update Homebrew
echo "Updating Homebrew..."
brew update

# ---------------------------
# 2. Install Command-line Tools via Homebrew
# ---------------------------
echo "Installing commandline tools via Home Brew. This includes Git, GDAL, CDO, NCO, and AWS CLI..."
# git for saving snap-shots of your code for backup and collaboration.
brew install git
# GDOL for dealing with satellite and map data.
brew install gdal
# CDO and MCL for sensing and climate model output files.
brew install cdo nco
# AWS for interacting with cloud-based platforms.
brew install awscli

# ---------------------------
# 3. Install GUI Applications using Homebrew Cask
# ---------------------------
echo "Installing Visual Studio Code, RStudio, QGIS, and Docker..."
# VS Code for editting and runnning code (python mainly).
brew install --cask visual-studio-code
# R-Studio for writing and reading R code.
brew install --cask rstudio
# QGIS for minipulating map-ddata.
brew install --cask qgis
# Docker is to make different programs and codes more portable between computers (for sharing).
brew install --cask docker


# ---------------------------
# 4. Install Miniconda (for Python environment management and downloading packages)
# ---------------------------
if [ ! -d "$HOME/miniconda3" ]; then
  echo "Downloading and installing Miniconda..."
  curl -LO https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh
  bash Miniconda3-latest-MacOSX-x86_64.sh -b -p $HOME/miniconda3
  # Initialize conda for zsh
  eval "$($HOME/miniconda3/bin/conda shell.zsh hook)"
  conda init zsh
  rm Miniconda3-latest-MacOSX-x86_64.sh
fi

# Activate conda for the current session
if command -v conda &> /dev/null; then
  eval "$($HOME/miniconda3/bin/conda shell.zsh hook)"
fi

# ---------------------------
# 5. Create and Activate a Conda Environment for Remote Sensing
# Note: each project should be its own environment for the future
# But here, we build a default remote-sensing one.
# this environment is called climate-base
# ---------------------------
echo "Creating and activating the 'remote_sensing_env' conda environment..."
conda create -n climate-base python=3.9 -y
conda activate climate-base
# Note: We use Python 3.9 because it is the most stable and supported version right now.

# ---------------------------
# 6. Install Python Packages via pip (within the conda environment)
# ---------------------------
echo "Installing Python packages..."
# packages for linear algebra and stat analyses.
pip install numpy pandas scipy
# packages for opening and accessing multi-dimensional data files.
pip install xarray netcdf4 h5netcdf zarr
# Package for geographic projections and geo-spatial data.
pip install rasterio geopandas pyproj
# Google Earth Engine
pip install earthengine-api
# packagers for plotting data.
pip install matplotlib cartopy earthpy
# packages for machine learning and AI tools.
pip install scikit-learn torch dask[complete]

echo "Setup complete! To activate your environment, please type in the following command. \n"
echo "conda activate climate-base"
echo "Good luck, and happy coding!"
