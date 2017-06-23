// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: getDefaultClothing.sqf
//	@file Author: AgentRev
//	@file Created: 22/12/2013 22:04

private ["_unit", "_item", "_side", "_isSniper", "_isDiver", "_defaultVest", "_result"];

_unit = _this select 0;
_item = _this select 1;

if (typeName _unit == "OBJECT") then
{
	_side = if (_unit == player) then { playerSide } else { side _unit };
	_unit = typeOf _unit;
}
else
{
	_side = _this select 2;
};

_isSniper = (["_sniper_", _unit] call fn_findString != -1);
_isDiver = (["_diver_", _unit] call fn_findString != -1);

_defaultVest = "V_Rangemaster_Belt";

_result = "";

switch (_side) do
{
	case BLUFOR:
	{
		switch (true) do
		{
			case (_isSniper):
			{
				if (_item == "uniform") then { _result = "CUP_U_I_Ghillie_Top" };
				if (_item == "headgear") then {_result = "CUP_H_FR_BandanaWdl" };
				if (_item == "vest") then { _result = _defaultVest };
			};
			case (_isDiver):
			{
				if (_item == "uniform") then { _result = "U_B_Wetsuit" };
				if (_item == "vest") then { _result = "V_RebreatherB" };
				if (_item == "goggles") then { _result = "G_Diving" };
			};
			default
			{
				if (_item == "uniform") then { _result = "CUP_U_B_BAF_DDPM_S1_RolledUp" };
				if (_item == "vest") then { _result = _defaultVest };
				if (_item == "headgear") then { _result = "CUP_H_USArmy_Helmet_ECH1_Sand" };
			};
		};

	};
	case OPFOR:
	{
		switch (true) do
		{
			case (_isSniper):
			{
				if (_item == "uniform") then { _result = "CUP_U_O_TK_Ghillie_Top" };
				if (_item == "headgear") then {_result = "CUP_H_FR_BandanaWdl" };
				if (_item == "vest") then { _result = _defaultVest };
			};
			case (_isDiver):
			{
				if (_item == "uniform") then { _result = "U_O_Wetsuit" };
				if (_item == "vest") then { _result = "V_RebreatherIR" };
				if (_item == "goggles") then { _result = "G_Diving" };
			};
			default
			{
				if (_item == "uniform") then { _result = "CUP_U_O_RUS_Flora_2" };
				if (_item == "vest") then { _result = _defaultVest };
				if (_item == "headgear") then { _result = "CUP_H_USMC_HeadSet_HelmetWDL" };
			};
		};

	};
	default
	{
		switch (true) do
		{
			case (_isSniper):
			{
				if (_item == "uniform") then { _result = "CUP_U_I_Ghillie_Top" };
				if (_item == "vest") then { _result = _defaultVest };
				if (_item == "headgear") then { _result = "CUP_H_RUS_Bandana_HS" };
			};
			case (_isDiver):
			{
				if (_item == "uniform") then { _result = "U_I_Wetsuit" };
				if (_item == "vest") then { _result = "V_RebreatherIA" };
				if (_item == "goggles") then { _result = "G_Diving" };
			};
			default
			{
				if (_item == "uniform") then { _result = "CUP_U_I_UNO_FST_1" };
				if (_item == "vest") then { _result = _defaultVest };
				if (_item == "headgear") then { _result = "CUP_H_CDF_H_PASGT_FST" };
			};
		};

	};
};

_result
