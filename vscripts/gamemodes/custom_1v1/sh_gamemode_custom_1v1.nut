// Credits
// AyeZee#6969

global function Sh_Custom1v1_Init

global struct LocPairOneVOne
{
    vector origin = <0, 0, 0>
    vector angles = <0, 0, 0>
}

global struct LocationSettingsOneVOne
{
    string name
    array<LocPairOneVOne> ringspots
    array<LocPairOneVOne> spawns
}

struct {
    LocationSettingsOneVOne &selectedLocation
    array choices
    array<LocationSettingsOneVOne> locationSettings
} file;



void function Sh_Custom1v1_Init()
{
	
    switch(GetMapName())
    {
        case "mp_rr_canyonlands_staging":

        case "mp_rr_arena_composite":

        case "mp_rr_ashs_redemption":

        case "mp_rr_canyonlands_mu1":
        case "mp_rr_canyonlands_mu1_night":
        case "mp_rr_canyonlands_64k_x_64k":
            
        case "mp_rr_desertlands_64k_x_64k":
        case "mp_rr_desertlands_64k_x_64k_nx":
            Shared_RegisterLocation(
                NewLocationSettings(
                    "TTV Building",
                    [ // ringspots
                        NewLocPair(<26893, 13646, -3199>, <0, 40, 0>),
                        NewLocPair(<30989, 8510, -3329>, <0, 90, 0>),
                        NewLocPair(<32922, 9423, -3329>, <0, 90, 0>)
                    ],
                    [ // spawns
                        NewLocPair(<25997, 13028, -3139>, <0, -30, 0>),
                        NewLocPair(<28416, 13515, -3230>, <0, -88, 0>)
                    ]
                )
            )

        default:
            Assert(false, "No CTF locations found for map!")
    }

}

LocPairOneVOne function NewLocPair(vector origin, vector angles)
{
    LocPairCTF locPair
    locPair.origin = origin
    locPair.angles = angles

    return locPair
}

LocationSettingsOneVOne function NewLocationSettings(string name, array < LocPairOneVOne > ringspots, array < LocPairOneVOne > spawns)
{
    LocationSettingsOneVOne locationSettings
    locationSettings.name = name
    locationSettings.ringspots = ringspots
    locationSettings.spawns = imcflagspawn

    file.locationSettings.append(locationSettings)

    return locationSettings
}


void function Shared_RegisterLocation(LocationSettingsOneVOne locationSettings)
{
    #if SERVER
    _1v1RegisterLocation(locationSettings)
    #endif

    #if CLIENT
    Cl_1v1RegisterLocation(locationSettings)
    #endif
}