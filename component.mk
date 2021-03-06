#
# "main" pseudo-component makefile.
#
# (Uses default behaviour of compiling all source files in directory, adding 'include' to include path.)

CPPFLAGS += -DBLE2MQTT_VER=\"$(PROJECT_VER)\"

GATT_INC := $(COMPONENT_PATH)/gatt.inc
GATT_H := $(COMPONENT_PATH)/gatt.h

COMPONENT_EXTRA_CLEAN := $(GATT_INC) $(GATT_H)

EXTRA_COMPONENT_DIRS += $(COMPONENT_PATH)/components/esp_request
EXTRA_COMPONENT_DIRS += $(COMPONENT_PATH)/components/espmqtt

ble_utils.o: $(GATT_H)
gatt.o: $(GATT_INC)

$(GATT_INC) $(GATT_H): $(COMPONENT_PATH)/get_gatt_assigned_numbers.py
	$(CONFIG_PYTHON) $(COMPONENT_PATH)/get_gatt_assigned_numbers.py \
	  -H $(GATT_H) -C $(GATT_INC)
