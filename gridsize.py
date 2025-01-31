import numpy as np

def parse_pdb(file_path):
    """Parse a PDB file and extract atom coordinates."""
    coordinates = []
    with open(file_path, 'r') as pdb_file:
        for line in pdb_file:
            if line.startswith("ATOM"):
                x = float(line[30:38].strip())
                y = float(line[38:46].strip())
                z = float(line[46:54].strip())
                coordinates.append((x, y, z))
    return np.array(coordinates)

def calculate_box_center_and_size(coordinates):
    """Calculate the center and size of the box for AutoDock Vina."""
    min_coords = np.min(coordinates, axis=0)
    max_coords = np.max(coordinates, axis=0)
    box_size = max_coords - min_coords
    box_center = (max_coords + min_coords) / 2
    return box_center, box_size

def main(pdb_file):
    # Parse the PDB file
    coordinates = parse_pdb(pdb_file)
    
    # Calculate the box center and size
    box_center, box_size = calculate_box_center_and_size(coordinates)
    
    print(f"Box center (x, y, z): {box_center}")
    print(f"Box size (x, y, z): {box_size}")

if __name__ == "__main__":
    pdb_file = r"path\to\input.pdb" # Replace with your PDB file path
    main(pdb_file)