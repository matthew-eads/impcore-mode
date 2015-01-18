# impcore-mode

Basic highlighting for the impcore language of COMP 105.
Currently supports built-in keywords (define, if, etc.)
Finding a way to highlight custom function names (declared by
the "define" keyword) would be nice.

To install, cd into your .emacs.d directory, which should be located at "~/.emacs.d/",
clone this repository, and add the following lines to your emacs config file, which
should be "~/.emacs":

(add-to-list 'load-path "~/.emacs.d/impcore-mode")
(require 'impcore-mode)
