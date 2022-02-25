class CustomOutBreakMut extends KFGameInfo_WeeklySurvival;
var int CustomOutbreakID;


event PreBeginPlay()
{
    class'OutBreakManager'.static.GetConfig();
    CustomOutbreakID = class'CustomOutBreak.OutBreakManager'.default.CustomOutbreakID;
    super.PreBeginPlay();

    OutbreakEvent.UpdateGRI();

    if (Role == Role_Authority && MyKFGRI != none)
    {
        MyKFGRI.NotifyWeeklyEventIndex(CustomOutbreakID);
        if ( OutbreakEvent.ActiveEvent.bUnlimitedWeaponPickups)
        {
            MyKFGRI.NotifyBrokenTrader();
        }
    }
}

function CreateOutbreakEvent()
{
	//The KFGameEngine at startup will store the week index of our current time
	//      Pull from there and figure out which event it corresponds to.
	//      The beginning of time to reset the loop can be changed in UKFGameEngine::UpdateTimedGameEvents

	local KFGameEngine KGE;

	super.CreateOutbreakEvent();

	KGE = KFGameEngine(class'Engine'.static.GetEngine());
	if (KGE != none)
	{
		ActiveEventIdx = CustomOutbreakID;
	}
	OutbreakEvent.SetActiveEvent(ActiveEventIdx);
}
