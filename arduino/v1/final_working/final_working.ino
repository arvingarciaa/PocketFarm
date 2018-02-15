// send SMS "on", if will turn on the LED
// send SMS "off", if will turn off the LED
#include <SoftwareSerial.h>
#include <DHT.h>;

//Constants
SoftwareSerial mySerial(7, 8);
#define DHTPIN A5     // what pin we're connected to
#define DHTTYPE DHT22   // DHT 22  (AM2302)
DHT dht(DHTPIN, DHTTYPE); //// Initialize DHT sensor for normal 16mhz Arduino
#define myTime (1000UL * 20 * 1) // timeer (milli * secs * mins)
unsigned long rolltime = millis() + myTime;


//Global Variables
String msg = String("");
int SmsContentFlag = 0;
int ledPin = 13;
int menuFlag = 0;
int subFlag = 0;
int forecastSubsFlag = 0;
int moistureSensor = A0;
int subCounter = 0;
String destNo = String("");
String subNo = String("");
int chk;
float hum;  //Stores humidity value
float temp; //Stores temperature value


void setup()
{
  mySerial.begin(19200);               // the GPRS baud rate   
  Serial.begin(19200);                 // the GPRS baud rate
  
  pinMode( ledPin, OUTPUT ); 
  digitalWrite( ledPin, LOW ); 
  mySerial.println("\r");
  mySerial.println( "AT+CMGF=1" );
}
 
void loop()
{
    char SerialInByte;
    if((long)(millis() - rolltime) >= 0) {
       if(forecastSubsFlag==1){
        subCounter++;
        mySerial.print("AT+CMGS=");
        mySerial.print(subNo);
        mySerial.print("\r"); 
        delay(100);
        mySerial.print("Subscription Message #");   //The text for the message
        mySerial.print(subCounter);
        delay(100);
        mySerial.write(0x1A);  //Equivalent to sending Ctrl+Z 
      }
      rolltime += myTime;
    }    
    if(Serial.available())
    {
       mySerial.print((unsigned char)Serial.read());
    }  
    else if(mySerial.available())
    {
        char SerialInByte;
        SerialInByte = (unsigned char)mySerial.read();
        Serial.print( SerialInByte );
        if( SerialInByte == 13 )
        {
          ProcessGprsMsg();
         }
         if( SerialInByte == 10 ){
            // EN: Skip Line feed
         }
         else {
           // EN: store the current character in the message string buffer
           msg += String(SerialInByte);
         }
     }   
}
 
// EN: Make action based on the content of the SMS. 
//     Notice than SMS content is the result of the processing of several GPRS shield messages.

void ProcessSms( String sms )
{
  Serial.print( "ProcessSms for [" );
  Serial.print( sms );
  Serial.println( "]" );
  sms.toLowerCase();
  
  
  //mySerial.print("AT+CMGS=\"+639278378105\"\r");    //Start accepting the text for the message
  //delay(100);
  mySerial.print("AT+CMGS=");
  mySerial.print(destNo);
  mySerial.print("\r"); 
  delay(100);
  if( sms.indexOf("menu") >= 0){
    if(subFlag%2==0){
       mySerial.print("Choose an option \r[1] Subscribe to daily forecasts \r[2] Fetch soil moisture content\r[3] Fetch humidity and temperature \r[4] Subscribe to irrigation suggestions \r\rSend to this number, e.g. \"1\"");   //The text for the message
    } else {
       mySerial.print("Choose an option \r[1] Unubscribe to daily forecasts \r[2] Fetch soil moisture content\r[3] Fetch humidity and temperature \r[4] Subscribe to irrigation suggestions \r\rSend to this number, e.g. \"1\"");   //The text for the message
    }
    delay(100);
    mySerial.write(0x1A);  //Equivalent to sending Ctrl+Z 
    return;
  }
  if( sms.indexOf("1") >= 0){ //Subscribe to daily forecasts
    if(subFlag%2==0){
       subFlag++;
       subNo = destNo;
       forecastSubsFlag = 1;
       mySerial.print("Subscribed to daily forecast!");   //The text for the message   
    } else {
       subFlag++;
       forecastSubsFlag = 0;
       subCounter = 0;
       mySerial.print("Unsubscribed to daily forecast!");   //The text for the message   
    }
    delay(100);
    mySerial.write(0x1A);
    menuFlag = 0;
    return; 
  }
  if( sms.indexOf("2") >= 0){ //Subscribe to daily forecasts
    mySerial.print("15% per cubic meter");   //The text for the message
    delay(100);
    mySerial.write(0x1A);
    return; 
  }
  if( sms.indexOf("3") >= 0){ //Subscribe to daily forecasts
    hum = dht.readHumidity();
    temp= dht.readTemperature();
    //Print temp and humidity values to serial monitor
    mySerial.print("Humidity: ");
    mySerial.print(hum);
    mySerial.print(" %, Temp: ");
    mySerial.print(temp);
    mySerial.print(" Celsius");
    delay(100);
    mySerial.write(0x1A);
    return; 
  }
  //mySerial.println( "AT+CMGD=1,4" );
  mySerial.print("Invalid Code");
  delay(100);
  mySerial.write(0x1A);
  return;
}

// EN: Request Text Mode for SMS messaging


 
void GprsReadSmsStore( String SmsStorePos ){
  mySerial.print( "AT+CMGR=" );
  mySerial.println( SmsStorePos );
}
 
// EN: Clear the GPRS shield message buffer

void ClearGprsMsg(){
  msg = "";
}
 
// EN: interpret the GPRS shield message and act appropiately

void ProcessGprsMsg() 
{
    Serial.println("");
    Serial.print( "GPRS Message: [" );
    Serial.print( msg );
    Serial.println( "]" );
    if( msg.indexOf( "Call Ready" ) >= 0 )
   {
       Serial.println( "*** GPRS Shield registered on Mobile Network ***" );
       mySerial.println( "AT+CMGF=1" );
   }
 
  // EN: unsolicited message received when getting a SMS message
  // FR: Message non sollicité quand un SMS arrive
  if( msg.indexOf( "+CMTI" ) >= 0 )
  {
     Serial.println( "*** SMS Received ***" );
     // EN: Look for the coma in the full message (+CMTI: "SM",6)
     //     In the sample, the SMS is stored at position 6
     int iPos = msg.indexOf( "," );
     String SmsStorePos = msg.substring( iPos+1 );
     Serial.print( "SMS stored at " );
     Serial.println( SmsStorePos );
 
     // EN: Ask to read the SMS store
     GprsReadSmsStore( SmsStorePos );
  }
 
  // EN: SMS store readed through UART (result of GprsReadSmsStore request)  
  if( msg.indexOf( "+CMGR:" ) >= 0 )
  {
    Serial.println("====================");
    Serial.print("Source phone number is: ");
    //gets the sender's phone number
    destNo = "";
    for(int i=22; i<35; i++){
      destNo = destNo + msg[i];
    }
    destNo = "\"" + destNo + "\"";
    Serial.println(destNo);
    Serial.println(destNo.length());
    Serial.println("====================");
    // EN: Next message will contains the BODY of SMS
    if(destNo.length()==15){
      SmsContentFlag = 0;
    }
    SmsContentFlag = 1;
   
    // EN: Following lines are essentiel to not clear the flag!
    ClearGprsMsg();
    return;
  }
 
  // EN: +CMGR message just before indicate that the following GRPS Shield message 
  //     (this message) will contains the SMS body

  if( SmsContentFlag == 1 )
  {
    Serial.println( "*** SMS MESSAGE CONTENT ***" );
    Serial.println( msg );
    Serial.println( "*** END OF SMS MESSAGE ***" );
    ProcessSms( msg );
  }

  ClearGprsMsg();
 // mySerial.println( "AT+CMGD=1,4" );
  // EN: Always clear the flag
  SmsContentFlag = 0; 
}
