#define BLYNK_PRINT Serial
#define BLYNK_TEMPLATE_ID "TMPL3DBDLlEoO"
#define BLYNK_TEMPLATE_NAME "heartSensor"
#include <Blynk.h>
#include <ESP8266WiFi.h>
#include <BlynkSimpleEsp8266.h>

char auth[] = "doTO9yHOU4UzOhWhwHt2XzWQGv-v0S2E";       // You should get Auth Token in the Blynk App.
char ssid[] = "NothingPhone";                       // Your WiFi credentials.
char pass[] = "Sahil#124";


int fsrPin = 0;     // the FSR and 10K pulldown are connected to a0
int fsrReading;     // the analog reading from the FSR resistor divider
 
void setup(void) {
  Serial.begin(9600);   
  Blynk.begin(auth, ssid, pass);
}
 
void loop(void) {
  Blynk.run();
  fsrReading = analogRead(fsrPin);  
 
  Serial.print("Analog reading = ");
  Serial.print(fsrReading);     // print the raw analog reading
 
  if (fsrReading < 20) {
    Serial.println(" - No pressure");
    Blynk.virtualWrite(V6,"No Pressure");
  } else if (fsrReading < 200) {
    Serial.println(" - Light touch");
    Blynk.virtualWrite(V6,"Light touch");
  } else if (fsrReading < 500) {
    Serial.println(" - Light squeeze");
        Blynk.virtualWrite(V6,"Light squeeze");
  } else if (fsrReading < 700) {
    Serial.println(" - Medium squeeze");
        Blynk.virtualWrite(V6,"Medium squeeze");
  } else {
    Serial.println(" - Big squeeze");
        Blynk.virtualWrite(V6,"Big squeeze");

  }
  delay(1000);


}