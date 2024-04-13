NDK_PATH=/home/a/x/Android/Sdk/ndk/25.1.8937393
TOOLCHAIN=$(NDK_PATH)/toolchains/llvm/prebuilt/linux-x86_64/bin

CC_X86_64_LINUX=$(TOOLCHAIN)/x86_64-linux-android23-clang
CC_ARM32=$(TOOLCHAIN)/armv7a-linux-androideabi23-clang
CC_ARM64=$(TOOLCHAIN)/aarch64-linux-android23-clang

SRC=hello-world.c

DEVICE_PATH=/data/local/tmp

all: x86_64 arm32 arm64 push_and_run_arm32 push_and_run_arm64

x86_64:
	$(CC_X86_64_LINUX) $(SRC) -o ./x86_64_linux.bin
arm32:
	$(CC_ARM32) $(SRC) -o ./armv7a.bin
arm64:
	$(CC_ARM64) $(SRC) -o ./aarch64.bin

push_and_run_arm32: arm32
	adb push ./armv7a.bin $(DEVICE_PATH)
	adb shell chmod 755 $(DEVICE_PATH)/arm32
	adb shell $(DEVICE_PATH)/arm32

push_and_run_arm64: arm64
	adb push ./aarch64.bin $(DEVICE_PATH)
	adb shell chmod 755 $(DEVICE_PATH)/aarch64.bin
	adb shell $(DEVICE_PATH)/aarch64.bin
clean:
	rm -f ./x86_64_linux.bin ./armv7a.bin ./aarch64.bin
