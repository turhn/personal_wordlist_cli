[![Build Status](https://secure.travis-ci.org/turhn/personal_wordlist_cli.png)](http://travis-ci.org/turhn/personal_wordlist_cli)
[![Gem Version](https://badge.fury.io/rb/personal_wordlist_cli.svg)](https://badge.fury.io/rb/personal_wordlist_cli)

# personal_wordlist_cli

**personal_wordlist_cli** is a CLI application based on the [personal_wordlist](https://github.com/turhn/personal_wordlist) library. It creates dictionaries from patterns based on a social engineering personal data. 

When you install the gem it will add a ```pwlcli``` command to your path.

## Installation
Installation using Ruby Gems.

```gem install personal_wordlist_cli```

Installation using source code.

```bash
git clone https://github.com/turhn/personal_wordlist_cli.git && cd personal_wordlist_cli
bundle install
rake install:local
```


## Usage

Output to stdout.

```pwlcli generate Patternfile --datafile sample_data.json```

```pwlcli generate Patternfile -d sample_data.json > pwl_wordlist.txt```

Output to a specified filename.

```pwlcli generate Patternfile -d sample_data.json -o pwl_wordlist.txt```

### File Types
- Patternfile is a Ruby compatible DSL file. Check the [example](https://github.com/turhn/personal_wordlist#sequences) here.
- Datafile must be a valid json file. All json key names will be available as methods in the Patternfile.


## Example

You can use generated wordlists to brute force your WordPress for a forgotten password. [WPScan](https://github.com/wpscanteam/wpscan) is a good start.

```ruby wpscan.rb --url www.example.com --wordlist pwl_wordlist.txt --username admin```

You might create dictionaries to unlock zip files:

A simple [zip-crack](https://github.com/igniteflow/violent-python/blob/master/pwd-crackers/zip-crack.py)

Just change 'dictionay.txt' with the files created with the command above.


## Legal Notice

This tool is created for security intentions not for brute-force attacks. Testing weak passwords or recovering forgotten passwords. I cannot be responsible of any misusage of the tool.

## Licence

MIT

## Contributions

Any contributions are welcome.
