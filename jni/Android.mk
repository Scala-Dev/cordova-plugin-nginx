LOCAL_PATH := $(call my-dir)


include $(CLEAR_VARS)

LOCAL_MODULE    := nginx
LOCAL_SRC_FILES := \
	nginx/src/core/ngx_log.c \
	nginx/src/core/ngx_palloc.c \
	nginx/src/core/ngx_array.c \
	nginx/src/core/ngx_list.c \
	nginx/src/core/ngx_hash.c \
	nginx/src/core/ngx_buf.c \
	nginx/src/core/ngx_queue.c \
	nginx/src/core/ngx_output_chain.c \
	nginx/src/core/ngx_string.c \
	nginx/src/core/ngx_parse.c \
	nginx/src/core/ngx_inet.c \
	nginx/src/core/ngx_file.c \
	nginx/src/core/ngx_crc32.c \
	nginx/src/core/ngx_murmurhash.c \
	nginx/src/core/ngx_md5.c \
	nginx/src/core/ngx_rbtree.c \
	nginx/src/core/ngx_radix_tree.c \
	nginx/src/core/ngx_slab.c \
	nginx/src/core/ngx_times.c \
	nginx/src/core/ngx_shmtx.c \
	nginx/src/core/ngx_connection.c \
	nginx/src/core/ngx_cycle.c \
	nginx/src/core/ngx_spinlock.c \
	nginx/src/core/ngx_cpuinfo.c \
	nginx/src/core/ngx_conf_file.c \
	nginx/src/core/ngx_resolver.c \
	nginx/src/core/ngx_open_file_cache.c \
	nginx/src/core/ngx_crypt.c \
	nginx/src/core/ngx_proxy_protocol.c \
	nginx/src/event/ngx_event.c \
	nginx/src/event/ngx_event_timer.c \
	nginx/src/event/ngx_event_posted.c \
	nginx/src/event/ngx_event_busy_lock.c \
	nginx/src/event/ngx_event_accept.c \
	nginx/src/event/ngx_event_connect.c \
	nginx/src/event/ngx_event_pipe.c \
	nginx/src/os/unix/ngx_time.c \
	nginx/src/os/unix/ngx_errno.c \
	nginx/src/os/unix/ngx_alloc.c \
	nginx/src/os/unix/ngx_files.c \
	nginx/src/os/unix/ngx_socket.c \
	nginx/src/os/unix/ngx_recv.c \
	nginx/src/os/unix/ngx_readv_chain.c \
	nginx/src/os/unix/ngx_udp_recv.c \
	nginx/src/os/unix/ngx_send.c \
	nginx/src/os/unix/ngx_writev_chain.c \
	nginx/src/os/unix/ngx_channel.c \
	nginx/src/os/unix/ngx_shmem.c \
	nginx/src/os/unix/ngx_process.c \
	nginx/src/os/unix/ngx_daemon.c \
	nginx/src/os/unix/ngx_setaffinity.c \
	nginx/src/os/unix/ngx_setproctitle.c \
	nginx/src/os/unix/ngx_posix_init.c \
	nginx/src/os/unix/ngx_user.c \
	nginx/src/os/unix/ngx_process_cycle.c \
	nginx/src/os/unix/glob.c \
	nginx/src/event/modules/ngx_select_module.c \
	nginx/src/event/modules/ngx_poll_module.c \
	nginx/src/http/ngx_http.c \
	nginx/src/http/ngx_http_core_module.c \
	nginx/src/http/ngx_http_special_response.c \
	nginx/src/http/ngx_http_request.c \
	nginx/src/http/ngx_http_parse.c \
	nginx/src/http/ngx_http_header_filter_module.c \
	nginx/src/http/ngx_http_write_filter_module.c \
	nginx/src/http/ngx_http_copy_filter_module.c \
	nginx/src/http/modules/ngx_http_log_module.c \
	nginx/src/http/ngx_http_request_body.c \
	nginx/src/http/ngx_http_variables.c \
	nginx/src/http/ngx_http_script.c \
	nginx/src/http/ngx_http_upstream.c \
	nginx/src/http/ngx_http_upstream_round_robin.c \
	nginx/src/http/ngx_http_parse_time.c \
	nginx/src/http/modules/ngx_http_static_module.c \
	nginx/src/http/modules/ngx_http_index_module.c \
	nginx/src/http/modules/ngx_http_chunked_filter_module.c \
	nginx/src/http/modules/ngx_http_range_filter_module.c \
	nginx/src/http/modules/ngx_http_headers_filter_module.c \
	nginx/src/http/modules/ngx_http_not_modified_filter_module.c \
	nginx/src/http/ngx_http_busy_lock.c \
	nginx/src/http/ngx_http_file_cache.c \
	nginx/src/http/modules/ngx_http_gzip_filter_module.c \
	nginx/src/http/ngx_http_postpone_filter_module.c \
	nginx/src/http/modules/ngx_http_ssi_filter_module.c \
	nginx/src/http/modules/ngx_http_charset_filter_module.c \
	nginx/src/http/modules/ngx_http_autoindex_module.c \
	nginx/src/http/modules/ngx_http_auth_basic_module.c \
	nginx/src/http/modules/ngx_http_access_module.c \
	nginx/src/http/modules/ngx_http_limit_conn_module.c \
	nginx/src/http/modules/ngx_http_limit_req_module.c \
	nginx/src/http/modules/ngx_http_geo_module.c \
	nginx/src/http/modules/ngx_http_map_module.c \
	nginx/src/http/modules/ngx_http_split_clients_module.c \
	nginx/src/http/modules/ngx_http_referer_module.c \
	nginx/src/http/modules/ngx_http_proxy_module.c \
	nginx/src/http/modules/ngx_http_fastcgi_module.c \
	nginx/src/http/modules/ngx_http_uwsgi_module.c \
	nginx/src/http/modules/ngx_http_scgi_module.c \
	nginx/src/http/modules/ngx_http_memcached_module.c \
	nginx/src/http/modules/ngx_http_empty_gif_module.c \
	nginx/src/http/modules/ngx_http_browser_module.c \
	nginx/src/http/modules/ngx_http_upstream_ip_hash_module.c \
	nginx/src/http/modules/ngx_http_upstream_least_conn_module.c \
	nginx/src/http/modules/ngx_http_upstream_keepalive_module.c \
	nginx/objs/ngx_modules.c \
	com_scala_exp_player_Nginx.cpp \
	nginx.c
LOCAL_C_INCLUDES:= $(LOCAL_PATH) \
	$(LOCAL_PATH)/nginx/src/core \
	$(LOCAL_PATH)/nginx/src/event \
	$(LOCAL_PATH)/nginx/src/event/modules \
	$(LOCAL_PATH)/nginx/src/os/unix \
	$(LOCAL_PATH)/nginx/objs \
	$(LOCAL_PATH)/nginx/src/http \
	$(LOCAL_PATH)/nginx/src/http/modules \
	$(LOCAL_PATH)/nginx/src/mail

LOCAL_CFLAGS            +=  -g
LOCAL_LDLIBS            := -lm -llog -landroid -lz
LOCAL_ARM_MODE          := arm
LOCAL_CPPFLAGS          += -std=c++11


include $(BUILD_SHARED_LIBRARY)