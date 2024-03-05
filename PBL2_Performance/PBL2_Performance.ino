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

#define echoPin1 9 // Echo Pin
#define trigPin1 7 // Trigger Pin

void setup() {
  Serial.begin(115200);
  pinMode(echoPin1, INPUT);
  pinMode(trigPin1, OUTPUT);

  pwm.begin();
  pwm.setPWMFreq(50);

  servo_move(Servolfr, 60); //左前根
  servo_move(Servolfe, 70); //左前先
  servo_move(Servolbr, 150); //左後根
  servo_move(Servolbe, 80); //左後先 逆動作
  servo_move(Servorfr, 90); //右前根
  servo_move(Servorfe, 0); //右前先
  servo_move(Servorbr, 130); //右後根
  servo_move(Servorbe, 165); //右後先
  delay(2000);
}

double Duration = 0; //受信した間隔
double Distance = 0; //距離

void loop() {
  
  digitalWrite(trigPin1, LOW); 
  delayMicroseconds(2); 
  digitalWrite(trigPin1, HIGH); //超音波を出力
  delayMicroseconds( 10 ); //
  digitalWrite(trigPin1, LOW);
  Duration = pulseIn(echoPin1, HIGH); //センサからの入力
  if (Duration > 0) {
    Duration = Duration/2; //往復距離を半分にする
    Distance = Duration*340*100/1000000; // 音速を340m/sに設定
    Serial.print("Distance:");
    Serial.print(Distance);
    Serial.println(" cm");
  }
  delay(30);
  if (Distance < 7){
    servo_move(Servorfr, 35);
    delay(1000);
    servo_move(Servorfr, 60);
    delay(500);
    servo_move(Servorfe, 90);
    delay(300);
    servo_move(Servorbr, 165);
    delay(300);
    servo_move(Servorbe, 0);
  }
}

// 指定角度にサーボを動かす
void servo_move(int n, int angle){
  angle = map(angle, 0, 165, SERVOMIN, SERVOMAX);
  pwm.setPWM(n, 0, angle);
}
