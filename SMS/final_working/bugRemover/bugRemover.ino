
#include <SoftwareSerial.h>

SoftwareSerial mySerial(7, 8);

void setup()
{
  mySerial.begin(19200);  //Default serial port setting for the GPRS modem is 19200bps 8-N-1
  Serial.begin(19200);
  Serial.println("Hello");
  mySerial.print("\r");
  mySerial.println( "AT+CMGD=1,4" );
  delay(1000);                    //Wait for a second while the modem sends an "OK"
  mySerial.print("AT+CMGF=1\r");    //Because we want to send the SMS in text mode
  delay(1000);

  //mySerial.print("AT+CSCA=\"+919032055002\"\r");  //Setting for the SMS Message center number,
  //delay(1000);                                  //uncomment only if required and replace with
  //the message center number obtained from
  //your GSM service provider.
  //Note that when specifying a tring of characters
  // " is entered as \"

  mySerial.print("AT+CMGS=\"+639278378105\"\r");    //Start accepting the text for the message
  //to be sent to the number specified.
  //Replace this number with the target mobile number.
  delay(1000);
  mySerial.print("Bug removed");
  delay(1000);
  mySerial.write(0x1A);  //Equivalent to sending Ctrl+Z
}

void loop()
{
  //We just want to send the SMS only once, so there is nothing in this loop.
  //If we put the code for SMS here, it will be sent again and again and cost us a lot.
}
