AR=ar
ARFLAGS=rcs
CXX=g++
CXXFLAGS= -g -c
CXXFLAGS+= -Wall -fexceptions -x c++ 
CXXFLAGS+= -DARDUSIM -DENABLE_API_NAME -D__AVR_ATmega328P__ -DARDUINO=100 -Wsign-compare  -D__USING_MINT8
INCLUDEDIRS= arduino/variants/standard arduino/cores include
INCLUDES= $(patsubst %,-I%,$(INCLUDEDIRS))
ifeq ($(OS),Windows_NT)
    LDFLAGS=-lWinmm
endif

ARDUSIM: MAIN.o
	@$(AR) $(ARFLAGS) ardusim.a *.o

MAIN.o:
	$(CXX) $(CXXFLAGS) $(INCLUDES) $(LDFLAGS) \
	arduino/cores/main.cpp \
	arduino/cores/Print.cpp \
	arduino/cores/wiring.c \
	arduino/cores/wiring_digital.c \
	arduino/cores/CDC.cpp \
	arduino/cores/HID.cpp \
	arduino/cores/new.cpp \
	arduino/cores/Tone.cpp \
	arduino/cores/WMath.cpp.h \
	arduino/cores/Stream.cpp \
	arduino/cores/USBCore.cpp \
	arduino/cores/WString.cpp \
	arduino/cores/IPAddress.cpp \
	arduino/cores/HardwareSerial.cpp \
	sketch/sketch.cpp
	
clean:
	@rm *.o *.a *.o~ *.a~
