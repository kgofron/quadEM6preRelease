#!/epics/support2/quadEM/bin/linux-x86_64/quadEMTestApp

errlogInit(5000)
epicsEnvSet("QUADEM","/epics/support2/quadEM")
epicsEnvSet("QUAD_DET",        "NSLS_EM.cmd")
epicsEnvSet("IOC","iocTest")
< $(QUADEM)/iocBoot/$(IOC)/envPaths
< unique.cmd

# Tell EPICS all about the record types, device-support modules, drivers,
# etc. in this build
dbLoadDatabase("$(QUADEM)/dbd/quadEMTestApp.dbd")
quadEMTestApp_registerRecordDeviceDriver(pdbbase)

# The search path for database files
epicsEnvSet("EPICS_DB_INCLUDE_PATH", "$(ADCORE)/db:$(QUADEM)/db")

#< AH401B.cmd
#< AH501.cmd
#< TetrAMM.cmd
#< NSLS_EM.cmd
< $(QUADEM)/iocBoot/$(IOC)/$(QUAD_DET)
