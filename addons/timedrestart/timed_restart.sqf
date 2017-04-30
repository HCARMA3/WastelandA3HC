/*=================================================================================================================
  Timed Restart Script
  
  by Weeks
 [15thMEU(SOC)]
=================================================================================================================*/

ServerDuration = (4 * 60 * 60);
DebugServerDuration = (20 * 60);



private ["_timeStart","_timeSinceStart","_shutdownSuccess","_isDebug","_msg30mins","_msg15mins","_msg5mins","_timeUntilRestart","_30minspassed","_15minspassed","_5minspassed","_60secondspassed"];

_isDebug = false;

if(_isDebug) then
{
	ServerDuration = DebugServerDuration;
};

_msg30mins = "<t color='#FFFF00' size='1.25'>Server Restart</t><br/> The server will shut down in less than 30 minutes.";
_msg15mins = "<t color='#FF9D47' size='1.25'>Server Restart</t><br/> The server will shut down in less than 15 minutes.";
_msg5mins = "<t color='#FF5500' size='1.25'>Server Restart</t><br/> The server will shut down in less than 5 minutes.";
_msg1mins = "<t color='#FF0000' size='1.25'>Server Restart</t><br/> The server will shut down in less than 60 seconds! LOG OUT NOW!";

_30minspassed = false;
_15minspassed = false;
_5minspassed = false;
_60secondspassed = false;

_timeStart = diag_tickTime;

while{true} do
{
	_timeSinceStart = diag_tickTime - _timeStart;
	_timeUntilRestart = ServerDuration - _timeSinceStart;
	
	if(_isDebug) then
	{
		diag_log format ["Time Since Start: %1, Time Until Restart: %2", _timeSinceStart, _timeUntilRestart];
	};
	
	switch true do
	{
		case ((_timeUntilRestart < (1 * 60)) && !_60secondspassed) : 
		{
			_msg1mins call DMS_fnc_BroadcastMissionStatus; // using Defent's mission broadcast format for our messages
			diag_log "60 seconds until server restart.";
			_60secondspassed = true;
			_5minspassed = true;
			_15minspassed = true;
			_30minspassed = true;
		};
		case ((_timeUntilRestart < (5 * 60)) && !_5minspassed) : 
		{
			_msg5mins call DMS_fnc_BroadcastMissionStatus;
			diag_log "5 minutes until server restart.";
			_5minspassed = true;
			_15minspassed = true;
			_30minspassed = true;
		};
		case ((_timeUntilRestart < (15 * 60)) && !_15minspassed) : 
		{
			_msg15mins call DMS_fnc_BroadcastMissionStatus;
			diag_log "15 minutes until server restart.";
			_15minspassed = true;
			_30minspassed = true;
		};
		case ((_timeUntilRestart < (30 * 60)) && !_30minspassed) : 
		{
			_msg30mins call DMS_fnc_BroadcastMissionStatus;
			diag_log "30 minutes until server restart.";
			_30minspassed = true;
		};
	};
	
	if(_timeSinceStart > ServerDuration) then
	{
		diag_log "Restart timeout elapsed, attempting server shutdown.";
		_shutdownSuccess = serverCommandPassword serverCommand "#shutdown";
		if(_shutdownSuccess) then
		{
			diag_log "Shutting down server!";
		}
		else
		{
			diag_log "Shutdown failed!";
		};
		
	};
	
	sleep 15;
};