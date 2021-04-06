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
	* The `last_record` number
	* A list of `records` messages

## Example
```
$ mkdir auto_readme_test
$ cd auto_readme_test
$ mivs -i
Initializing mivs
$ echo 'Hello world!'
$ mivs -r 'Created README'
Recording current state
$ mkdir src
$ echo 'print('\''wow!'\'')'
$ echo 'sq = lambda x : x**2'
$ mivs -r 'Added other code'
Recording current state
$ echo -e 'I added another sentence.\nOr two!'
$ mivs -r 'Updated README'
Recording current state
$ mivs -l
Initializing mivs
main
(0) 2021-04-06 00:23:21.710162: Created README
(1) 2021-04-06 00:23:21.763468: Added other code
(2) 2021-04-06 00:23:21.816855: Updated README
$ mivs -s README
Searching mivs
$ ls
README.md  src
$ mivs -j 0
Jumping to record 0
$ ls
$ mivs -j 1
Jumping to record 1
$ ls
README.md
$ mivs -j 2
Jumping to record 2
$ ls
README.md  src
$ cd ..
```

## Requirements
* `Python3`
* Python `pyyaml` module
* GNU/BSD `diff` and `patch`

## FAQ
> Why?

mivs is a personal project over the course of a few days. 
I don't necessarily think anyone should use this implementation of mivs. 
But it was fun to make nonetheless. 

> Wouldn't mivs be **more** minimal *this way* or *that way*?

Probably. I think mivs is cool because it does the least amount of work to 
actually even consider itself versioning software.

> Isn't it ironic that this project is hosted on git?

Probably.
