//////////////////////////////////////////
// ExpNginx.js
// Copyright (C) 2014 Modern Alchemits OG <office@modalog.at>
//
//////////////////////////////////////////
var exec = require('cordova/exec');

var ExpNginx =
{
    start : function( success, error ,)
    {
        exec(success, error, "ExpNginx", "start", [])
    },
    stop : function( success, error , delay)
    {
        exec(success, error, "ExpNginx", "stop", [delay])
    }
}

module.exports = ExpNginx;