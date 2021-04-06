# mivs
mivs is **mi**nimal **v**ersioning **s**oftware.

mivs is good for simple single-person/small-team projects.

## Commands
`mivs -i` will initialize a mivs repository.

`mivs -r "<comment>"` will record the changes of the working repo as-is. 

`mivs -j <record_number>` will alter the mivs repository and revert files to the specific record.
`current` or `latest` will jump back to the present.

`mivs -s "<info>"` will search the mivs repo and print the corresponding records.

`mivs -m <repo1> <repo2> <new_repo>` merges the two mivs repos in a simple way, 
favoring the first timeline.

`mivs -l` will print a list of mivs records in chronological order.

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
	* A list of records messages

## Requirements
* `Python3`
* Python `pyyaml` module
* GNU/BSD `diff` and `patch`
