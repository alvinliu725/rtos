##
## Auto Generated makefile by CodeLite IDE
## any manual changes will be erased      
##
## Debug
ProjectName            :=a3
ConfigurationName      :=Debug
WorkspacePath          := "/Users/shigz-qust/Desktop/RTOS/a3-RTOS"
ProjectPath            := "/Users/shigz-qust/Desktop/RTOS/a3-RTOS/a3"
IntermediateDirectory  :=./Debug
OutDir                 := $(IntermediateDirectory)
CurrentFileName        :=
CurrentFilePath        :=
CurrentFileFullPath    :=
User                   :=Yu XI
Date                   :=2015-02-14
CodeLitePath           :="/Users/shigz-qust/Library/Application Support/codelite"
LinkerName             :=/usr/bin/g++ 
SharedObjectLinkerName :=/usr/bin/g++ -dynamiclib -fPIC
ObjectSuffix           :=.o
DependSuffix           :=.o.d
PreprocessSuffix       :=.i
DebugSwitch            :=-g 
IncludeSwitch          :=-I
LibrarySwitch          :=-l
OutputSwitch           :=-o 
LibraryPathSwitch      :=-L
PreprocessorSwitch     :=-D
SourceSwitch           :=-c 
OutputFile             :=$(IntermediateDirectory)/$(ProjectName)
Preprocessors          :=
ObjectSwitch           :=-o 
ArchiveOutputSwitch    := 
PreprocessOnlySwitch   :=-E
ObjectsFileList        :="a3.txt"
PCHCompileFlags        :=
MakeDirCommand         :=mkdir -p
LinkOptions            :=  $(shell pkg-config --libs gtk+-3.0)
IncludePath            :=  $(IncludeSwitch). $(IncludeSwitch). 
IncludePCH             := 
RcIncludePath          := 
Libs                   := 
ArLibs                 :=  
LibPath                := $(LibraryPathSwitch). 

##
## Common variables
## AR, CXX, CC, AS, CXXFLAGS and CFLAGS can be overriden using an environment variables
##
AR       := /usr/bin/ar rcu
CXX      := /usr/bin/g++ 
CC       := /usr/bin/gcc 
CXXFLAGS :=  -g -O0 -Wall $(Preprocessors)
CFLAGS   :=  -g -Wall -O0 $(shell pkg-config --cflags gtk+-3.0) $(Preprocessors)
ASFLAGS  := 
AS       := /usr/bin/as 


##
## User defined environment variables
##
CodeLiteDir:=/Users/shigz-qust/Downloads/codelite.app/Contents/SharedSupport/
Objects0=$(IntermediateDirectory)/main.c$(ObjectSuffix) $(IntermediateDirectory)/context.S$(ObjectSuffix) $(IntermediateDirectory)/jobs.c$(ObjectSuffix) $(IntermediateDirectory)/saved_registers.c$(ObjectSuffix) $(IntermediateDirectory)/scheduler.c$(ObjectSuffix) $(IntermediateDirectory)/serial.cpp$(ObjectSuffix) $(IntermediateDirectory)/timers.S$(ObjectSuffix) 



Objects=$(Objects0) 

##
## Main Build Targets 
##
.PHONY: all clean PreBuild PrePreBuild PostBuild
all: $(OutputFile)

$(OutputFile): $(IntermediateDirectory)/.d $(Objects) 
	@$(MakeDirCommand) $(@D)
	@echo "" > $(IntermediateDirectory)/.d
	@echo $(Objects0)  > $(ObjectsFileList)
	$(LinkerName) $(OutputSwitch)$(OutputFile) @$(ObjectsFileList) $(LibPath) $(Libs) $(LinkOptions)

$(IntermediateDirectory)/.d:
	@test -d ./Debug || $(MakeDirCommand) ./Debug

PreBuild:


##
## Objects
##
$(IntermediateDirectory)/main.c$(ObjectSuffix): main.c $(IntermediateDirectory)/main.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/shigz-qust/Desktop/RTOS/a3-RTOS/a3/main.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/main.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/main.c$(DependSuffix): main.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/main.c$(ObjectSuffix) -MF$(IntermediateDirectory)/main.c$(DependSuffix) -MM "main.c"

$(IntermediateDirectory)/main.c$(PreprocessSuffix): main.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/main.c$(PreprocessSuffix) "main.c"

$(IntermediateDirectory)/context.S$(ObjectSuffix): context.S $(IntermediateDirectory)/context.S$(DependSuffix)
	$(AS) "/Users/shigz-qust/Desktop/RTOS/a3-RTOS/a3/context.S" $(ASFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/context.S$(ObjectSuffix) -I$(IncludePath)
$(IntermediateDirectory)/context.S$(DependSuffix): context.S
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/context.S$(ObjectSuffix) -MF$(IntermediateDirectory)/context.S$(DependSuffix) -MM "context.S"

$(IntermediateDirectory)/context.S$(PreprocessSuffix): context.S
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/context.S$(PreprocessSuffix) "context.S"

$(IntermediateDirectory)/jobs.c$(ObjectSuffix): jobs.c $(IntermediateDirectory)/jobs.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/shigz-qust/Desktop/RTOS/a3-RTOS/a3/jobs.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/jobs.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/jobs.c$(DependSuffix): jobs.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/jobs.c$(ObjectSuffix) -MF$(IntermediateDirectory)/jobs.c$(DependSuffix) -MM "jobs.c"

$(IntermediateDirectory)/jobs.c$(PreprocessSuffix): jobs.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/jobs.c$(PreprocessSuffix) "jobs.c"

$(IntermediateDirectory)/saved_registers.c$(ObjectSuffix): saved_registers.c $(IntermediateDirectory)/saved_registers.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/shigz-qust/Desktop/RTOS/a3-RTOS/a3/saved_registers.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/saved_registers.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/saved_registers.c$(DependSuffix): saved_registers.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/saved_registers.c$(ObjectSuffix) -MF$(IntermediateDirectory)/saved_registers.c$(DependSuffix) -MM "saved_registers.c"

$(IntermediateDirectory)/saved_registers.c$(PreprocessSuffix): saved_registers.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/saved_registers.c$(PreprocessSuffix) "saved_registers.c"

$(IntermediateDirectory)/scheduler.c$(ObjectSuffix): scheduler.c $(IntermediateDirectory)/scheduler.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/shigz-qust/Desktop/RTOS/a3-RTOS/a3/scheduler.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/scheduler.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/scheduler.c$(DependSuffix): scheduler.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/scheduler.c$(ObjectSuffix) -MF$(IntermediateDirectory)/scheduler.c$(DependSuffix) -MM "scheduler.c"

$(IntermediateDirectory)/scheduler.c$(PreprocessSuffix): scheduler.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/scheduler.c$(PreprocessSuffix) "scheduler.c"

$(IntermediateDirectory)/serial.cpp$(ObjectSuffix): serial.cpp $(IntermediateDirectory)/serial.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/Users/shigz-qust/Desktop/RTOS/a3-RTOS/a3/serial.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/serial.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/serial.cpp$(DependSuffix): serial.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/serial.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/serial.cpp$(DependSuffix) -MM "serial.cpp"

$(IntermediateDirectory)/serial.cpp$(PreprocessSuffix): serial.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/serial.cpp$(PreprocessSuffix) "serial.cpp"

$(IntermediateDirectory)/timers.S$(ObjectSuffix): timers.S $(IntermediateDirectory)/timers.S$(DependSuffix)
	$(AS) "/Users/shigz-qust/Desktop/RTOS/a3-RTOS/a3/timers.S" $(ASFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/timers.S$(ObjectSuffix) -I$(IncludePath)
$(IntermediateDirectory)/timers.S$(DependSuffix): timers.S
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/timers.S$(ObjectSuffix) -MF$(IntermediateDirectory)/timers.S$(DependSuffix) -MM "timers.S"

$(IntermediateDirectory)/timers.S$(PreprocessSuffix): timers.S
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/timers.S$(PreprocessSuffix) "timers.S"


-include $(IntermediateDirectory)/*$(DependSuffix)
##
## Clean
##
clean:
	$(RM) -r ./Debug/


