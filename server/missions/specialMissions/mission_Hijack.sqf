if (!isServer) exitwith {};
#include "specialMissionDefines.sqf";

private ["_stealCar","_dropMoney","_dropPos"];

_setupVars =
{
	_missionType = "Hijack!";
    _dropMoney = 8000;
};


_setupObjects =
{
    _missionLocation = ["Race_1","Race_2"] call bis_fnc_selectRandom;
    _dropLoc1 = ["dropOff_1","dropOff_2"] call bis_fnc_selectRandom;
	_missionPos = markerPos _missionLocation;
	_dropPos = markerPos _dropLoc1;
    _stealCar = createVehicle ["C_Hatchback_01_sport_F", _missionPos, [], 5, "None"];
   //   waituntil {player in _stealCar};
   //Somehow use this to get the dropoff marker to show AFTER player got in vehicle. 
   //Also need to find a way to make mission fail if _stealCar is destroyed
    _dropMarker = createMarker ["DropOff", _dropPos];
	_dropMarker setMarkerType "hd_dot";
	_dropMarker setMarkerShape "ICON";
	_dropMarker setMarkerSize [1, 1];
	_dropMarker setMarkerText "Drop-Off";
	_dropMarker setMarkerColor "ColorRed";

    _missionHintText = format ["BLAH blah mission text", specialMissionColor];
};

_ignoreAiDeaths = true;
_waitUntilMarkerPos = nil;
_waitUntilExec = nil;
_waitUntilCondition = {player in _stealCar};
_waitUntilSuccessCondition = {(_stealCar distance _dropPos) <5};


_failedExec =
{
	// Mission failed
	{ deleteVehicle _x } forEach [_stealCar];
	deleteMarker "DropOff";
};


_successExec =
{
    for "_i" from 1 to 10 do
	{
		_cash = createVehicle ["Land_Money_F", _dropPos, [], 5, "None"];
		_cash setPos ([_dropPos, [[2 + random 3,0,0], random 360] call BIS_fnc_rotateVector2D] call BIS_fnc_vectorAdd);
		_cash setDir random 360;
		_cash setVariable ["cmoney", _dropMoney / 10, true];
		_cash setVariable ["owner", "world", true];
	};
	
    { deleteVehicle _x } forEach [_stealCar];
    deleteMarker "DropOff";
    
    _successHintMessage = "You have delivered as promised! Take your rewards";
};

_this call specialMissionProcessor;