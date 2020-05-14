---
title: Arduino
date: 2020-05-14 22:07:39
tags: 
categories: CS&EE
---

**来源: [Arduino程序设计基础 (第2版)](https://book.douban.com/subject/30402779/)**

# 第1章 初识Arduino

## 1.1 什么是Arduino

Arduino既是一块小小的电路板，还是一个开放的电子开发平台
Arduino既包含了硬件——电路板，也包含了软件——开发环境和分享的代码、程序

## 1.2 Arduino的由来

| 开源项目 | 对Arduino贡献 |
| :--------: | :----------: |
| GCC/G++    | Arduino编译器 |
| AVR-Libc   | Arduino语言 |
| Wiring     | Arduino语言 |
| JAVA       | Processing开发环境 |
| Processing | Arduino集成开发环境 |
| AVR-DUDE   | 程序下载到控制器 |

## 1.4 Arduino控制器

- Arduino 101 / Genuino 101
- **Arduino UNO**
- Arduino MEGA
- Arduino Leonardo
- Arduino Due
- Arduino Zero
- 小型化Arduino
	- Arduino Nano
	- Arduino Mini
	- Arduino Micro
	- Arduino Lilypad
- Arduino兼容控制器
	- Zduino UNO
	- Zduino Leonardo
	- Zduino MEGA
- 衍生控制器
- Intel Galileo
- Maple
- ChipKit
- Google ADK 2012

### 1.4.3 Arduino UNO R3

| 电源 |  Power |
| :--: | :--: |
| USB接口 | 5V |
| DC电源输入接口 | 7~12V |
| 电源接口处5V端口 | 5V |
| 电源接口处VIN端口 | 7~12V |

| 指示灯 | LED | 点亮 |
| :--: | :--: | :--: |
| ON | 电源指示灯 | Arduino通电时 |
| TX | 串口发送指示灯 | USB连接计算机且Arduino向计算机传输数据时 |
| RX | 串口接收指示灯 | USB连接计算机且Arduino接收计算机的数据时 |
| L  | 可编程控制指示灯 | 13号引脚为高电平或高阻态时 |

| 复位按键 | Reset Button |
| :--: | :--: |

| 存储空间 | Memory | 详情 |
| :----: | :---: | :---: |
| Flash  | 32KB  | 0.5KB = BOOT区，用于储存引导程序；31.5KB = 用户储存程序的空间 |
| SRAM   | 2KB   | CPU运算时在其中开辟一定储存空间，Arduino断电或复位后其中数据丢失 |
| EEPROM | 1KB   | (电可擦写的可编程只读存储器) Arduino断电或复位后其中数据不会丢失 |

| 输入/输出端口 | Input/Output Port | 作用 |
| :---: | :---: | :---: |
| UART通信 | 0(RX)，1(TX) | 接收和发送串口数据 |
| 外部中断 | 2，3 | 输入外部中断信号 |
| PWM输出 | 3，5，6，9，10，11 | 输出PWM波 |
| SPI通信 | 10(SS)，11(MOSI)，12(MISO)，13(SCK) | SPI通信 |
| TWI通信 | A4(SDA)，A5(SCL)，TWI接口 |TWI通信，兼容IIC通信 |
| AREF   |  AREF接口 | 模拟输入参考电压的输入端口 |
| Reset | 复位端口 | 按下复位键，端口接低电平，使Arduino复位 |

## 1.5 Arduino软件 [(Arduino IDE 下载)](https://www.arduino.cc/en/Main/Software)






# 第2章 基础篇



# 第3章 I/O口高级应用



# 第4章 使用和编写类库





# 第5章 通信篇





# 第6章 存储篇




# 第7章 无线通信篇——红外遥控




# 第8章 LCD显示篇





# 第9章 USB类库的使用





# 第10章 Ethernet类库的使用




# 附录




