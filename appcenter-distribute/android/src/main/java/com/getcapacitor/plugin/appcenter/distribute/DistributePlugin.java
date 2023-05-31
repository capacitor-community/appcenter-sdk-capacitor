package com.getcapacitor.plugin.appcenter.distribute;

import android.util.Log;

public class DistributePlugin {

    public String echo(String value) {
        Log.i("Echo", value);
        return value;
    }
}
