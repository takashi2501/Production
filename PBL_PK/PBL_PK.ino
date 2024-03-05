#include <Wire.h>                    
#include <Adafruit_PWMServoDriver.h>

Adafruit_PWMServoDriver pwm = Adafruit_PWMServoDriver(0x40);  

#define SERVOMIN 135    // 最小パルス幅(~4096の範囲)
#define SERVOMAX 430    // 最大パルス幅(~4096の範囲)

#define Servolfr 0
#define Servolfe 2
#define Servolbr 4
#define Servolbe 6
#define Servorfr 8
#define Servorfe 10
#define Servorbr 12
#define Servorbe 14

#define echoPin1 5 // Echo Pin
#define trigPin1 3 // Trigger Pin
#define echoPin2 9 // Echo Pin
#define trigPin2 7 // Trigger Pin

void setup() {
  Serial.begin(115200);
  pinMode(echoPin1, INPUT);
  pinMode(trigPin1, OUTPUT);
  pinMode(echoPin2, INPUT);
  pinMode(trigPin2, OUTPUT);
  
  pwm.begin();
  pwm.setPWMFreq(50);

  servo_move(Servolfr, 60); //左前根
  servo_move(Servolfe, 80); //左前先
  servo_move(Servolbr, 150); //左後根
  servo_move(Servolbe, 80); //左後先 逆動作
  servo_move(Servorfr, 110); //右前根
  servo_move(Servorfe, 90); //右前先
  servo_move(Servorbr, 80); //右後根
  servo_move(Servorbe, 165); //右後先
  delay(2000);


}
 
double Durationright = 0; //受信した間隔
double Distanceright = 0; //距離
double Durationleft = 0; //受信した間隔
double Distanceleft = 0; //距離

void loop() {
  // 右手振り上げ
  digitalWrite(trigPin1, LOW); 
  delayMicroseconds(2); 
  digitalWrite(trigPin1, HIGH); //超音波を出力
  delayMicroseconds( 10 ); //
  digitalWrite(trigPin1, LOW);
  Durationright = pulseIn(echoPin1, HIGH); //センサからの入力
  if (Durationright > 0) {
    Durationright = Durationright/2; //往復距離を半分にする
    Distanceright = Durationright*340*100/1000000; // 音速を340m/sに設定
    Serial.print("Distanceright:");
    Serial.print(Distanceright);
    Serial.println(" cm");
  }
  delay(30);
  if (Distanceright < 40){
    servo_move(Servorbe, 90);
  }
  else{
    servo_move(Servorbe, 165);
    
  }

  // 左手振り上げ
  digitalWrite(trigPin2, LOW); 
  delayMicroseconds(2); 
  digitalWrite(trigPin2, HIGH); //超音波を出力
  delayMicroseconds( 10 ); //
  digitalWrite(trigPin2, LOW);
  Durationleft = pulseIn(echoPin2, HIGH); //センサからの入力
  if (Durationleft > 0) {
    Durationleft = Durationleft/2; //往復距離を半分にする
    Distanceleft = Durationleft*340*100/1000000; // 音速を340m/sに設定
    Serial.print("Distanceleft:");
    Serial.print(Distanceleft);
    Serial.println(" cm");
  }
  delay(30);
  
  if (Distanceleft < 50){
    servo_move(Servorfe, 10);
  }
  else{
    servo_move(Servorfe, 90);
  }
  delay(100);
}

// 指定角度にサーボを動かす
void servo_move(int n, int angle){
  angle = map(angle, 0, 165, SERVOMIN, SERVOMAX);
  pwm.setPWM(n, 0, angle);
}
