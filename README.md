# cordova-plugin-nginx

Application Build Manual
====================


You may use cordova CLI as follows:

<pre>
➜ cordova plugin add https://github.com/ScalaInc/cordova-plugin-nginx
</pre>


Install build tools
--------------------
Install following build tools.

* Apache Ant - http://ant.apache.org/
* Android SDK - http://developer.android.com/sdk/index.html
* Android NDK - http://developer.android.com/tools/sdk/ndk/index.html

| name | value |
| :--- | :---- |
| HOME | your home directory |
| ANDROID_HOME | Android SDK install path |
| ANDROID_NDK_HOME | Android NDK install path |


And, make standalone toolchain.

```
#!sh
% $ANDROID_NDK_HOME/build/tools/make-standalone-toolchain.sh \
    --platform=android-19 --install-dir=$HOME/local/android-toolchain
```


Configuration nginx core and modules
--------------------
Connect android device with USB cable, or launch android emulator.

Run command to configure nginx core and libraries.

```
#!sh
% cd jni/nginx

% auto/configure \
    --crossbuild=android-arm \
    --prefix=/sdcard/nginx \
    --with-cc=$HOME/local/android-toolchain/arm-linux-androideabi/bin/gcc \
    --without-pcre --without-http_rewrite_module --without-http_userid_module \
    --with-cc-opt=-Wno-sign-compare
```

Application Usage
====================

Use application
--------------------
Nginx needs config files and logs directory to run.
Please copy `sdcard/nginx` to `/sdcard/nginx` in the android device.

```
/sdcard
    +-- nginx/
          +-- conf/
          |     +-- nginx.conf
          |     +-- mime.types
          |
          +-- html/
          |     +-- index.html
          |     +-- 50x.html
          |
          +-- logs/
```

After that cordova run android and go to http://localhost:8080/ with web browser.

Sample code
--------------------

```javascript
document.addEventListener('deviceready', onDeviceReady);
function onDeviceReady()
{
        var success = function(status) {
            alert('Message: ' + status);
        }

        var error = function(status) {
            alert('Error: ' + status);
        }

        window.expnginx.start( success, error );
}
```