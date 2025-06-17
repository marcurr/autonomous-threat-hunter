# src/decompress_logs.py

import gzip
import shutil
import os

def decompress_logs(data_dir="./data"):
    for filename in os.listdir(data_dir):
        if filename.endswith(".log.gz"):
            log_path = os.path.join(data_dir, filename)
            output_path = log_path[:-3] # Remove '.gz'

        # Skip if decompressed file already exists
        if os.path.exists(output_path):
            print(f"Skipping (already decompressed): {output_path}")
            continue

        with gzip.open(log_path, 'rb') as f_in:
            with open(output_path, 'wb') as f_out:
                shutil.copyfileobj(f_in, f_out)
        print(f"Decompressed: {filename} → {os.path.basename(output_path)}")

if __name__ == "__main__":
    decompress_logs()