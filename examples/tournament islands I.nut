function GetInfo(info_type){
	switch(info_type){
		case "name":
			return "Tournament Islands I";
		case "description":
			return "Tournament style map emhasizing fair starting locations, for 4 players.";
		case "args":
			GGen_AddIntArg("width","Width","Width of the map.", 1024, 128, 20000, 1);
			GGen_AddIntArg("height","Height","Width of the map.", 1024, 128, 20000, 1);
			
			return 0;
	}
}

function Generate(){
	local width = GGen_GetParam("width");
	local height = GGen_GetParam("height");

	local quarter = GGen_Data_2D(width / 2, height / 2);
	
	local profile = GGen_Data_1D(2);
	
	profile.SetValue(0, 100); 
	profile.SetValue(1, -100); 
	
	quarter.RadialGradient(width / 4, height / 4, (width > height ? height : width) / 4, profile, true);

	local noise = GGen_Data_2D(width / 2, height / 2);
	noise.Noise(2,  (width > height ? height : width) / 6, GGEN_STD_NOISE);
	
	noise.ScaleValuesTo(-110, 110);
	
	quarter.Add(noise);
	
	local base = GGen_Data_2D(width, height);
	
	base.AddTo(0, 0, quarter);
	
	quarter.Flip(GGEN_VERTICAL);
	
	base.AddTo(0, height / 2, quarter);
	
	quarter.Flip(GGEN_HORIZONTAL);
	
	base.AddTo(width / 2, height / 2, quarter);
	
	quarter.Flip(GGEN_VERTICAL);
	
	base.AddTo(width / 2, 0, quarter);
	
	base.Clamp(0, GGEN_MAX_HEIGHT);
	base.ScaleValuesTo(0,120);
	
	base.TransformValues(GGEN_STD_PROFILE, true);
	
	return base;

}