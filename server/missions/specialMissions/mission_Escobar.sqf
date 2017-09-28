if (!isServer) exitwith {};
#include "specialMissionDefines.sqf";

private ["_stealCar","_dropMoney","_dropPos"];

_setupVars =
{
	_missionType = "¡Avion del Escobar!";
    _dropMoney = 120000;
};

_setupObjects =
{
    _missionLocation = ["Race_1","Race_2"] call bis_fnc_selectRandom;
    _dropLoc1 = ["dropOff_1","dropOff_2"] call bis_fnc_selectRandom;
	
	_missionPos = markerPos _missionLocation;
	_dropPos = markerPos _dropLoc1;
    _stealCar = createVehicle ["C_Plane_Civil_01_racing_F", _missionPos, [], 5, "None"];

	// added by soulkobk
	[_stealCar,_dropPos] spawn { // spawn new thread for activation of _dropPos marker once player is in _stealCar
		params ["_stealCar","_dropPos"];
		waitUntil {(player in _stealCar) || (!alive _stealCar)}; // this line waits until a unit is in the _stealCar or the _stealCar is dead/destroyed
		if (alive _stealCar) then // if _stealCar is still alive then create marker, else do nothing (exit thread).
		{
			_dropMarker = createMarker ["DropOff", _dropPos]; // create 'drop off' marker on _dropPos
			_dropMarker setMarkerType "hd_dot";
			_dropMarker setMarkerShape "ICON";
			_dropMarker setMarkerSize [1, 1];
			_dropMarker setMarkerText "¡Avion del Escobar! - Drop Off Vehicle";
			_dropMarker setMarkerColor "ColorRed";
		};
	};
	////////////////////
		
    _missionHintText = format ["Pablo Escobar necesita que lleven la cocaína a un de su possibles destinos, entregan la coca y reciba una cantidad de plata del patrón.", specialMissionColor];
};

_ignoreAiDeaths = true;
_waitUntilMarkerPos = nil;
_waitUntilExec = nil;
_waitUntilCondition = {!alive _stealCar}; // changed by soulkobk - if vehicle is no longer alive (destroyed) then mission fail
_waitUntilSuccessCondition = {(_stealCar distance _dropPos) <5}; // if vehicle is less than 5 meters from the drop off position then mission successful

_failedExec =
{
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
   
    _successHintMessage = "¡Alguien cumplió el objetivo! ¡El jefe se quedó muy satisfecho, pagó en plata!";
};

_this call specialMissionProcessor;
