import processing.serial.*;
Serial mySerial;
PrintWriter output;
void setup() {
  Serial.begin(9600);
   mySerial = new Serial( this, Serial.list()[0], 9600 );
   output = createWriter( "data.txt" );
}
void loop(){
 //Serial.println(); 
}
void draw() {
    if (mySerial.available() > 0 ) {
         String value = mySerial.readString();
         if ( value != null ) {
              output.println( value );
         }
    }
}

void keyPressed() {
    output.flush();  // Writes the remaining data to the file
    output.close();  // Finishes the file
    exit();  // Stops the program
}
