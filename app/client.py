import requests
import hashlib
import os

# Server URL to fetch the file
server_url = "http://18.156.5.166/generate_file"

# Path to save the downloaded file
file_path = "/clientdata/received_file.txt"  # Full path used here


def download_file():
    try:
        # Ensure the directory exists
        os.makedirs(os.path.dirname(file_path), exist_ok=True)

        # Send GET request to the server
        response = requests.get(server_url)

        # Ensure the request was successful
        response.raise_for_status()

        # Save the file to the specified path
        with open(file_path, "wb") as file:
            file.write(response.content)

        print(f"File saved successfully at: {file_path}")
        print("Received Checksum:", response.headers.get("checksum"))

        # Verify the checksum
        verify_checksum(file_path, response.headers.get("checksum"))

    except requests.exceptions.RequestException as e:
        print(f"Error downloading file: {e}")


def verify_checksum(file_path, received_checksum):
    try:
        # Read the file content
        with open(file_path, "rb") as file:
            file_content = file.read()

        # Calculate the SHA-256 checksum of the file content
        calculated_checksum = hashlib.sha256(file_content).hexdigest()

        # Compare the received checksum with the calculated checksum
        print(f"Calculated Checksum: {calculated_checksum}")

        if received_checksum == calculated_checksum:
            print("Checksum verification passed. File integrity is verified.")
        else:
            print("Checksum verification failed. File integrity cannot be guaranteed.")

    except Exception as e:
        print(f"Error verifying checksum: {e}")


# Start the download and checksum verification process
download_file()
