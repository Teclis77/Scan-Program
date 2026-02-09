#!../../bin/linux-x86_64/scan

#- SPDX-FileCopyrightText: 2003 Argonne National Laboratory
#-
#- SPDX-License-Identifier: EPICS

#- You may have to change scan to something else
#- everywhere it appears in this file

< envPaths

cd "${TOP}"

## Register all support components
dbLoadDatabase "dbd/scan.dbd"
scan_registerRecordDeviceDriver pdbbase

## Load record instances
dbLoadRecords("db/scan.db","user=xena,server=xlabsrv2")
dbLoadRecords("db/scan.db","user=rxr,server=xlabsrv2")
dbLoadRecords("db/scan.db","user=cts,server=xlabsrv2")
#dbLoadTemplate("db/scan.val","user=xlabsrv2")

cd "${TOP}/iocBoot/${IOC}"
iocInit

## Start any sequence programs
seq vitruvio_sncscan,"user=xena,server=xlabsrv2"
seq vitruvio_sncscan,"user=rxr,server=xlabsrv2"
seq vitruvio_sncscan,"user=cts,server=xlabsrv2"
#seq xena_sncscan,"user=xena,server=xlabsrv2"
#seq rxr_sncscan,"user=rxr,server=xlabsrv2"
#seq cts_sncscan,"user=cts,server=xlabsrv2"
