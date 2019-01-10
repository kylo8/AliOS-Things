NAME := board_lpcxpresso54114

$(NAME)_MBINS_TYPE := kernel
$(NAME)_VERSION    := 1.0.0
$(NAME)_SUMMARY    := configuration for board lpcxpresso54114

MODULE          := 54114
HOST_ARCH       := Cortex-M4
HOST_MCU_FAMILY := mcu_lpc54114impl

$(NAME)_COMPONENTS += $(HOST_MCU_FAMILY) osal_aos init

CONFIG_SYSINFO_PRODUCT_MODEL := ALI_AOS_LPC54114
CONFIG_SYSINFO_DEVICE_NAME   := LPC54114

GLOBAL_DEFINES += SKIP_SYSCLK_INIT
# GLOBAL_DEFINES += BLK_BITS=18
GLOBAL_DEFINES += STDIO_UART=0

GLOBAL_CFLAGS += -DSYSINFO_PRODUCT_MODEL=\"$(CONFIG_SYSINFO_PRODUCT_MODEL)\"
GLOBAL_CFLAGS += -DSYSINFO_DEVICE_NAME=\"$(CONFIG_SYSINFO_DEVICE_NAME)\"
GLOBAL_CFLAGS += -DSYSINFO_ARCH=\"$(HOST_ARCH)\"
GLOBAL_CFLAGS += -DSYSINFO_MCU=\"$(HOST_MCU_FAMILY)\"
GLOBAL_CFLAGS += -DCONFIG_NO_TCPIP
GLOBAL_CFLAGS += -DCPU_LPC54114J256BD64_cm4

GLOBAL_INCLUDES += .

$(NAME)_SOURCES :=
$(NAME)_SOURCES += ./board.c
$(NAME)_SOURCES += ./clock_config.c
$(NAME)_SOURCES += ./pin_mux.c

TEST_COMPONENTS += certificate_test

GLOBAL_CFLAGS += -DTEST_CONFIG_KV_ENABLED=0
GLOBAL_CFLAGS += -DTEST_CONFIG_YLOOP_ENABLED=1

