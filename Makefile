AR=ar
ARFLAGS=rcs
CXX=g++
CXXFLAGS= -c -g 
CXXFLAGS+= -Wall -fexceptions -x c++ 
CXXFLAGS+= -DARDUSIM -DENABLE_API_NAME -D__AVR_ATmega328P__ -DARDUINO=100 -Wsign-compare
INCLUDEDIRS= arduino/variants/standard arduino\cores include
INCLUDES= $(patsubst %,-I%,$(INCLUDEDIRS))
LDFLAGS=-lWinmm

ARDUSIM: MAIN.o
	@$(AR) $(ARFLAGS) ardusim.a *.o

MAIN.o:
	@$(CXX) $(CXXFLAGS) $(INCLUDES) $(LDFLAGS) \
	arduino/cores/Arduino.h \
	arduino/cores/ardusim.h \
	arduino/cores/main.cpp \
	arduino/cores/wiring.c \
	arduino/cores/wiring_digital.c \
	arduino/cores/wiring_private.h \
	arduino/variants/standard\pins_arduino.h \
	include/avr/common.h \
	include/avr/interrupt.h \
	include/avr/io.h \
	include/avr/lock.h \
	include/avr/pgmspace.h \
	include/avr/sfr_defs.h \
	include/avr/version.h 

clean:
	@rm *.o *.a *.o~ *.a~
