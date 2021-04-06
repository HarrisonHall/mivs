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
readme_test.sh: line 8: mivs: command not found
$ echo 'Hello world!'
$ mivs -r 'Created README'
readme_test.sh: line 11: mivs: command not found
$ mkdir src
$ echo 'print('\''wow!'\'')'
$ echo 'sq = lambda x : x**2'
$ mivs -r 'Added other code'
readme_test.sh: line 16: mivs: command not found
$ echo -e 'I added another sentence.\nOr two!'
$ mivs -r 'Updated README'
readme_test.sh: line 19: mivs: command not found
$ mivs -l
readme_test.sh: line 21: mivs: command not found
$ mivs -s README
readme_test.sh: line 23: mivs: command not found
$ ls
README.md  src
$ mivs -j 0
readme_test.sh: line 26: mivs: command not found
$ ls
README.md  src
$ mivs -j 1
readme_test.sh: line 29: mivs: command not found
$ ls
README.md  src
$ mivs -j 2
readme_test.sh: line 32: mivs: command not found
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
