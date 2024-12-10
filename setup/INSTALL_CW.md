### Step 1: Update System Packages
First, update your system packages to ensure everything is up to date:
sudo apt update && sudo apt upgrade

### Step 2: Install Required Packages
Ensure that Python and other essential tools are installed:
 Install basic dependencies
sudo apt install -y make git python3 python3-pip ipython3

Next, install the build dependencies for compiling Python from pyenv:

sudo apt install -y build-essential gdb lcov pkg-config \
    libbz2-dev libffi-dev libgdbm-dev libgdbm-compat-dev liblzma-dev \
    libncurses5-dev libreadline6-dev libsqlite3-dev libssl-dev \
    lzma lzma-dev tk-dev uuid-dev zlib1g-dev curl

Install the prerequisites for building firmware for ChipWhisperer targets:

sudo apt install -y libusb-dev avr-libc gcc-avr \
    gcc-arm-none-eabi libusb-1.0-0-dev usbutils

### Step 3: Clone the ChipWhisperer Repository
 Now, clone the ChipWhisperer repository:

git clone https://github.com/newaetech/chipwhisperer.git
cd chipwhisperer

Initialize the submodules:
git submodule update --init jupyter

### Step 4: Set Up Udev Rules and User Groups
 Ensure that ChipWhisperer can access USB devices:
 Copy udev rules to allow ChipWhisperer to access hardware
sudo cp hardware/50-newae.rules /etc/udev/rules.d/50-newae.rules

 Create the 'chipwhisperer' user group and add your user to it
sudo groupadd -f chipwhisperer
sudo usermod -a -G chipwhisperer $USER

 Add user to additional groups for access to serial devices and USB
sudo usermod -a -G tty $USER
sudo usermod -a -G dialout $USER
sudo usermod -a -G plugdev $USER

 Reload udev rules to apply changes
sudo udevadm control --reload-rules

### Step 5: Set Up Python Environment
Create a virtual environment for ChipWhisperer:

python3 -m venv .venv --prompt cw

 Activate the virtual environment:

source .venv/bin/activate

Install the ChipWhisperer package in editable mode:

python -m pip install -e .

Next, install the dependencies required for Jupyter notebooks:

python -m pip install -r jupyter/requirements.txt

Install nbstripout to manage notebook outputs:

cd jupyter
python -m pip install nbstripout
nbstripout --install

### Step 6: Test the Installation
While still in the virtual environment, launch Jupyter Lab:

jupyter lab

Navigate to the jupyter folder and open a Jupyter notebook to test the connection to your ChipWhisperer device.

### Step 7: Optional: Set Up VS Code Integration (or Other IDEs)
For easier development in VS Code or other IDEs, install the ChipWhisperer kernel for Jupyter:

python3 -m ipykernel install --user --name=cw_kernel


