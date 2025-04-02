
# Climate Sensing Tools and Environment Setup Guide

## Introduction

Welcome to remote sensing and climate science research at Stanford! This document outlines the necessary software, tools, and best practices to set up your computational environment on macOS. It is designed to help you get started quickly and also understand the purpose of each tool and package. Whether you choose to run the automated installation script or set up everything manually, this guide provides a solid foundation.

---

## Automated Setup Script Instructions

A shell script (`setup_climate_tools.sh`) is provided to automate many installation steps. If you're comfortable with the Terminal, you can use this script to quickly set up your environment. Otherwise, refer to the manual installation steps later in this document.

### How to Run the Script

1. **Save the Script:**  
   Save the script as `setup_remote_sensing.sh`.

2. **Make it Executable:**
   ```zsh
   chmod +x setup_remote_sensing.sh
   ```

3. **Run the Script:**
   ```zsh
   ./setup_remote_sensing.sh
   ```

---

## Tools & Their Purpose

### Development Environments & Code Editors

- **Visual Studio Code (VS Code):**  
  A lightweight, versatile code editor.
  - **Extensions:**
    - **Python Extension (by Microsoft):** Enables Python IntelliSense, debugging, and code navigation.
    - **Jupyter Extension (by Microsoft):** Run and edit Jupyter notebooks within VS Code.
    - **GitLens:** Provides detailed insights into Git history and version control.
    - **Remote Development Extensions:** Useful for working on remote servers or containers.
    - **Docker Extension (optional):** Manage Docker images and containers.

- **PyCharm (Community Edition):**  
  An IDE focused on Python, with robust debugging and refactoring tools. It's also prettier.
- **RStudio:**  
  A dedicated IDE for R, useful if you work with R-based geospatial analyses.

### Package Managers & Environment Tools

- **Homebrew:**  
  The macOS package manager used to install command-line tools and GUI applications.
- **Miniconda/Anaconda:**  
  Environment management tools to create isolated Python environments and manage packages easily.

### Specialized Remote Sensing & Geospatial Tools

- **GDAL:**  
  A library for geospatial data processing.
- **rasterio & geopandas:**  
  Python packages for reading, writing, and processing raster and vector geospatial data.
- **xarray:**  
  For handling multi-dimensional arrays (e.g., climate datasets).  
  - **Optional Backends:**  
    - **netCDF4 / h5netcdf:** For reading and writing netCDF files.
    - **Zarr:** For cloud-optimized, chunked data storage.
- **Visualization Libraries:**
  - **matplotlib:** General plotting.
  - **cartopy:** Map projections and geospatial visualizations.
  - **earthpy:** Simplifies plotting and analysis of earth science data.
- **Machine Learning & Data Analysis:**
  - **scikit-learn:** Standard machine learning tools.
  - **TensorFlow or PyTorch:** For deep learning applications.
  - **Dask:** For scaling computations on large datasets.

### GIS & Remote Sensing Software

- **QGIS:**  
  A free, open-source GIS tool for spatial data visualization and analysis.
- **ESA SNAP Toolbox:**  
  Specifically designed for processing Sentinel satellite data.
- **Command-Line Tools (CDO & NCO):**  
  Tools for manipulating climate and forecast model data stored in NetCDF format.

### Version Control & Cloud Tools

#### Git & GitHub

- **Git:**  
  Version control software for tracking changes in your code.
  - **Configuration:**  
    Set your Git username and email:
    ```bash
    git config --global user.name "Your Name"
    git config --global user.email "your.email@example.com"
    ```
  - **Authentication Best Practices:**  
    Use SSH keys or Personal Access Tokens (PATs) instead of passwords.
  - **Common Commands:**
    - Clone: `git clone <repository-url>`
    - Branch: `git checkout -b feature-branch`
    - Commit: `git add . && git commit -m "Descriptive commit message"`
    - Push: `git push origin feature-branch`

#### Google Earth Engine (GEE)

- **Google Earth Engine:**  
  A cloud-based platform for planetary-scale geospatial analysis.
  - **Access:**  
    Apply for an account at [Google Earth Engine Signup](https://signup.earthengine.google.com/).
  - **Python API:**  
    Install via pip:
    ```bash
    pip install earthengine-api
    ```
  - **Initialization:**  
    Authenticate by running:
    ```bash
    earthengine authenticate
    ```
  - **Best Practices:**  
    Keep your API credentials secure and avoid hard-coding them in your scripts.

### Additional Tools & Utilities

- **Docker:**  
  Containerization platform to ensure consistent environments.
- **Cloud Service CLIs:**  
  - **AWS CLI:** Installed via Homebrew.
  - **Google Cloud SDK:** For managing Google Cloud services.
- **Git (Alternative Installation):**  
  Available via [Git SCM](https://git-scm.com/download/mac) if you prefer not to use Homebrew.

---

## Coding Best Practices

For maintaining readable, maintainable, and professional code, consider the following best practices:

### Comments & Docstrings

- **Comments:**  
  Use inline comments to explain non-obvious parts of your code.
  ```python
  # Calculate the mean temperature from the dataset
  mean_temp = np.mean(temperature_data)
  ```
- **Docstrings:**  
  Write clear docstrings for your functions, classes, and modules to explain their purpose, parameters, and return values.
  ```python
  def calculate_mean(data):
      """
      Calculate the mean of a list of numbers.

      Parameters:
      data (list of float): A list of numerical values.

      Returns:
      float: The mean of the input values.
      """
      return sum(data) / len(data)
  ```
- **Follow PEP8:**  
  Adhere to Python’s PEP8 style guidelines for naming conventions, line lengths, and code structure. Tools like `flake8` or `pylint` can help enforce these standards.

### Version Control & Code Organization

- **Frequent Commits:**  
  Commit changes regularly with meaningful commit messages.
- **Branching Strategy:**  
  Use feature branches to isolate new developments.
- **Code Reviews:**  
  Engage in peer reviews (PRs) to catch issues early and improve code quality.

---

## Detailed Installation Steps

Below is an overview of how to install each component manually if you choose not to run the automated script:

### 1. Homebrew

Install Homebrew using the following command in your Terminal:
```zsh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### 2. Essential Command-Line Tools

Install tools like Git, GDAL, CDO, NCO, and AWS CLI:
```zsh
brew install git gdal cdo nco awscli
```

### 3. GUI Applications

Install applications like VS Code, PyCharm, RStudio, QGIS, and Docker using Homebrew Cask:
```zsh
brew install --cask visual-studio-code pycharm-ce rstudio qgis docker
```

### 4. Miniconda/Anaconda

Download and install [Miniconda](https://docs.conda.io/en/latest/miniconda.html) (recommended for a lightweight installation) or [Anaconda](https://www.anaconda.com/products/distribution). Then, create and activate a dedicated environment:
```bash
conda create -n remote_sensing_env python=3.9 -y
conda activate remote_sensing_env
```

### 5. Python Packages

Install core packages using pip or conda (prefer conda-forge for geospatial packages):
```bash
pip install numpy pandas xarray rasterio geopandas matplotlib cartopy earthpy scikit-learn tensorflow dask[complete]
```
Alternatively, use conda for better dependency management:
```bash
conda install -c conda-forge numpy pandas xarray rasterio geopandas matplotlib cartopy earthpy scikit-learn tensorflow dask
```

### 6. Google Earth Engine API

Install the Earth Engine API:
```bash
pip install earthengine-api
```
Then, authenticate:
```bash
earthengine authenticate
```

---

## Best Practices Recap

- **Maintain Lean Conda Environments:**  
  Create project-specific environments, specify package versions, and clean unused packages with `conda clean --all`.
- **Version Control:**  
  Configure Git globally, use SSH keys or PATs for authentication, and commit changes frequently.
- **Coding Standards:**  
  Write clear comments, comprehensive docstrings, and adhere to PEP8 guidelines.
- **Tool Familiarity:**  
  Understand the role of each tool:
  - **VS Code/PyCharm:** Code editing and development.
  - **QGIS:** Advanced spatial analysis.
  - **Google Earth Engine:** Cloud-based geospatial analysis.
  - **Python Packages:** Data manipulation, visualization, and geospatial processing.
- **Secure API Management:**  
  Keep sensitive credentials out of your codebase.

---

## Conclusion

This comprehensive guide provides everything you need to set up a robust computing environment for your remote sensing research at Stanford. It includes automated installation options, manual steps, tool descriptions, and coding best practices to ensure you build a solid foundation for your work. If you have any questions or require further assistance, please feel free to reach out.

Happy coding and best of luck with your research!

---
