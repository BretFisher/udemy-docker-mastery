#!/usr/bin/env python3

# this creates urlencode-friendly files without EOL
import urllib

outfile = open("postb", "w")
params = {"vote": "b"}
encoded = urllib.parse.urlencode(params)
outfile.write(encoded)
outfile.close()
outfile = open("posta", "w")
params = {"vote": "a"}
encoded = urllib.parse.urlencode(params)
outfile.write(encoded)
outfile.close()
