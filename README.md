# mivs
mivs is **mi**nimal **v**ersioning **s**oftware. 

This software was written both as a way to 

## TODO
* Download glob, difflib, whatever else pulled up on phone

## Language and Definitions
* `mivs` - the versioning software
* `repo` - an instance of mivs versioning
* `timeline` - alternate, converging, and diverging histories of the repo

## Commands
### Basic
`mivs init` or simply `mivs` will initialize a mivs repository.

`mivs record <comment>` will record the changes of the working repo as-is. 

`mivs destroy` will remove the current mivs repository. 
`mivs destroy all` will remove the current files and directory of the repository too.

`mivs timeline <timeline_name>` moves the repo into the timeline
`<timeline_name>`. `mivs timetravel <record_number>` will 

`mivs merge <timeline_name1> <timeline_name2>` merges the two timelines in a simple way, 
favoring the first timeline. If an error occurs, the user can fix the diffs in the code
and finish by typing `mivs merge`.

### Extra
`mivs search <timelines, record numbers, words, or tags>` will return version numbers and messages
relative to the generic information provided.

`mivs list` or `mivs records` will echo a list of mivs records in chronological order.

## How it works
Every mivs repo has a `.mivs` folder. Inside you'll find a structure like:
```
.mivs
|- mivs.yaml
|- records
 |- 0
  |- record.yaml
  |- ...
 |- 1
 |- ...
 |- latest
  |- record.yaml
  |- ...
```
* `ignore.txt`
  * Holds a list of file/directory names to ignore from mivs
  * Delimited by newlines
* `mivs.yaml`
  * A yaml file defining the following information
    * `name` of the mivs repo
	* a list of `timelines` 
	* a list of `ignores`
* `server.yaml`
  * TODO
* `timelines`
  * A directory of directories of different timelines

## Development
* `pip install virtualenv`
* Create venv `python3 -m venv mivs-env`
* `source mivs-env/bin/activate`
* `pip install -r requirements.txt`
* `deactivate`
