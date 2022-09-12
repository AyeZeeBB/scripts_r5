// Credits
// AyeZee#6969

global function _Custom1v1_Init
global function _1v1RegisterLocation

struct {
    LocationSettingsOneVOne& selectedLocation
    array<LocationSettingsOneVOne> locationSettings
} file;

void function _Custom1v1_Init()
{
	
}

void function _1v1RegisterLocation(LocationSettingsOneVOne locationSettings)
{
    file.locationSettings.append(locationSettings)
}