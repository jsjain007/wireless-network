#define NEW_PRINTF_SEMANTICS
#include "printf.h"
configuration TestTemp2AppC
{
	// not required now
}
implementation
{
	// general
	components TestTemp2C as App; // main module file
	components MainC; // Boot
	components LedsC;
	components new TimerMilliC() as Timer0;
	components new TimerMilliC() as Timer1;
	components new AlarmMilli32C() as Alarm;
	//components new AlarmMilli32C() as Alarm1;
	
	App.Boot -> MainC;
	App.Leds -> LedsC;
	App.Timer0 -> Timer0;
	App.Timer1 -> Timer1;
	App.Alarm -> Alarm;
	//App.Alarm0 -> Alarm1;
	//components SerialPrintfC;
	
	components PrintfC;
	components SerialStartC;
	
	components ActiveMessageC;
	components new AMSenderC(AM_RADIO);
	components new AMReceiverC(AM_RADIO);
	App.ComControl -> ActiveMessageC;
	App.Packet -> AMSenderC;
	App.AMPacket -> AMSenderC;
	App.AMSend -> AMSenderC;
	App.Receive -> AMReceiverC;
	App.ComControl -> ActiveMessageC;
}