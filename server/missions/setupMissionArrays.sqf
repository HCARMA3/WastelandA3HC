// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: setupMissionArrays.sqf
//	@file Author: AgentRev

if (!isServer) exitWith {};

WaterMissions =
[
	// Mission filename, weight
	["mission_ArmedDiversquad", 9],
	["mission_SunkenTreasure", 9],
	["mission_Coastal_Jetski", 9],
	["mission_SunkenSupplies", 9],
	["mission_Coastal_Convoy", 9],
	["mission_Pirates", 9],
	["mission_Jaws", 1]
];
MainMissions =
[
	// Mission filename, weight
	["mission_HeavyMetal", 9],
	["mission_IS", 9],
	["mission_artyPatrol", 4],
	["mission_MBT", 9],
	["mission_Convoy", 9],
	["mission_APC", 9],
	["mission_LightArmVeh", 9],
	["mission_Smugglers", 9]
];
SideMissions =
[
	["mission_MiniConvoy", 9],
	["mission_Outpost", 9],
	["mission_Truck", 9],
	["mission_GeoCache", 1],
	["mission_HostageRescue", 9],
	["mission_Occupation", 9],
	["mission_Sniper", 9],
	["mission_HellDrugs", 9],
	["mission_CommunicationInterruption", 9],
	["mission_Conqueror", 9]
];
missionType_water =
[
	"mission_ArmedDiversquad",
	"mission_Coastal_Convoy",
	"mission_SunkenSupplies",
	"mission_SunkenTreasure"
];
MoneyMissions =
[
	["mission_Payday", 9],
	["mission_Terror", 9],
	["mission_Hackers", 2],
	["mission_MoneyShipment", 9],
	["mission_TheHeist", 4],
	["mission_drugsRunners", 9],
	["mission_Roadblock", 9],
	["mission_TownInvasion", 9]
];
specialMissions =
[
	["mission_Escobar", 9],
	["mission_Hijack", 9],
	["mission_Roulette", 9],
	["mission_Train", 9],
	["mission_TombRaider", 9],
	["mission_StomperSOS", 9],
	["mission_Gravedigger", 9],
	["mission_hightechengineer", 9],
	["mission_UAV", 9],
	["mission_Falcon", 9]
];
airMissions =
[
	["mission_ArmedHeli", 9],
	["mission_CivHeli", 9],
	["mission_AirWreck", 9],
	["mission_SupplyDrop", 9],	
	["mission_SmugglerPlane", 9],
	["mission_GhostSwarm", 9],
	["mission_TanoaPatrol", 9],
	["mission_HostileJetFormation", 9],
	["mission_HostileHeliFormation", 9],
	["mission_HostileHelicopter", 9],
	["mission_HostileJet", 9],
	["mission_PawneeSquadron", 9],
	["mission_BlackfootTwins", 9],
	["mission_DeadSky", 9],
	["mission_JetFormation", 9]
];

MissionSpawnMarkers = (allMapMarkers select {["Mission_", _x] call fn_startsWith}) apply {[_x, false]};
ForestMissionMarkers = (allMapMarkers select {["ForestMission_", _x] call fn_startsWith}) apply {[_x, false]};
AirpostMissionMarkers = (allMapMarkers select {["Airpost_", _x] call fn_startsWith}) apply {[_x, false]};
SunkenMissionMarkers = (allMapMarkers select {["SunkenMission_", _x] call fn_startsWith}) apply {[_x, false]};
RoadblockMissionMarkers = (allMapMarkers select {["Roadblock_", _x] call fn_startsWith}) apply {[_x, false]};
SniperMissionMarkers = (allMapMarkers select {["Sniper_", _x] call fn_startsWith}) apply {[_x, false]};
OccupationMissionMarkers = (allMapMarkers select {["Occupation_", _x] call fn_startsWith}) apply {[_x, false]};
GasstationMissionMarkers = (allMapMarkers select {["Gasstation_", _x] call fn_startsWith}) apply {[_x, false]};
IndustryMissionMarkers = (allMapMarkers select {["Industry_", _x] call fn_startsWith}) apply {[_x, false]};
ConquerorMissionMarkers = (allMapMarkers select {["Conqueror_", _x] call fn_startsWith}) apply {[_x, false]};
RiotMissionMarkers = (allMapMarkers select {["Riot_", _x] call fn_startsWith}) apply {[_x, false]};
CommMissionMarkers = (allMapMarkers select {["Comm_", _x] call fn_startsWith}) apply {[_x, false]};
TrainMissionMarkers = (allMapMarkers select {["Train_", _x] call fn_startsWith}) apply {[_x, false]};
HarborMissionMarkers = (allMapMarkers select {["Harbor_", _x] call fn_startsWith}) apply {[_x, false]};
TheHeistMissionMarkers = (allMapMarkers select {["TheHeist_", _x] call fn_startsWith}) apply {[_x, false]};
RaceMissionMarkers = (allMapMarkers select {["Race_", _x] call fn_startsWith}) apply {[_x, false]};
DropoffMissionMarkers = (allMapMarkers select {["Dropoff_", _x] call fn_startsWith}) apply {[_x, false]};

/*if !(ForestMissionMarkers isEqualTo []) then
{
	SideMissions append
	[
	["mission_AirWreck", 3],
	["mission_Occupation", 2],
	["mission_Sniper", 1]
	];
};*/

LandConvoyPaths = (call compile preprocessFileLineNumbers "mapConfig\convoys\landConvoysList.sqf") apply {[_x, false]};
CoastalConvoyPaths = (call compile preprocessFileLineNumbers "mapConfig\convoys\coastalConvoysList.sqf") apply {[_x, false]};
/*SideMissions = [sideMissions, [["A3W_heliPatrolMissions", ["mission_Coastal_Convoy", "mission_HostileHeliFormation"]], ["A3W_underWaterMissions", ["mission_ArmedDiversquad"]]]] call removeDisabledMissions;
MainMissions = [MainMissions, [["A3W_heliPatrolMissions", ["mission_HostileHelicopter", "mission_HostileJet"]], ["A3W_underWaterMissions", ["mission_SunkenSupplies"]]]] call removeDisabledMissions;
MoneyMissions = [MoneyMissions, [["A3W_underWaterMissions", ["mission_SunkenTreasure"]]]] call removeDisabledMissions;
AirMissions = [AirMissions, [["A3W_heliPatrolMissions", ["mission_SunkenTreasure", "mission_GhostSwarm","mission_TanoaPatrol", "mission_HostileJetFormation", "mission_HostileHeliFormation", "mission_HostileHelicopter", "mission_HostileJet", "mission_PawneeSquadron"]]]] call removeDisabledMissions;
*/
{ _x set [2, false] } forEach MainMissions;
{ _x set [2, false] } forEach SideMissions;
{ _x set [2, false] } forEach MoneyMissions;
{ _x set [2, false] } forEach specialMissions;
{ _x set [2, false] } forEach AirMissions;
{ _x set [2, false] } forEach WaterMissions;

ArtyConvoyPaths = [];
{
	ArtyConvoyPaths pushBack [_x, false];
} forEach (call compile preprocessFileLineNumbers "mapConfig\convoys\artyConvoysList.sqf");