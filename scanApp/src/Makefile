# SPDX-FileCopyrightText: 2003 Argonne National Laboratory
#
# SPDX-License-Identifier: EPICS

TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = scan
# scan.dbd will be created and installed
DBD += scan.dbd

# scan.dbd will be made up from these files:
scan_DBD += base.dbd

# Include dbd files from all support applications:
#scan_DBD += xxx.dbd
scan_DBD += stream-base.dbd
scan_DBD += drvAsynIPPort.dbd
scan_DBD += asyn.dbd
scan_DBD += calc.dbd

# Add all the support libraries needed by this IOC
#scan_LIBS += xxx
scan_LIBS += stream
scan_LIBS += asyn
scan_LIBS += calc

# scan_registerRecordDeviceDriver.cpp derives from scan.dbd
scan_SRCS += scan_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
scan_SRCS_DEFAULT += scanMain.cpp
scan_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#scan_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# To build SNL programs, SNCSEQ must be defined
# in the <top>/configure/RELEASE file
ifneq ($(SNCSEQ),)
    # Build sncExample into myexampleSupport
    scan_SNCFLAGS += +r
    scan_DBD += sncscan.dbd
    # A .stt sequence program is *not* pre-processed:
    scan_SRCS += sncscan.stt
    scan_LIBS += seq pv
endif


# Link QSRV (pvAccess Server) if available
ifdef EPICS_QSRV_MAJOR_VERSION
    scan_LIBS += qsrv
    scan_LIBS += $(EPICS_BASE_PVA_CORE_LIBS)
    scan_DBD += PVAServerRegister.dbd
    scan_DBD += qsrv.dbd
endif

# Finally link to the EPICS Base libraries
scan_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

