# XWiki/Cassandra on CompatableOne proof of concept

[![XWiki labs logo](https://raw.githubusercontent.com/xwiki-labs/xwiki-labs-logo/master/projects/xwikilabs/xwikilabsprototype.png "XWiki labs")](https://labs.xwiki.com/xwiki/bin/view/Projects/XWikiLabsPrototype)

To build this, start by cloning the CompatableOne ACCORDS platform.

    git clone git://gitorious.ow2.org/ow2-compatibleone/accords-platform.git

For testing, edit the following files to disable SSL:

    accords-platform/scripts/accords.in
    accords-platform/scripts/accords-config.in

In each file, comment out `tls=security` and uncomment the line which says `tls=`
Then compile it. ACCORDS is still in heavy development so you will need to disable GCC optimizations.

    export CFLAGS="-g -ggdb -O0"
    ./autogen.sh
    ./configure
    make
    make install

Then navigate out of it's directory and clone this source.

    git clone git://github.com/cjdelisle/compatibleone-poc.git

Navigate into the v3 subdirectory and type ./do
