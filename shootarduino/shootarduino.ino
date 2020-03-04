
int button_pin1 = 2;
int button_pin2 = 4;
int button_pin3 = 6;// Switch connected to pin 4
int button_State1 = 0;
int button_State2 = 0;
int button_State3 = 0;

void setup() {
Serial.begin(9600);
pinMode(button_pin1, INPUT_PULLUP);
pinMode(button_pin2, INPUT_PULLUP);
pinMode(button_pin3, INPUT_PULLUP);// Set pin 0 as an input
 // Start serial communication at 9600 bps
}
byte data[3];
void loop() {
 
 int button_State1 =digitalRead(button_pin1);
 int button_State2 =digitalRead(button_pin2);
 int button_State3 =digitalRead(button_pin3);
 data[0] = button_State1;
 data[1] = button_State2;
 data[2] = button_State3;
 Serial.write(data,3);
 delay(50);
}
