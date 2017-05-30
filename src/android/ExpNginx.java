/*
 Copyright 2014 Modern Alchemists OG
 Licensed under MIT.
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
 documentation files (the "Software"), to deal in the Software without restriction, including without limitation
 the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and
 to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of
 the Software.
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO
 THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
 TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
*/

package com.scala.cordova.plugin.expnginx;

import android.annotation.TargetApi;
import android.app.Activity;
import android.app.AlarmManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.util.Log;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.PluginResult;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import com.scala.cordova.plugin.Nginx;

import java.io.File;
import java.io.IOException;

@TargetApi(19)
public class ExpNginx extends CordovaPlugin {

	private static final String LOG_TAG = "ExpNginx";
	private CallbackContext callbackContext;
	public static final String EXP_PREF = "expPref";

	/**
	 * Constructor.
	 */
	public ExpNginx() {

	}

	@Override
	public boolean execute (String action, final JSONArray args, CallbackContext callbackContext) throws JSONException {

		final Activity activity = cordova.getActivity();
		static ExpNginx nginx ;
		if( action.equals("start") ) {
			Log.v(LOG_TAG, "Cordova Android ExpNginx.start() called.");
			this.callbackContext = callbackContext;
			final ExpNginx self = this;
			activity.runOnUiThread( new Runnable() {
				public void run() {
					try {
						nginx = Nginx.create();
                		nginx.start();
						// send success result to cordova
						PluginResult result = new PluginResult(PluginResult.Status.OK);
						result.setKeepCallback(false); 
						self.callbackContext.sendPluginResult(result);
					} catch( Exception e ) {
						String msg = "Error while starting ExpNginx.";
						Log.e(LOG_TAG, msg);
						
						// return error answer to cordova
						PluginResult result = new PluginResult(PluginResult.Status.ERROR, msg);
						result.setKeepCallback(false); 
						self.callbackContext.sendPluginResult(result);
					}
				}

			});
			return true;
		}

		if( action.equals("stop") ) {
			Log.v(LOG_TAG, "Cordova Android ExpNginx.stop() called.");
			this.callbackContext = callbackContext;
			final ExpNginx self = this;

			activity.runOnUiThread(new Runnable() {

				public void run() {
					try {
						// stop nginx server
						int delay = (int) args.get(0);
						nginx.stop(delay);

						// send success result to cordova
						PluginResult result = new PluginResult(PluginResult.Status.OK);
						result.setKeepCallback(false); 
						self.callbackContext.sendPluginResult(result);
					} catch(Exception e) {
						String msg = "Error while stoping ExpNginx.";
						Log.e(LOG_TAG, msg);
						
						// return error answer to cordova
						PluginResult result = new PluginResult(PluginResult.Status.ERROR, msg);
						result.setKeepCallback(false); 
						self.callbackContext.sendPluginResult(result);
					}
				}

			});
			return true;
		}

		return false;

	}

	
}