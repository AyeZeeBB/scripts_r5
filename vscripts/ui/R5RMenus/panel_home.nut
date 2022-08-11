global function InitR5RHomePanel
global function SetUIVersion

struct
{
	var menu
	var panel

	var lootBoxOpenButton
} file

void function InitR5RHomePanel( var panel )
{
	file.panel = panel
	file.menu = GetParentMenu( file.panel )

	file.lootBoxOpenButton = Hud_GetChild( file.panel, "OpenLootBoxButton" )
	HudElem_SetRuiArg( file.lootBoxOpenButton, "buttonText", "Open Apex Pack" )
	HudElem_SetRuiArg( file.lootBoxOpenButton, "descText", "Apex Pack Simulator" )
	AddButtonEventHandler( file.lootBoxOpenButton, UIE_CLICK, OpenLootBox )

	//Set info box image
	RuiSetImage( Hud_GetRui( Hud_GetChild( file.panel, "R5RPicBox" ) ), "basicImage", $"rui/menu/home/bg" )
}

void function SetUIVersion()
{
	//Set SDK version text
	Hud_SetText( Hud_GetChild( file.panel, "VersionNumber" ), GetSDKVersion() )
}

void function OpenLootBox(var button)
{
	AdvanceMenu( GetMenu( "LootBoxOpen" ) )
}