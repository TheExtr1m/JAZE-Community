::displaytest <- null;
::displaytest2 <- null;
::displaytest3 <- null;

function CheckHealth(){

	DisplayText(self.GetHealth().tostring());

}

function DisplayText(_value){


		if(displaytest == null){
			displaytest = Entities.CreateByClassname("game_text");
			displaytest.__KeyValueFromString("message","BossHP " + _value);
			displaytest.__KeyValueFromString("x", "0.2");
			displaytest.__KeyValueFromString("y", "0.1");
			displaytest.__KeyValueFromString("effect", "2");
			displaytest.__KeyValueFromString("color", "254 170 14");
			displaytest.__KeyValueFromString("fadein", "0");
			displaytest.__KeyValueFromString("fadeOut", "0");
			displaytest.__KeyValueFromString("holdtime", "1");
			displaytest.__KeyValueFromString("spawnflags" "1");
			displaytest.__KeyValueFromString("channel", "4");
			}else{
			displaytest.__KeyValueFromString("message","BossHP  " + _value);
			}
		EntFireByHandle(displaytest,"Display","",0.00,null,null);


		EntFireByHandle(self,"RunScriptCode","CheckHealth()",0.21,null,null);

}


IntTime <- null;
PreventStack <- 0;

function CountDownDisplay(PreventStackInt){

		if(PreventStackInt == PreventStack){

			if(IntTime > 0){

				local _displayN = IntTime.tostring();

				DisplayText2(_displayN);

				EntFireByHandle(self,"Display","",0.00,null,null);
				IntTime = IntTime - 1;
				EntFireByHandle(self,"RunScriptCode","CountDownDisplay(" + PreventStackInt + ")",1.00,null,null);


			}
		}
	}
function CountDownDisplayStart(inputtime){
		IntTime = inputtime;
		PreventStack = PreventStack + 1 ;
		CountDownDisplay(PreventStack);

}

function DisplayText2(_value){

		if(displaytest2 == null){
			displaytest2 = Entities.CreateByClassname("game_text");
			displaytest2.__KeyValueFromString("message","BossTime " + _value);
			displaytest2.__KeyValueFromString("x", "0.0");
			displaytest2.__KeyValueFromString("y", "0.3");
			displaytest2.__KeyValueFromString("effect", "2");
			displaytest2.__KeyValueFromString("color", "255 0 128");
			displaytest2.__KeyValueFromString("channel", "5");
			displaytest2.__KeyValueFromString("fadein", "0");
			displaytest2.__KeyValueFromString("fadeOut", "0");
			displaytest2.__KeyValueFromString("holdtime", "1");
			displaytest2.__KeyValueFromString("spawnflags" "1");
			}else{
			displaytest2.__KeyValueFromString("message","BossTime  " + _value);
			}
		EntFireByHandle(displaytest2,"Display","",0.00,null,null);



}

function DisplayText3(_value){

		if(displaytest3 == null){
			displaytest3 = Entities.CreateByClassname("game_text");
			displaytest3.__KeyValueFromString("message","MisakaHP " + _value);
			displaytest3.__KeyValueFromString("x", "0.2");
			displaytest3.__KeyValueFromString("y", "0.7");
			displaytest3.__KeyValueFromString("effect", "2");
			displaytest3.__KeyValueFromString("color", "255 199 28");
			displaytest3.__KeyValueFromString("channel", "2");
			displaytest3.__KeyValueFromString("fadein", "0");
			displaytest3.__KeyValueFromString("fadeOut", "0");
			displaytest3.__KeyValueFromString("holdtime", "1");
			displaytest3.__KeyValueFromString("spawnflags" "1");
			}else{
			displaytest3.__KeyValueFromString("message","MisakaHP  " + _value);
			}
		EntFireByHandle(displaytest3,"Display","",0.00,null,null);
		EntFireByHandle(self,"RunScriptCode","MisakaHPDisplay()",1.00,null,null);


}
function MisakaHPDisplay(){

	DisplayText3(self.GetHealth().tostring());


}


function BossStart(_time){

	CheckHealth();
	CountDownDisplayStart(_time);

}

function HealthDisplay(){

	CheckHealth();

}

function CountDownStart(_time){

	CountDownDisplayStart(_time);

}
