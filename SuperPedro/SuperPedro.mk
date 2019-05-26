##
## Auto Generated makefile by CodeLite IDE
## any manual changes will be erased      
##
## Debug
ProjectName            :=SuperPedro
ConfigurationName      :=Debug
WorkspacePath          :=Z:/MOP/c-code/mop
ProjectPath            :=Z:/MOP/c-code/mop/SuperPedro
IntermediateDirectory  :=./Debug
OutDir                 := $(IntermediateDirectory)
CurrentFileName        :=
CurrentFilePath        :=
CurrentFileFullPath    :=
User                   :=Eric
Date                   :=26/05/2019
CodeLitePath           :=C:/cseapp/CodeLite
LinkerName             :=$(CodeLiteDir)/tools/gcc-arm/bin/arm-none-eabi-g++.exe
SharedObjectLinkerName :=$(CodeLiteDir)/tools/gcc-arm/arm-none-eabi-g++.exe -shared -fPIC
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
OutputFile             :=$(IntermediateDirectory)/$(ProjectName).elf
Preprocessors          :=
ObjectSwitch           :=-o 
ArchiveOutputSwitch    := 
PreprocessOnlySwitch   :=-E
ObjectsFileList        :="SuperPedro.txt"
PCHCompileFlags        :=
MakeDirCommand         :=makedir
RcCmpOptions           := 
RcCompilerName         :=
LinkOptions            :=  -T$(ProjectPath)/md407-ram.x -L$(ARM_V6LIB) -L$(ARM_GCC_V6LIB) -nostartfiles
IncludePath            :=  $(IncludeSwitch). $(IncludeSwitch). 
IncludePCH             := 
RcIncludePath          := 
Libs                   := $(LibrarySwitch)gcc $(LibrarySwitch)c_nano 
ArLibs                 :=  "gcc" "c_nano" 
LibPath                :=$(LibraryPathSwitch)"./Debug/graphicdisplay.c.o ./Debug/startup.c.o ./Debug/asciidisplay.c.o ./Debug/keypad.c.o ./Debug/sprites.c.o ./Debug/delay.c.o"  $(LibraryPathSwitch). 

##
## Common variables
## AR, CXX, CC, AS, CXXFLAGS and CFLAGS can be overriden using an environment variables
##
AR       := $(CodeLiteDir)/tools/gcc-arm/bin/arm-none-eabi-ar.exe rcu
CXX      := $(CodeLiteDir)/tools/gcc-arm/bin/arm-none-eabi-g++.exe
CC       := $(CodeLiteDir)/tools/gcc-arm/bin/arm-none-eabi-gcc.exe
CXXFLAGS :=  -g -O0 -W $(Preprocessors)
CFLAGS   :=  -Wa,-adhln=test.s -g -O0 -w -mthumb -march=armv6-m  -mfloat-abi=soft -std=c99 -mthumb -march=armv6-m $(Preprocessors)
ASFLAGS  := 
AS       := $(CodeLiteDir)/tools/gcc-arm/bin/arm-none-eabi-as.exe


##
## User defined environment variables
##
CodeLiteDir:=C:\cseapp\CodeLite
ARM_V6LIB:=$(CodeLiteDir)/tools/gcc-arm/arm-none-eabi/lib/thumb/v6-m
ARM_GCC_V6LIB:=$(CodeLiteDir)/tools/gcc-arm/lib/gcc/arm-none-eabi/7.2.1/thumb/v6-m
ARM_M4FPLIB:=$(CodeLiteDir)/tools/gcc-arm/arm-none-eabi/lib/thumb/v7e-m/fpv4-sp/hard
ARM_GCC_M4FPLIB:=$(CodeLiteDir)/tools/gcc-arm/lib/gcc/arm-none-eabi/7.2.1/thumb/v7e-m
Objects0=$(IntermediateDirectory)/delays.c$(ObjectSuffix) $(IntermediateDirectory)/keyFuncs.c$(ObjectSuffix) $(IntermediateDirectory)/Pedro.c$(ObjectSuffix) $(IntermediateDirectory)/main.c$(ObjectSuffix) $(IntermediateDirectory)/LcdAscii.c$(ObjectSuffix) 



Objects=$(Objects0) 

##
## Main Build Targets 
##
.PHONY: all clean PreBuild PrePreBuild PostBuild MakeIntermediateDirs
all: $(OutputFile)

$(OutputFile): $(IntermediateDirectory)/.d $(Objects) 
	@$(MakeDirCommand) $(@D)
	@echo "" > $(IntermediateDirectory)/.d
	@echo $(Objects0)  > $(ObjectsFileList)
	$(LinkerName) $(OutputSwitch)$(OutputFile) @$(ObjectsFileList) $(LibPath) $(Libs) $(LinkOptions)

PostBuild:
	@echo Executing Post Build commands ...
	arm-none-eabi-objcopy -S -O srec  ./Debug/SuperPedro.elf ./Debug/SuperPedro.s19
	arm-none-eabi-objdump -D -S ./Debug/SuperPedro.elf > ./Debug/SuperPedro.dass
	@echo Done

MakeIntermediateDirs:
	@$(MakeDirCommand) "./Debug"


$(IntermediateDirectory)/.d:
	@$(MakeDirCommand) "./Debug"

PreBuild:


##
## Objects
##
$(IntermediateDirectory)/delays.c$(ObjectSuffix): delays.c $(IntermediateDirectory)/delays.c$(DependSuffix)
	$(CC) $(SourceSwitch) "Z:/MOP/c-code/mop/SuperPedro/delays.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/delays.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/delays.c$(DependSuffix): delays.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/delays.c$(ObjectSuffix) -MF$(IntermediateDirectory)/delays.c$(DependSuffix) -MM delays.c

$(IntermediateDirectory)/delays.c$(PreprocessSuffix): delays.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/delays.c$(PreprocessSuffix) delays.c

$(IntermediateDirectory)/keyFuncs.c$(ObjectSuffix): keyFuncs.c $(IntermediateDirectory)/keyFuncs.c$(DependSuffix)
	$(CC) $(SourceSwitch) "Z:/MOP/c-code/mop/SuperPedro/keyFuncs.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/keyFuncs.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/keyFuncs.c$(DependSuffix): keyFuncs.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/keyFuncs.c$(ObjectSuffix) -MF$(IntermediateDirectory)/keyFuncs.c$(DependSuffix) -MM keyFuncs.c

$(IntermediateDirectory)/keyFuncs.c$(PreprocessSuffix): keyFuncs.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/keyFuncs.c$(PreprocessSuffix) keyFuncs.c

$(IntermediateDirectory)/Pedro.c$(ObjectSuffix): Pedro.c $(IntermediateDirectory)/Pedro.c$(DependSuffix)
	$(CC) $(SourceSwitch) "Z:/MOP/c-code/mop/SuperPedro/Pedro.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/Pedro.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/Pedro.c$(DependSuffix): Pedro.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/Pedro.c$(ObjectSuffix) -MF$(IntermediateDirectory)/Pedro.c$(DependSuffix) -MM Pedro.c

$(IntermediateDirectory)/Pedro.c$(PreprocessSuffix): Pedro.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/Pedro.c$(PreprocessSuffix) Pedro.c

$(IntermediateDirectory)/main.c$(ObjectSuffix): main.c $(IntermediateDirectory)/main.c$(DependSuffix)
	$(CC) $(SourceSwitch) "Z:/MOP/c-code/mop/SuperPedro/main.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/main.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/main.c$(DependSuffix): main.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/main.c$(ObjectSuffix) -MF$(IntermediateDirectory)/main.c$(DependSuffix) -MM main.c

$(IntermediateDirectory)/main.c$(PreprocessSuffix): main.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/main.c$(PreprocessSuffix) main.c

$(IntermediateDirectory)/LcdAscii.c$(ObjectSuffix): LcdAscii.c $(IntermediateDirectory)/LcdAscii.c$(DependSuffix)
	$(CC) $(SourceSwitch) "Z:/MOP/c-code/mop/SuperPedro/LcdAscii.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/LcdAscii.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/LcdAscii.c$(DependSuffix): LcdAscii.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/LcdAscii.c$(ObjectSuffix) -MF$(IntermediateDirectory)/LcdAscii.c$(DependSuffix) -MM LcdAscii.c

$(IntermediateDirectory)/LcdAscii.c$(PreprocessSuffix): LcdAscii.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/LcdAscii.c$(PreprocessSuffix) LcdAscii.c


-include $(IntermediateDirectory)/*$(DependSuffix)
##
## Clean
##
clean:
	$(RM) -r ./Debug/


