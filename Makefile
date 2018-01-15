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
	echo @$(CXX) $(CXXFLAGS) $(INCLUDES) $(LDFLAGS) \
	arduino/cores/Arduino.h \
	arduino/cores/ardusim.h \
	arduino/cores/main.cpp \
	arduino/cores/wiring.c \
	arduino/cores/wiring_digital.c \
	arduino/cores/wiring_private.h \
	arduino/variants/standard/pins_arduino.h \
	include/avr/common.h \
	include/avr/interrupt.h \
	include/avr/io.h \
	include/avr/lock.h \
	include/avr/pgmspace.h \
	include/avr/sfr_defs.h \
	include/avr/version.h 
	@$(CXX) $(CXXFLAGS) $(INCLUDES) $(LDFLAGS) \
	arduino/cores/Arduino.h \
	arduino/cores/ardusim.h \
	arduino/cores/main.cpp \
	arduino/cores/wiring.c \
	arduino/cores/wiring_digital.c \
	arduino/cores/wiring_private.h \
	arduino/variants/standard/pins_arduino.h \
	include/avr/common.h \
	include/avr/interrupt.h \
	include/avr/io.h \
	include/avr/lock.h \
	include/avr/pgmspace.h \
	include/avr/sfr_defs.h \
	include/avr/version.h 

clean:
	@rm *.o *.a *.o~ *.a~
