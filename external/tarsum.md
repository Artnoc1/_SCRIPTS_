```
#!/usr/bin/env python
 
# Copyright (C) 2008-2009 by Guy Rutenberg
# Modified 2011 by Mike McCabe.  Original from
# http://www.guyrutenberg.com/2009/04/29/tarsum-02-a-read-only-version-of-tarsum/
 
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the
# Free Software Foundation, Inc.,
# 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
 
import hashlib
import tarfile
import re

def tarsum(input_file, hash, output_file):
        """
        input_file  - A FILE object to read the tar file from.
        hash - The name of the hash to use. Must be supported by hashlib.
        output_file - A FILE to write the computed signatures to.
        """
        tar = tarfile.open(mode="r|*", fileobj=input_file)
 
        chunk_size = 512*1024

        for member in tar:
            if not member.isfile():
                continue
            m = re.search('\._[^/]+$',member.name)
            if m is not None:
                continue
            f = tar.extractfile(member)
            h = hashlib.new(hash)
            data = f.read(chunk_size)
            while data:
                h.update(data)
                data = f.read(chunk_size)
            output_file.write("%s  %s\n" % (h.hexdigest(), member.name))
            output_file.flush()
        output_file.write("%s  %s\n" % (input_file.hexdigest(), "TOTAL"))
                
class hashing_file(object):
    """
    Wrap a file object, hashing all data as it's read.  If pipe is
    supplied, also write all data to stdout.
    """
    def __init__(self, fileobj, hash, pipe=False):
        self.fileobj = fileobj
        self.h = hashlib.new(hash)
        self.pipe = pipe

    def read(self, size):
        data = self.fileobj.read(size)
        self.h.update(data)
        if self.pipe:
            sys.stdout.write(data)
        return data

    def __getattr__(self, name):
        return getattr(self.fileobj, name)

    def hexdigest(self):
        return self.h.hexdigest()


def main():
    parser = OptionParser()
 
    version=("%prog 0.2.2\n"
             "Copyright (C) 2008-2009 Guy Rutenberg <http://www.guyrutenberg.com/contact-me>"
             "Modified 2011 Mike McCabe")
    usage=("%prog [options] TARFILE\n"
           "Print a checksum signature for every file in TARFILE.\n"
           "With no FILE, or when FILE is -, read standard input.")
    parser = OptionParser(usage=usage, version=version)
    parser.add_option("-c", "--checksum", dest="checksum", type="string",
        help="use HASH as for caclculating the checksums. [default: %default]", metavar="HASH",
        default="md5")
    parser.add_option("-o", "--output", dest="output", type="string",
        help="save signatures to FILE.", metavar="FILE")
    parser.add_option("-p", "--pipe", action="store_true",
                      help="copy input to output, for use in pipe.")

    (option, args) = parser.parse_args()

    if option.pipe and not option.output:
        parser.error("--pipe option requires that --output also be specified")
    parser.destroy()
 
    output_file = sys.stdout
    if option.output:
        output_file = open(option.output, "w")
 
    input_file = sys.stdin
    if len(args)==1 and args[0]!="-":
        input_file = open(args[0], "r")
 
    input_file = hashing_file(input_file, option.checksum, option.pipe)

    tarsum(input_file, option.checksum, output_file)


if __name__ == "__main__":
    from optparse import OptionParser
    import sys
    main()
 
# vim: ai ts=4 sts=4 et sw=4
```
