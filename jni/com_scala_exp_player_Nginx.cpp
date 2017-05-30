
#include <android/log.h>
#include <jni.h>
#include <ngx_config.h>
#include <nginx.h>
#include <stdlib.h>


#ifndef _Included_com_scala_exp_player_Nginx
#define _Included_com_scala_exp_player_Nginx
#ifdef __cplusplus
extern "C" {
#endif


static char *config = NULL;
static char *prefix = NULL;
static char *host = NULL;
static int port = 8080;

static char * jstrdup(JNIEnv* env, jstring str);
/*
 * Class:     com_scala_exp_player_Nginx
 * Method:    getPrefixPath
 * Signature: ()Ljava/lang/String;
 */
JNIEXPORT jstring JNICALL Java_com_scala_exp_player_Nginx_getPrefixPath
  (JNIEnv *, jobject);

/*
 * Class:     com_scala_exp_player_Nginx
 * Method:    setPrefixPath
 * Signature: (Ljava/lang/String;)V
 */
JNIEXPORT void JNICALL Java_com_scala_exp_player_Nginx_setPrefixPath
  (JNIEnv *, jobject, jstring);

/*
 * Class:     com_scala_exp_player_Nginx
 * Method:    setConfigPath
 * Signature: (Ljava/lang/String;)V
 */
JNIEXPORT void JNICALL Java_com_scala_exp_player_Nginx_setConfigPath
  (JNIEnv *, jobject, jstring);

/*
 * Class:     com_scala_exp_player_Nginx
 * Method:    startNative
 * Signature: ()V
 */
JNIEXPORT void JNICALL Java_com_scala_exp_player_Nginx_startNative
        (JNIEnv* env, jobject thiz){
    __android_log_print(ANDROID_LOG_ERROR, "jni_nginx", "Java_org_bitbucket_ntakimura_nginx_Nginx_start");

    int result = 0;

    if (prefix && config) {
        char *ngx_cmd[5] = {"nginx", "-p", prefix, "-c", config};
        result = jni_main(5, ngx_cmd);
    } else if (prefix) {
        char *ngx_cmd[3] = {"nginx", "-p", prefix};
        result = jni_main(3, ngx_cmd);
    } else if (config) {
        __android_log_print(ANDROID_LOG_ERROR, "jni_nginx", "CONFIG");
        char *ngx_cmd[3] = {"nginx", "-c", config};
        result = jni_main(3, ngx_cmd);
    } else {
        char *ngx_cmd[1] = {"nginx"};
        result = jni_main(1, ngx_cmd);
    }

    __android_log_print(ANDROID_LOG_ERROR, "jni_nginx", "result = %d", result);
}

/*
 * Class:     com_scala_exp_player_Nginx
 * Method:    stopNative
 * Signature: ()V
 */
JNIEXPORT void JNICALL Java_com_scala_exp_player_Nginx_stopNative
  (JNIEnv *, jobject);

/*
 * Class:     com_scala_exp_player_Nginx
 * Method:    setPort
 * Signature: (I)I
 */
JNIEXPORT jint JNICALL Java_com_scala_exp_player_Nginx_setPort
  (JNIEnv *, jobject, jint);

/*
 * Class:     com_scala_exp_player_Nginx
 * Method:    setHostName
 * Signature: (Ljava/lang/String;)I
 */
JNIEXPORT jint JNICALL Java_com_scala_exp_player_Nginx_setHostName
  (JNIEnv *, jobject, jstring);

#ifdef __cplusplus
}
#endif
#endif
