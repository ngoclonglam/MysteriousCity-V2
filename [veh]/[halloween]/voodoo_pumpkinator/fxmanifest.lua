fx_version 'cerulean'

games {'gta5'}

lua54 'yes'
 
files {
    'vehiclelayouts.meta',
    'vehicles.meta',
    'carvariations.meta',
    'handling.meta',
 

}

escrow_ignore {
  'fxmanifest.lua',
	'*.meta',
  'stream/*.ytd',    
  'stream/**/*.ytd'  

}

data_file 'VEHICLE_LAYOUTS_FILE' 'vehiclelayouts.meta'

data_file 'HANDLING_FILE' 'handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'vehicles.meta'
data_file 'CARCOLS_FILE' 'carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'carvariations.meta'

 

dependency '/assetpacks'