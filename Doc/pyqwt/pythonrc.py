# Set your PYTHONSTARTUP environment variable to $HOME/.pythonrc.py
#
# inspired by:
# http://opag.ca/wiki/OpagCode/OpagSnippets

from atexit import register
from os import path
import readline
import rlcompleter

# Sets up a tab for completion (use a single space to indent Python code).
readline.parse_and_bind('tab: complete')

historyPath = path.expanduser('~/.python_history')
readline.set_history_length(1000)

# Reads the history of the previous session, if it exists.
if path.exists(historyPath):
    readline.read_history_file(historyPath)

# Sets up history saving on exit.
def save_history(historyPath=historyPath, readline=readline):
    readline.write_history_file(historyPath)

register(save_history)

# Cleans up the global name
del register, path, readline, rlcompleter, historyPath, save_history

# Tries to import NumPy  and SciPy
try:
    import numpy as np
    import scipy as sp
    sp.pkgload()
except ImportError:
    pass

# Tries to import qt, Qwt4.iqt, Qwt4.Qwt and Qwt4.qplt
try:
    import qt
    import Qwt4.iqt
    import Qwt4.Qwt as qwt
    import Qwt4.qplt as qplt
except ImportError:
    pass

# Local Variables: ***
# mode: python ***
# End: ***
