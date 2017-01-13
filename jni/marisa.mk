LOCAL_PATH := $(ROOT_PATH)/marisa-trie

include $(CLEAR_VARS)
LOCAL_MODULE := marisa
LOCAL_CPP_EXTENSION := .cc

LOCAL_SRC_FILES := \
	lib/marisa/agent.cc \
	lib/marisa/keyset.cc \
	lib/marisa/trie.cc \
	lib/marisa/grimoire/io/mapper.cc \
	lib/marisa/grimoire/io/reader.cc \
	lib/marisa/grimoire/io/writer.cc \
	lib/marisa/grimoire/trie/louds-trie.cc \
	lib/marisa/grimoire/trie/tail.cc \
	lib/marisa/grimoire/vector/bit-vector.cc

LOCAL_C_INCLUDES := $(LOCAL_PATH)/lib #$(LOCAL_PATH)/include
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/include
include $(BUILD_STATIC_LIBRARY)

ifneq ($(MARISA_TOOLS),)
include $(CLEAR_VARS)
LOCAL_MODULE    := marisa-benchmark
LOCAL_SRC_FILES := tools/marisa-benchmark.cc tools/cmdopt.cc
LOCAL_STATIC_LIBRARIES := marisa
LOCAL_CFLAGS += -fPIE
LOCAL_LDFLAGS += -fPIE -pie -latomic
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_MODULE    := marisa-build
LOCAL_SRC_FILES := tools/marisa-build.cc tools/cmdopt.cc
LOCAL_STATIC_LIBRARIES := marisa
LOCAL_CFLAGS += -fPIE
LOCAL_LDFLAGS += -fPIE -pie -latomic
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_MODULE    := marisa-common-prefix-search
LOCAL_SRC_FILES := tools/marisa-common-prefix-search.cc tools/cmdopt.cc
LOCAL_STATIC_LIBRARIES := marisa
LOCAL_CFLAGS += -fPIE
LOCAL_LDFLAGS += -fPIE -pie -latomic
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_MODULE    := marisa-dump
LOCAL_SRC_FILES := tools/marisa-dump.cc tools/cmdopt.cc
LOCAL_STATIC_LIBRARIES := marisa
LOCAL_CFLAGS += -fPIE
LOCAL_LDFLAGS += -fPIE -pie -latomic
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_MODULE    := marisa-lookup
LOCAL_SRC_FILES := tools/marisa-lookup.cc tools/cmdopt.cc
LOCAL_STATIC_LIBRARIES := marisa
LOCAL_CFLAGS += -fPIE
LOCAL_LDFLAGS += -fPIE -pie -latomic
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_MODULE    := marisa-predictive-search
LOCAL_SRC_FILES := tools/marisa-predictive-search.cc tools/cmdopt.cc
LOCAL_STATIC_LIBRARIES := marisa
LOCAL_CFLAGS += -fPIE
LOCAL_LDFLAGS += -fPIE -pie -latomic
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_MODULE    := marisa-reverse-lookup
LOCAL_SRC_FILES := tools/marisa-reverse-lookup.cc tools/cmdopt.cc
LOCAL_STATIC_LIBRARIES := marisa
LOCAL_CFLAGS += -fPIE
LOCAL_LDFLAGS += -fPIE -pie -latomic
include $(BUILD_EXECUTABLE)
endif
