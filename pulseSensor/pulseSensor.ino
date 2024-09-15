#define USE_ARDUINO_INTERRUPTS true
#include <PulseSensorPlayground.h>
#define BLYNK_PRINT Serial
#define BLYNK_TEMPLATE_ID "TMPL3DBDLlEoO"
#define BLYNK_TEMPLATE_NAME "heartSensor"
#include <Blynk.h>
#include <ESP8266WiFi.h>
#include <BlynkSimpleEsp8266.h>

char auth[] = "doTO9yHOU4UzOhWhwHt2XzWQGv-v0S2E";       // You should get Auth Token in the Blynk App.
char ssid[] = "NothingPhone";                       // Your WiFi credentials.
char pass[] = "Sahil#124";

 
 
// Constants
const int PULSE_SENSOR_PIN = 0;  // Analog PIN where the PulseSensor is connected
const int LED_PIN = 13;          // On-board LED PIN
const int THRESHOLD = 550;       // Threshold for detecting a heartbeat
 
// Create PulseSensorPlayground object
PulseSensorPlayground pulseSensor;
 
void setup()
{ 
  // Initialize Serial Monitor
  Serial.begin(9600);

 
  // Configure PulseSensor
  pulseSensor.analogInput(PULSE_SENSOR_PIN);
  pulseSensor.blinkOnPulse(LED_PIN);
  pulseSensor.setThreshold(THRESHOLD);
 
  // Check if PulseSensor is initialized
  if (pulseSensor.begin())
  {
    Serial.println("PulseSensor object created successfully!");
  }
    Blynk.begin(auth, ssid, pass);

}
 
void loop()
{
  Blynk.run();
  
  // Get the current Beats Per Minute (BPM)
  int currentBPM = pulseSensor.getBeatsPerMinute();
 
  // Check if a heartbeat is detected
  
 
    Serial.println("♥ A HeartBeat Happened!");
    Serial.print("BPM: ");
    Serial.println(currentBPM);
    Blynk.virtualWrite(V5,currentBPM);
  
 
  // Add a small delay to reduce CPU usage
  delay(1000);
}