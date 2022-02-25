class OutBreakManager extends Object
    config(CustomOutBreak);

var config int CustomOutbreakID;
var config bool bConfigsInit;


static function GetConfig()
{
    if (!default.bConfigsInit)
        StaticSaveConfig();
}