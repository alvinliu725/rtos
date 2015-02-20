BOARD = uno

C_STANDARD = -std=c99
WARNINGS = -Wall
VERSION = -D VERSION=\"0.0.1\"

CFLAGS += $(C_STANDARD) $(WARNINGS) $(VERSION)

include /usr/local/opt/arduino-mk/Arduino.mk
