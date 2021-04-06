# mivs
mivs is **mi**nimal **v**ersioning **s**oftware. 

mivs is good for simple single-person/small-team projects.

## TODO
* Download glob, difflib, whatever else pulled up on phone

## Language and Definitions
* `mivs` - the versioning software
* `repo` - an instance of mivs versioning
* `timeline` - alternate, converging, and diverging histories of the repo

## Commands
`mivs -i` will initialize a mivs repository.

`mivs -r "<comment>"` will record the changes of the working repo as-is. 

`mivs -j <record_number>` will alter the mivs repository and revert files to the specific record.
`current` will jump back to the present.

`mivs -s "<info>"` will search the mivs repo and print the corresponding records.

`mivs -m <timeline_name1> <timeline_name2>` merges the two mivs repos in a simple way, 
favoring the first timeline.

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
* `mivs.yaml`
  * A yaml file defining the following information
    * `name` of the mivs repo
	* a list of `ignores`
	* The last `record_number`

## Requirements
* `Python3`
* Python `pyyaml` module
* GNU/BSD `diff`
