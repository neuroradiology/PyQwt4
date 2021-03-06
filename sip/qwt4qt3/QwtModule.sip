// The SIP interface definition for the Qwt module of PyQwt.
//
// Copyright (C) 2001-2007 Gerard Vermeulen
// Copyright (C) 2000 Mark Colclough
//
// This file is part of PyQwt.
//
// PyQwt is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2 of the License, or
// (at your option) any later version.
//
// PyQwt is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License along
// with PyQwt; if not, write to the Free Software Foundation, Inc.,
// 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
//
// In addition, as a special exception, Gerard Vermeulen gives permission
// to link PyQwt dynamically with non-free versions of Qt and PyQt,
// and to distribute PyQwt in this form, provided that equally powerful
// versions of Qt and PyQt have been released under the terms of the GNU
// General Public License.
//
// If PyQwt is dynamically linked with non-free versions of Qt and PyQt,
// PyQwt becomes a free plug-in for a non-free program.


%Module Qwt4.Qwt 0

%Import qt/qtmod.sip

%Feature CXX_DYNAMIC_CAST
%Feature HAS_NUMARRAY
%Feature HAS_NUMERIC
%Feature HAS_NUMPY
%Feature HAS_PYQT_031105
%Feature HAS_QWT5
%Feature HAS_QWT4

%ModuleHeaderCode
#if PY_VERSION_HEX < 0x02050000 && !defined(PY_SSIZE_T_MIN)
typedef int Py_ssize_t;
#define PY_SSIZE_T_MAX INT_MAX
#define PY_SSIZE_T_MIN INT_MIN
#endif

#include <qwt_math.h>
#include <qwt_numerical_interface.h>
#include <sipQwtQwtArrayDouble.h>
#include <sipQwtQwtArrayInt.h>
#include <sipQwtQwtArrayQwtDoublePoint.h>
%End

%PostInitialisationCode
#ifdef HAS_NUMARRAY
    qwt_import_numarray();
#endif
#ifdef HAS_NUMERIC
    qwt_import_numeric();
#endif
#ifdef HAS_NUMPY
    qwt_import_numpy();
#endif
%End

%Include QwtTypes.sip

// Handwritten
%Include QwtDictIterator.sip

// Converter code
%Include common/QwtMap.sip
%If (!HAS_PYQT_031105)
%Include common/QwtMemArray.sip
%End // (!HAS_PYQT_031105) 
%Include common/QwtValueStack.sip
%Include common/QwtValueList.sip

// Template code
%Include QwtArrayDouble.sip
%Include QwtArrayInt.sip
%Include QwtArrayLong.sip
%Include QwtArrayQwtDoublePoint.sip

%Include qwt.sip
%Include qwt_analog_clock.sip
%Include qwt_arrbtn.sip
%Include qwt_autoscl.sip
%Include qwt_compass_rose.sip
%Include qwt_compass.sip
%Include qwt_counter.sip
%Include qwt_curve.sip
%Include qwt_data.sip
%Include qwt_dial_needle.sip
%Include qwt_dial.sip
%Include qwt_dimap.sip
%Include qwt_double_rect.sip
%Include qwt_drange.sip
%Include qwt_dyngrid_layout.sip
%Include qwt_event_pattern.sip
%Include qwt_grid.sip
%Include qwt_knob.sip
%Include qwt_layout_metrics.sip
%Include qwt_legend.sip
%Include qwt_marker.sip
%Include qwt_paint_buffer.sip
%Include qwt_painter.sip
%Include qwt_picker.sip
%Include qwt_picker_machine.sip
%Include qwt_plot.sip
%Include qwt_plot_canvas.sip
%Include qwt_plot_classes.sip
// %Include qwt_plot_dict.sip replaced by QwtDict
%Include qwt_plot_item.sip
%Include qwt_plot_layout.sip
%Include qwt_plot_picker.sip
%Include qwt_plot_printfilter.sip
%Include qwt_plot_zoomer.sip
%Include qwt_push_button.sip
%Include qwt_rect.sip
%Include qwt_scale.sip
%Include qwt_scldiv.sip
%Include qwt_scldraw.sip
%Include qwt_sclif.sip
%Include qwt_sldbase.sip
%Include qwt_slider.sip
%Include qwt_spline.sip
%Include qwt_symbol.sip
%Include qwt_text.sip
%Include qwt_thermo.sip
%Include qwt_wheel.sip

// qwt_global.h
const int QWT_VERSION;
const char *QWT_VERSION_STR;

// qwt_math.h
// Those functions have no equivalent in Python
double qwtCeil125(double);
double qwtFloor125(double);
QPoint qwtPolar2Pos(const QPoint&, double, double);
QPoint qwtDegree2Pos(const QPoint&, double, double);

// Image support
QImage toQImage(SIP_PYOBJECT);
%MethodCode
    // Numeric is not thread-safe
    sipRes = 0;
    if (-1 == try_PyObject_to_QImage(a0, &sipRes))
        return 0;
%End


%If (HAS_NUMARRAY)
SIP_PYOBJECT toNumarray(const QImage&);
%End


%If (HAS_NUMERIC)
SIP_PYOBJECT toNumeric(const QImage&);
%End


%If (HAS_NUMPY)
SIP_PYOBJECT toNumpy(const QImage&);
%End

// Local Variables:
// mode: C++
// c-file-style: "stroustrup"
// End:
