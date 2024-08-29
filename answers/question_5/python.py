from pathlib import Path

# Print owner of mp4 files in format: name : owner
# Ref https://docs.python.org/3/library/pathlib.html
if __name__ == "__main__":
    dir = "."
    for file in Path(dir).glob("*.mp4"):
        print(f"{file.name} : {file.owner()}")
