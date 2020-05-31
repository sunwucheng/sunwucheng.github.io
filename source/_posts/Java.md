---
title: Java
date: 2020-05-01 14:53:27
tags:
categories: CS&EE
---

# **来源: [Java教程 - 廖雪峰的官方网站](https://www.liaoxuefeng.com/wiki/1252599548343744)**

## 1. Java快速入门

### 1.1 Java简介

#### 1.1.1 基本名词

|      |      |      |
| :--: | :--: | :--: |
| Java EE | Enterprise Edition | (包含标准的JVM和标准库) |
| Java SE | Standard   Edition | (SE基础加上大量API和库) |
| Java ME | Micro      Edition | (瘦身版) |

* Jaava EE > Java SE > Java ME

|      |      |
| :--- | :--- | 
| JDK (Java Development Kit)     | 包含JRE且提供编译器、调试器等开发工具; 将Java源码编译成字节码 |
| JRE (Java Runtime Environment) | 运行Java字节码的虚拟机 |

* JDK = JRE + Compiler, debugger, etc.
* JRE = JVM + Runtime Library

|      |      |
| :--- | :--- |
| JSR (Java Specification Request)   | JSR是一系列的规范，从JVM的内存模型到Web程序接口全都标准化了 |
| JCP (Java Community Process)       | JCP是负责审核JSR的组织 |
| RI  (Reference Implementation)     | RI只是一个“能跑”的正确的代码，它不追求速度 |
| TCK (Technology Compatibility Kit) | 保证对开发者来说接口、功能都是相同的 |

#### 1.1.2 配置Java

* 下载并安装[JDK14](https://www.oracle.com/java/technologies/javase-jdk14-downloads.html)
* 设置环境变量
  + 设置一个JAVA_HOME的环境变量，它指向JDK的安装目录
	```
	$ C:\Program Files\Java\jdk-14                    //Windows
	$ export JAVA_HOME=`/usr/libexec/java_home -v 14` //MacOS
	```
  + 把JAVA_HOME的bin目录附加到系统环境变量PATH
	```
	$ Path=%JAVA_HOME%\bin;<现有其他路径> //Windows
	$ export PATH=$JAVA_HOME/bin:$PATH  //MacOS
	$ java -version
	```

#### 1.1.3 JDK

|      |      |
| :--: | :--- | 
| java    | 该可执行程序其实就是JVM, 运行Java程序, 就是启动JVM, 然后让JVM执行指定的编译后的代码 |
| javac   | 即Java的编译器，用于把Java源码文件(以.java后缀结尾)编译为Java字节码文件(以.class后缀结尾) |
| jar     | 用于把一组.class文件打包成一个.jar文件, 便于发布 |
| javadoc | 用于从Java源码中自动提取注释并生成文档 |
| jdb     | Java调试器，用于开发阶段的运行调试 |


#### 1.1.4 第一个Java程序

```
public class Hello {
	public static void main(String[] args) {
	System.out.println("Hello, world!");
	}
}
```

#### 1.1.5 类

```
public class Hello {
    ...
}
```

* `public` 表示这个类是公开的
* `class` 用来定义一个类
* `Hello` 为类名(大小写敏感)
* `{}` 中间是类的定义

#### 1.1.6 方法: 可执行的代码块

```
    public static void main(String[] args) {
        ...
    }
```

* `public` 表示这个方法是公开的
* `static` 表示这个方法是静态的
* `void` 为方法的返回类型
* `main` 为方法名
* `()` 中间是方法参数
* `String[]` 为方法的参数类型
* `args` 为方法的参数名
* `{}` 为方法的代码(每一行用`;`结束)

#### 1.1.7 规定

* 执行: 某个类定义的`public static void main(String[] args)`是Java程序的固定入口方法
* 缩进: Java源码的缩进不是必须的, 缩进一般是4个空格或者一个tab
* 保存: 代码保存为文件时，文件名必须要和定义的类名完全保持一致(包括大小写)

#### 1.1.8 运行

* 运行: 先用javac把源代码文本文件XXX.java编译成字节码文件XXX.class, 再用java命令执行这个字节码文件

```
$ mkdir java
$ cd java/
$ vim Hello.java
$ javac Hello.java
$ java Hello
```

#### 1.1.9 使用IDE

* Eclipse
* INtelliJ Idea
* NetBeans


### 1.2 Java程序基础

#### 1.2.1 Java程序基本结构

```
/**
 * 可以用来自动创建文档的注释
 */
public class Hello {
    public static void main(String[] args) {
        // 向屏幕输出文本:
        System.out.println("Hello, world!");
        /* 多行注释开始
        注释内容
        注释结束 */
    }
} // class定义结束
```
- Java是面向对象的语言, 一个程序的基本单位就是class(关键字), 这里定义的class名字就是Hello

```
public class Hello { // 类名是Hello
  // ...
} // class定义结束
```

- 类名要求必须以英文字母开头, 后接字母、数字和下划线的组合; 习惯以大写字母开头; 遵守命名习惯
- 注意到public是访问修饰符，表示该class是公开的
- 不写public，也能正确编译，但是这个类将无法从命令行执行

```
public class Hello {
    public static void main(String[] args) { // 方法名是main
      // 方法代码...
    } // 方法定义结束
}
```

- 在class内部, 可以定义若干方法(method), 方法定义了一组执行语句, 内部代码将依次按顺序执行
- 这里的方法名是main, 返回值是void, 表示没有任何返回值
- 注意到public除了可以修饰class外，也可以修饰方法; 关键字static是另一个修饰符，它表示静态方
- Java入口程序规定的方法必须是静态方法, 方法名必须为main, 括号内的参数必须是String数组
- 方法名也有命名规则, 命名和class一样, 但是首字母小写

```
public class Hello {
    public static void main(String[] args) {
        System.out.println("Hello, world!"); // 语句
    }
}
```

- 在方法内部, 语句才是真正的执行代码; Java的每一行语句必须以分号结束

```
// 这是注释


/*
这是注释
blablabla...
这也是注释
*/

/**
 * 可以用来自动创建文档的注释
 * 需要写在类和方法的定义处，可以用于自动创建文档。
 * @auther liaoxuefeng
 */
```

- 在Java程序中, 注释是一种给人阅读的文本, 不是程序的一部分, 编译器会自动忽略注释
- Java有3种注释: 
  - 单行注释: 以双斜线开头, 直到这一行的结尾结束
  - 多行注释: 以`/*`星号开头，以`*/`结束, 可以有多行
  - 特殊多行注释: 以`/**`开头, 以`*/`结束, 如果有多行, 每行通常以星号开头

#### 1.2.2 变量和数据类型

* 基本类型的变量
















