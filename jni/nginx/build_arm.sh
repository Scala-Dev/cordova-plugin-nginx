$ANDROID_NDK_HOME/build/tools/make-standalone-toolchain.sh --platform=android-19 --install-dir=$HOME/local/android-toolchain --toolchain=arm-linux-androideabi-4.9 --force --verbose
auto/configure --crossbuild=android-arm --prefix=/sdcard/nginx --with-cc=$HOME/local/android-toolchain/bin/arm-linux-androideabi-gcc --without-pcre --without-http_userid_module --without-http_rewrite_module --with-cc-opt=-Wno-sign-compare --with-cc-opt=-fPIE --with-cc-opt=-pie
export CFLAGS="-pipe  -O -W -Wall -Wpointer-arith -Wno-unused-parameter -Wno-sign-compare -FPIE -Werror -g -pie"
make -j8