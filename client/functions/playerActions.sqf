// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.2
//	@file Name: playerActions.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, [GoT] JoSchaap, AgentRev
//	@file Created: 20/11/2012 05:19

{ [player, _x] call fn_addManagedAction } forEach
[
	//["Holster Weapon", { player action ["SwitchWeapon", player, player, 100] }, [], -11, false, false, "", "vehicle player == player && currentWeapon player != '' && (stance player != 'CROUCH' || currentWeapon player != handgunWeapon player)"], // A3 v1.58 bug, holstering handgun while crouched causes infinite anim loop
	//["Unholster Primary Weapon", { player action ["SwitchWeapon", player, player, 0] }, [], -11, false, false, "", "vehicle player == player && currentWeapon player == '' && primaryWeapon player != ''"],

	["<img image='client\icons\r3f_contents.paa'/> Spawn Beacon Detector On", "addons\spawnBeaconDetector\spawnBeaconDetector.sqf",0,-10,false,false,"","('MineDetector' in (items player)) && !spawnBeaconDetectorInProgress && vehicle player == player"],
	["<img image='client\icons\r3f_contents.paa'/> Spawn Beacon Detector Off", {spawnBeaconDetectorInProgress = false},0,-10,false,false,"","(spawnBeaconDetectorInProgress)"],
	
	["<t color='#FF0000'><img image='client\icons\bomb2.paa' />!!Allahu Akbar!!</T>", "addons\far_revive\FAR_lastResort.sqf", [], -10,false,false,"","('MineDetector' in (items player))"],
	
	[format ["<img image='client\icons\playerMenu.paa' color='%1'/> <t color='%1'>[</t>Player Menu<t color='%1'>]</t>", "#FF8000"], "client\systems\playerMenu\init.sqf", [], -10, false], //, false, "", ""],

	[format ["<img image='addons\spawnBeaconDetector\spawnBeaconDetector.paa' color='%1'/> <t color='%1'>[</t>Airdrop Menu<t color='%1'>]</t>", "#B22222"], "[] execVM 'addons\APOC_Airdrop_Assistance\APOC_cli_startAirdrop.sqf'", [], -10, false], //, false, "", ""],
	//smokescreen tank (commander)
	["Reload Smokescreen ($100)", "addons\aj\smokescreen\fn_aj_c_reloadsmokescreen.sqf", [5,1], -360, false, false, "", "({vehicle player isKindOf _x} count ['Tank','Wheeled_APC_F'] > 0) && ( player == commander vehicle player) && !(isengineon vehicle player)"],
	//smokescreen boat (driver)
	["Reload Smokescreen ($100)", "addons\aj\smokescreen\fn_aj_c_reloadsmokescreen_boat.sqf", [5,1], -360, false, false, "", "vehicle player isKindOf 'Boat_Armed_01_base_F' && ( player == driver vehicle player) && !(isengineon vehicle player)"],
	
	["<img image='client\icons\money.paa'/> Pickup Money", "client\actions\pickupMoney.sqf", [], 1, false, false, "", "{_x getVariable ['owner', ''] != 'mission'} count (player nearEntities ['Land_Money_F', 5]) > 0"],

	["<img image='addons\buryDeadBody\buryDeadBody.paa'/> Bury Dead Body", "addons\buryDeadBody\buryDeadBody.sqf", [], 1.1, false, false, "", "!(([allDeadMen,[],{player distance _x},'ASCEND',{((player distance _x) < 2) && !(_x getVariable ['buryDeadBodyBurried',false])}] call BIS_fnc_sortBy) isEqualTo [])"],

	["<img image='\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\transport_ca.paa'/> <t color='#FFFFFF'>Cancel Action</t>", { doCancelAction = true }, [], 1, false, false, "", "mutexScriptInProgress"],

	["<img image='client\icons\repair.paa'/> Salvage", "client\actions\salvage.sqf", [], 1.1, false, false, "", "!isNull cursorTarget && !alive cursorTarget && {cursorTarget isKindOf 'AllVehicles' && !(cursorTarget isKindOf 'Man') && player distance cursorTarget <= (sizeOf typeOf cursorTarget / 3) max 3}"],

	// If you have a custom vehicle licence system, simply remove/comment the following action
	["<img image='client\icons\r3f_unlock.paa'/> Acquire Vehicle Ownership", "client\actions\takeOwnership.sqf", [], 1, false, false, "", "locked cursorTarget != 2 && [] call fn_canTakeOwnership isEqualTo ''"],

	["[0]"] call getPushPlaneAction,
	["Push vehicle", "server\functions\pushVehicle.sqf", [2.5, true], 1, false, false, "", "[2.5] call canPushVehicleOnFoot"],
	["Push vehicle forward", "server\functions\pushVehicle.sqf", [2.5], 1, false, false, "", "[2.5] call canPushWatercraft"],
	["Push vehicle backward", "server\functions\pushVehicle.sqf", [-2.5], 1, false, false, "", "[-2.5] call canPushWatercraft"],

	["<img image='client\icons\driver.paa'/> Enable driver assist", fn_enableDriverAssist, [], 0.5, false, true, "", "_veh = objectParent player; alive _veh && !alive driver _veh && {effectiveCommander _veh == player && player in [gunner _veh, commander _veh] && {_veh isKindOf _x} count ['LandVehicle','Ship'] > 0 && !(_veh isKindOf 'StaticWeapon')}"],
	["<img image='client\icons\driver.paa'/> Disable driver assist", fn_disableDriverAssist, [], 0.5, false, true, "", "_driver = driver objectParent player; isAgent teamMember _driver && {(_driver getVariable ['A3W_driverAssistOwner', objNull]) in [player,objNull]}"],

	[format ["<t color='#FF0000'>Emergency eject (Ctrl+%1)</t>", (actionKeysNamesArray "GetOver") param [0,"<'Step over' keybind>"]],  { [[], fn_emergencyEject] execFSM "call.fsm" }, [], -9, false, true, "", "(vehicle player) isKindOf 'Air' && !((vehicle player) isKindOf 'ParachuteBase')"],
	[format ["<t color='#FF00FF'>Open magic parachute (%1)</t>", (actionKeysNamesArray "GetOver") param [0,"<'Step over' keybind>"]], A3W_fnc_openParachute, [], 20, true, true, "", "vehicle player == player && (getPos player) select 2 > 2.5"],

	["<img image='client\icons\health.paa'/> Heal Self", "client\items\misc\heal.sqf",0,0,false,false,"","(damage player >= 0.01) && (vehicle player == player) && (('FirstAidKit' in items player) || ('Medikit' in items player))"]
];

if (["A3W_vehicleLocking"] call isConfigOn) then
{
	[player, ["<img image='client\icons\r3f_unlock.paa'/> Pick Lock", "addons\scripts\lockPick.sqf", [cursorTarget], 1, false, false, "", "alive cursorTarget && player distance cursorTarget <= (sizeOf typeOf cursorTarget / 3) max 3 && {{cursorTarget isKindOf _x} count ['LandVehicle','Ship','Air'] > 0 && {locked cursorTarget == 2 && !(cursorTarget getVariable ['A3W_lockpickDisabled',false]) && cursorTarget getVariable ['ownerUID','0'] != getPlayerUID player && 'ToolKit' in items player}}"]] call fn_addManagedAction;
};

// Hehehe...
if !(288520 in getDLCs 1) then
{
	[player, ["<t color='#00FFFF'>Entre como Piloto</t>", "client\actions\moveInDriver.sqf", [], 6, true, true, "", "cursorTarget isKindOf 'Kart_01_Base_F' && player distance cursorTarget < 3.4 && isNull driver cursorTarget"]] call fn_addManagedAction;
};

// More Hehehe...
if !(304380 in getDLCs 1) then
{
	[player, ["<img image='client\icons\driver.paa'/> Entre como Piloto", "client\actions\moveInDriver.sqf", [], 6, true, true, "", "(locked cursorTarget != 2) && ((cursorTarget isKindOf 'B_Heli_Transport_03_F') or (cursorTarget isKindOf 'B_Heli_Transport_03_unarmed_F') or (cursorTarget isKindOf 'Heli_Transport_04_base_F')) && player distance cursorTarget < 10 && isNull driver cursorTarget"]] call fn_addManagedAction;
	[player, ["<img image='client\icons\gunner.paa'/> Entre como CoPiloto", "client\actions\moveInTurret.sqf", [0], 6, true, true, "", "(locked cursorTarget != 2) && ((cursorTarget isKindOf 'B_Heli_Transport_03_F') or (cursorTarget isKindOf 'B_Heli_Transport_03_unarmed_F') or (cursorTarget isKindOf 'Heli_Transport_04_base_F')) && player distance cursorTarget < 10 && isNull (cursorTarget turretUnit [0])"]] call fn_addManagedAction;
	[player, ["<img image='client\icons\gunner.paa'/> Entre no artilheiro da porta esquerda", "client\actions\moveInTurret.sqf", [1], 6, true, true, "", "(locked cursorTarget != 2) && ((cursorTarget isKindOf 'B_Heli_Transport_03_F') or (cursorTarget isKindOf 'B_Heli_Transport_03_unarmed_F')) && player distance cursorTarget < 10 && isNull (cursorTarget turretUnit [1])"]] call fn_addManagedAction;
	[player, ["<img image='client\icons\gunner.paa'/> Entre no artilheiro da porta Direita", "client\actions\moveInTurret.sqf", [2], 6, true, true, "", "(locked cursorTarget != 2) && ((cursorTarget isKindOf 'B_Heli_Transport_03_F') or (cursorTarget isKindOf 'B_Heli_Transport_03_unarmed_F')) && player distance cursorTarget < 10 && isNull (cursorTarget turretUnit [2])"]] call fn_addManagedAction;
};

// Veiculos Apex Free By Rocha
if !(395180 in getDLCs 1) then
{
    [player, ["<img image='client\icons\driver.paa'/> Entre como Piloto", "client\actions\moveInDriver.sqf", [], 6, true, true, "", "(locked cursorTarget != 2) && ((cursorTarget isKindOf 'B_T_VTOL_01_infantry_F') or (cursorTarget isKindOf 'O_T_VTOL_02_infantry_F') or (cursorTarget isKindOf 'B_T_VTOL_01_armed_F') or (cursorTarget isKindOf 'C_Plane_Civil_01_F') or (cursorTarget isKindOf 'B_CTRG_LSV_01_light_F') or (cursorTarget isKindOf 'B_T_LSV_01_unarmed_F') or (cursorTarget isKindOf 'B_T_LSV_01_armed_F') or (cursorTarget isKindOf 'O_T_LSV_02_unarmed_F') or (cursorTarget isKindOf 'O_T_LSV_02_armed_F')) && player distance cursorTarget < 10 && isNull driver cursorTarget"]] call fn_addManagedAction;
    [player, ["<img image='client\icons\gunner.paa'/> Entre como CoPiloto", "client\actions\moveInTurret.sqf", [0], 6, true, true, "", "(locked cursorTarget != 2) && ((cursorTarget isKindOf 'C_Plane_Civil_01_F') or (cursorTarget isKindOf 'B_T_VTOL_01_infantry_F') or (cursorTarget isKindOf 'B_T_VTOL_01_armed_F') or (cursorTarget isKindOf 'O_T_VTOL_02_infantry_F')) && player distance cursorTarget < 10 && isNull (cursorTarget turretUnit [0])"]] call fn_addManagedAction;
    [player, ["<img image='client\icons\gunner.paa'/> Entre no artilheiro", "client\actions\moveInTurret.sqf", [1], 6, true, true, "", "(locked cursorTarget != 2) && ((cursorTarget isKindOf 'O_T_VTOL_02_infantry_F') or (cursorTarget isKindOf 'O_T_VTOL_02_infantry_F') or (cursorTarget isKindOf 'B_CTRG_LSV_01_light_F') or (cursorTarget isKindOf 'B_T_LSV_01_unarmed_F') or (cursorTarget isKindOf 'B_T_LSV_01_armed_F') or (cursorTarget isKindOf 'O_T_LSV_02_unarmed_F') or (cursorTarget isKindOf 'O_T_LSV_02_armed_F')or (cursorTarget isKindOf 'B_T_VTOL_01_armed_F')) && player distance cursorTarget < 10 && isNull (cursorTarget turretUnit [1])"]] call fn_addManagedAction;
	[player, ["<img image='client\icons\gunner.paa'/> Entre no artilheiro 2", "client\actions\moveInTurret.sqf", [2], 6, true, true, "", "(locked cursorTarget != 2) && ((cursorTarget isKindOf 'B_T_LSV_01_armed_F') or (cursorTarget isKindOf 'B_T_VTOL_01_armed_F')) && player distance cursorTarget < 10 && isNull (cursorTarget turretUnit [2])"]] call fn_addManagedAction;
};

if (["A3W_savingMethod", "profile"] call getPublicVar == "extDB") then
{
	if (["A3W_vehicleSaving"] call isConfigOn) then
	{
		[player, ["<img image='client\icons\save.paa'/> Force Save Vehicle", { cursorTarget call fn_forceSaveVehicle }, [], -9.5, false, true, "", "call canForceSaveVehicle"]] call fn_addManagedAction;
	};

	if (["A3W_staticWeaponSaving"] call isConfigOn) then
	{
		[player, ["<img image='client\icons\save.paa'/> Force Save Turret", { cursorTarget call fn_forceSaveObject }, [], -9.5, false, true, "", "call canForceSaveStaticWeapon"]] call fn_addManagedAction;
	};
};
