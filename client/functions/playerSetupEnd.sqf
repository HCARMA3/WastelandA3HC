// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: playerSetupEnd.sqf
//	@file Author: [GoT] JoSchaap, AgentRev

private "_player";
_player = _this;

_player addRating 1e11;

[objNull, _player] call mf_player_actions_refresh;
[] execVM "client\functions\playerActions.sqf";
[] execVM "addons\vPin\init.sqf";    // Vehicle Pinlock script
[] execVM "addons\Safe\init.sqf";    // Safe script
[] execVM "addons\Bos\init.sqf";     // Baselocker script
[] execVM "addons\Door\init.sqf";    // Door script

_player groupChat "Wasteland - Initialization Complete";
playerSetupComplete = true;
