// Credits
// AyeZee#6969

global function Cl_1v1RegisterLocation

struct {

    LocationSettingsOneVOne &selectedLocation
    array choices
    array<LocationSettingsOneVOne> locationSettings

} file;

global function Cl_Custom1v1_Init

void function Cl_Custom1v1_Init()
{
    
}

void function Cl_1v1RegisterLocation(LocationSettingsOneVOne locationSettings)
{
    file.locationSettings.append(locationSettings)
}