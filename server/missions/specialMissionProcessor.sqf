// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: specialMissionProcessor.sqf
//	@file Author: Rover047

#define MISSION_PROC_TYPE_NAME "Special Missions"
#define MISSION_PROC_TIMEOUT (["A3W_specialMissionTimeout", 60*60] call getPublicVar)
#define MISSION_PROC_COLOR_DEFINE specialMissionColor

#include "specialMissions\specialMissionDefines.sqf"
#include "missionProcessor.sqf";
