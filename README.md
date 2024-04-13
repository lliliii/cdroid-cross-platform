# 안드로이드 크로스 플랫폼 빌드
- C/C++로 작성된 코드를 크로스 플랫폼 빌드를 활용하여 안드로이드 환경에서 작동 가능하도록 빌드하는 예제입니다.

## 사용방법
- make all (x86_64 arm32 arm64)

```
/home/a/x/Android/Sdk/ndk/25.1.8937393/toolchains/llvm/prebuilt/linux-x86_64/bin/x86_64-linux-android23-clang hello-world.c -o ./bin/x86_64_linux
/home/a/x/Android/Sdk/ndk/25.1.8937393/toolchains/llvm/prebuilt/linux-x86_64/bin/armv7a-linux-androideabi23-clang hello-world.c -o ./bin/arm32
/home/a/x/Android/Sdk/ndk/25.1.8937393/toolchains/llvm/prebuilt/linux-x86_64/bin/aarch64-linux-android23-clang hello-world.c -o ./bin/arm64
adb push ./bin/arm32 /data/local/tmp
./bin/arm32: 1 file pushed. 0.3 MB/s (4056 bytes in 0.011s)
adb shell chmod 755 /data/local/tmp/arm32
adb shell /data/local/tmp/arm32
WARNING: linker: /data/local/tmp/arm32: unsupported flags DT_FLAGS_1=0x8000001
hello world 4
adb push ./bin/arm64 /data/local/tmp
./bin/arm64: 1 file pushed. 0.6 MB/s (5880 bytes in 0.009s)
adb shell chmod 755 /data/local/tmp/arm64
adb shell /data/local/tmp/arm64
WARNING: linker: /data/local/tmp/arm64: unsupported flags DT_FLAGS_1=0x8000001
hello world 8
```

![image](https://github.com/lliliii/cdroid-cross-platform/assets/105020691/72af4cf9-ac30-4b53-bc3a-bff8d4a61148)


## Todo(?)
1. `unsupported flags DT_FLAGS_1=0x8000001` 경고 해결
2. Makefile 고도화 (변수화 등등 디테일), 혹은 cmake로 전환
