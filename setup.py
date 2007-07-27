#!/usr/bin/env python

from distutils.core import setup
import time

name = 'PyQwt'
version = '4.2.4'
#version = '%04d%02d%02d' % (time.localtime()[:3])

long_description = """
PyQwt is a set of Python bindings for the Qwt C++ class library.
The Qwt library extends the Qt framework with widgets for
Scientific and Engineering applications.   It provides a widget
to plot data points in two dimensions and various widgets to
display and control bounded or unbounded floating point values.
"""

setup(
    name             = name,
    version          = version,
    description      = "Python bindings for the Qwt library",
    url              = "http://pyqwt.sourceforge.net",
    author           = "Gerard Vermeulen",
    author_email     = "gerard.vermeulen@grenoble.cnrs.fr",
    license          = "GPL",
    long_description = long_description,
    platforms        = "Unix, Windows (MSVC), MacOS/X",
    )

# Local Variables: ***
# mode: python ***
# End: ***
