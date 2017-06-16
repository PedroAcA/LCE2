double f,bpm,T;// f = frequencia detectada (Hz) = 1/T, bpm = 60*f, T periodo da onda
const double ms = 1.0/1000.0;
const unsigned long int t_amostr = 50; //amostr eh o periodo de amostragem (em milisegundos)
const int porta_leitura=A0,num_amostras = 10000/((int)t_amostr),porta_iniciar = 8;//num_amostras = numero de amostras ate 1 segundo
int i=0,amplitude,iniciar,pico=0;// numero de intervalos de amostragem (cada amostragem com espacamento fixo)
void maximo();

void setup(){
 Serial.begin(9600);
 pinMode(porta_iniciar,INPUT_PULLUP); 
}
void loop(){
 iniciar = digitalRead(porta_iniciar); 
  if(iniciar==LOW){
    delay(500);
    for(;i<num_amostras;i++){
      amplitude = analogRead(porta_leitura);
      Serial.print(amplitude);
      if(i<num_amostras-1){
        Serial.print(',');
      }
      delay(t_amostr); 
    }
  }
  iniciar = digitalRead(porta_iniciar);
}
void maximo(){
  int  leitura_atual= analogRead(porta_leitura);
  int amostras;
  for(amostras = 0;amostras<num_amostras;amostras++){
      if(leitura_atual>pico){
        pico = leitura_atual;
      }
      delay(t_amostr);
     leitura_atual= analogRead(porta_leitura); 
  }
}
