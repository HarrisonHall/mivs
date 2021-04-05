
import yaml
import os
import shutil

def init(repo_name="", timeline_name="main"):
    # TODO assert .mivs does not exist
    
    # Make mivs
    print("Making mivs directory")
    os.mkdir(".mivs")

    print("Writing mivs.yaml")
    mivs_information = {
        "name": repo_name,
        "timelines": {
            timeline_name: {
                "last_record": 0
            }
        }
    }
    with open(".mivs/mivs.yaml", "w") as mivs_file:
        yaml.dump(mivs_information, mivs_file)

    # Copy files to the right directory
    os.mkdir(f".mivs/timelines")
    os.mkdir(f".mivs/timelines/{timeline_name}")
    os.mkdir(f".mivs/timelines/{timeline_name}/0")
    
    print("TODO copy")

def copy_files(timeline_name, record_number, rec_dirname):
    for path in glob.glob(rec_dirname):
        full_path = os.path.join(rec_dirname, path)
        final_path = os.path.join(".mivs/timelines/", timeline_name, str(record_number), full_path)
        if os.path.isfile(full_path):
            shutil.copyfile(full_path, final_path, follow_simlinks=False)
        elif os.path.isdir(full_path):
            os.mkdir(final_path)
            copy_files(timeline_name, rec_dirname, full_path)

if __name__ == "__main__":
    print("Testing `mivs init`")
    print("Removing .mivs dir")
    shutil.rmtree(".mivs")
    print("Calling `mivs init`")
    init(repo_name="Test")
