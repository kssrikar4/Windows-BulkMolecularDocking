# Bulk Docking Automation Script

This repository provides a script designed to automate molecular docking for bulk datasets. Molecular docking is a key computational technique used to predict the interaction between molecules, such as a drug candidate and its target protein. This script streamlines the docking process, making it efficient for large-scale applications.

## Features
- **Bulk processing**: Handles multiple molecular files for docking in one execution.
- **Automation**: Reduces manual intervention by automating key steps.
- **Efficiency**: Optimized for high-throughput docking projects.
- **Result Summary**: Includes a log script to extract and summarize the best docking scores into a CSV file.

## Prerequisites
Before using the script, ensure the following:
1. **Software**:
   - A molecular docking tool installed (e.g., AutoDock, AutoDock Vina, etc.).
   - Supporting tools for molecule preparation (e.g., OpenBabel).
2. **Environment**:
   - A Windows system (required for the provided `.bat` scripts).
   - Ensure the required executables are added to the system PATH.

## Installation
1. Clone this repository to your local system:
   ```bash
   git clone https://github.com/kssrikar4/Windows-BulkMolecularDocking.git
   cd bulk-docking
   ```

2. Place all the required input files (e.g., ligand files, receptor file) in the same directory as the scripts.
   - Ensure the receptor file is named `protein.pdbqt` for compatibility with the provided scripts.

## Usage Instructions
1. Open a command prompt and navigate to the directory containing the scripts:
   ```cmd
   cd path\to\Windows-BulkMolecularDocking
   ```

2. **Prepare ligand files:**
   To convert ligand files from SDF format to PDBQT format using OpenBabel, run the following script:
   ```cmd
   openbabel_convert.bat
   ```
   Ensure the `.sdf` files are in the same directory as the script. The script processes all SDF files and generates corresponding `.pdbqt` files.

3. **Run the docking process:**
   Use the `dock.bat` script to perform docking:
   ```cmd
   dock.bat
   ```

   The `dock.bat` script uses the following parameters:
   - **Vina executable path:** The script requires the path to `vina.exe`:
     ```cmd
     set VINA_PATH="C:\Program Files (x86)\The Scripps Research Institute\Vina\vina.exe"
     ```
   - **Receptor file:** Specify the receptor file in PDBQT format, which must be named `protein.pdbqt`.
   - **Grid box configuration:** Example docking box parameters:
     ```cmd
     set CENTER_X=0
     set CENTER_Y=18.68
     set CENTER_Z=-7.56
     set SIZE_X=140
     set SIZE_Y=70.42
     set SIZE_Z=66.27
     ```

4. **Summarize results:**
   Use the `log.bat` script to extract the best Vina scores from the log files and save them into a CSV file:
   ```cmd
   log.bat
   ```
   The `log.bat` script:
   - Extracts the docking mode 1 scores from all log files in the directory.
   - Saves the results to `output.csv`, which can be viewed in Excel or similar tools.

5. **Output files:**
   - Docking results for each ligand are saved in files named `<ligand_name>_output.pdbqt`.
   - Logs for each docking operation are saved in files named `<ligand_name>_log.txt`.
   - Summary scores are saved in `output.csv`.

## Notes
- Ensure that the input files are correctly formatted and compatible with the docking software being used.
- Customize the Vina configuration (e.g., grid box size, receptor file) in the `dock.bat` script as per your docking requirements.
- Check the log files and the summary CSV file for errors or issues during the docking process.

## Contributing
Contributions are welcome! If you have suggestions for improvement or encounter issues, please open an issue or submit a pull request.
