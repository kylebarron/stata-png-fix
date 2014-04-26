Fixes PNG problem with Stata on openSUSE 13.1
=============================================

[Stata](http://www.stata.com)  has a bug on newer version of openSUSE (13.1 confirmed), in that it doesn't like the libpng that comes with the system, and shows no icons. This fix (thanks to Stata tech support) solves the problem.

The problem
-----------
Here's the original description: http://www.statalist.org/forums/forum/general-stata-discussion/general/2199-linux-stata-bug-libpng-on-newer-opensuse-possibly-other-distributions

Installation
------------
Check out this git repository, and run 
 compile-stata-png-fix.sh

Thanks
------
Thanks to Peter Fuschich at the Stata Technical Department for providing the initial fix. All errors are mine.
