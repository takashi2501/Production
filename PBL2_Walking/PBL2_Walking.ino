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

void setup() {
  
  pwm.begin();
  pwm.setPWMFreq(50);

  servo_move(Servolfr, 135); //左前根
  servo_move(Servolfe, 80); //左前先
  servo_move(Servolbr, 60); //左後根
  servo_move(Servolbe, 80); //左後先 逆動作
  servo_move(Servorfr, 135); //右前根
  servo_move(Servorfe, 100); //右前先
  servo_move(Servorbr, 45); //右後根
  servo_move(Servorbe, 165); //右後先
  delay(2000);
}

void loop() {
  // phase1
  servo_move(Servolfe, 165);
  delay(30);
  servo_move(Servolfr, 45);
  delay(300);
  servo_move(Servolfe, 80);
  servo_move(Servorfr, 45);
  servo_move(Servolbr, 165);
  delay(300);
  
  // phase2
  servo_move(Servorbe, 90);
  delay(300);
  servo_move(Servorbr, 135);
  delay(300);
  servo_move(Servorbe, 165);
  delay(300);

  // phase3
  servo_move(Servorfe, 0);
  delay(300);
  servo_move(Servorfr, 135);
  delay(300);
  servo_move(Servorfe, 100);
  servo_move(Servolfr, 135);
  servo_move(Servorbr, 45);
  delay(300);

  // phase4
  servo_move(Servolbe, 165);
  delay(300);
  servo_move(Servolbr, 60);
  delay(300);
  servo_move(Servolbe, 80);
  delay(300);
                                                                                          
}
// 指定角度にサーボを動かす
void servo_move(int n, int angle){
  angle = map(angle, 0, 165, SERVOMIN, SERVOMAX);
  pwm.setPWM(n, 0, angle);
}
