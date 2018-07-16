# Fix for missing Stata icons on Linux

[Stata](http://www.stata.com) has a bug on newer versions of several Linux distributions, among them Ubuntu 18.04 and openSUSE [^1], in that it doesn't like the `libpng` that comes with the system, and shows no icons. This fix solves the problem.

[^1]: <https://bitbucket.org/vilhuberl/stata-png-fix>

## The problem

Here's the [original description](http://www.statalist.org/forums/forum/general-stata-discussion/general/2199-linux-stata-bug-libpng-on-newer-opensuse-possibly-other-distributions) on StataList.

## Installation

This git repository was forked from Lars Vilhuber's [Bitbucket repository](https://bitbucket.org/vilhuberl/stata-png-fix). The main difference is that I don't like to run programs with `sudo` when I don't have to, so this script doesn't require `sudo`.

To install this:

1. Install dependencies (gcc, wget)

    ```
    sudo apt install build-essential wget
    ```

2. Clone this repository:

    ```bash
    git clone https://github.com/kylebarron/stata-png-fix.git
    cd stata-png-fix
    ```

3. Change the value of `STATA_DIR` in the `stata-png-fixed.sh` file to the directory with your Stata installation. For me this is `~/local/stata`. (Don't include a trailing `/`). This folder should contain the `xstata`, `xstata-se`, or `xstata-mp` binary.

4. Run

    ```bash
    bash compile-stata-png-fix.sh
    ```

5. Add `~/local/bin/` to your `PATH`.

## Acknowledgments

[Lars Vilhuber](https://bitbucket.org/vilhuberl/) for creating most of the original script.
