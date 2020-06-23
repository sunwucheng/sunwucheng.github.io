---
title: C
date: 2020-04-27 22:14:17
tags: 
categories: CS&EE
---


**来源: [C Primer Plus](https://book.douban.com/subject/26792521/)**


# 1 初识C语言

## 1.6 语言标准

| 1978  | 1989  | 1990  | 1994  | 2011  |
| :---: | :---: | :---: | :---: | :---: |
| K&R C | ANSI C (C89) | ISO C (C90) | C99 | C11 |

## 1.8 编程机制

源代码文件(source code file): 文件名=基本名(basename).扩展名(extension)
C编程: 源代码(by编译) -> 中间代码(by链接: + 库代码&启动代码) -> 可执行代码

| 编译平台 | 编译工具 | 编译命令 |
| :----: | :---: | :--- |
|  UNIX  |       | cc XXX.c                     |
|  GNU   |  GCC  | gcc -std=c99/c1x/c11 XXX.c   |
|  LLVM  | Clang | clang -std=c99/c1x/c11 XXX.c |
|  Linux |  GCC  | gcc XXX.c                    |


# 2 C语言概述

## 2.2 结构解释

```
/* C程序结构 */
#include        //预处理指令(preprocessor directive)) -> 预处理(processing)
int main(void)  //main()总是第一个被调用的函数
function a()    //组成函数的语句
function b()    //组成函数的语句
```

* C语言元素: 关键字 标识符 运算符 数据
* C语言语句(6种): 标号语句 复合语句 表达式语句 选择语句 迭代语句 跳转语句

```
/* 一个简单的程序 */ 
#include <stdio.h>                             //头文件(header): 包含另一个文件

int main(void)                                 //函数头
{                                              //函数体开始
	int num;                               //声明(declaration)
	num = 1;                               //赋值表达式语句
	printf("The number is %d.\n", num);    //调用一个函数 
	return 0;                              //return语句
}                                              //函数体结束
```

- 头文件: 通常指C程序顶部的信息集合，经常包含编译器创建最终可执行程序要用到的信息
	- 如定义常量或指明函数名及其如何使用，但函数的实际代码在一个预编译代码的库文件中
- 函数: C程序包含一个或多个函数, 他们是C程序的基本模块; 函数由函数头和函数体组成
	- 函数头: 包含函数名、传入函数的信息类型和函数的返回类型
	- 函数头: 通过函数名后面的圆括号()可识别函数, 圆括号里可能为空也可能有参数
	- 函数体: 被花括号括起来, 由一系列语句、声明组成
- main()函数:  `int`和`void`是ANSI C定义`main()`的一部分, ANSI C之前的编译器需省略`void`
	|                |                                      |
	| :------------: | :----------------------------------: |
	| int main(void) | 标准形式写法, 移植到不同编译器不会出什么问题 |
	| main()         | 此形式C90勉强接受, C99和C11标准不允许这样写 |
	| void main()    | 此形式一些编译器允许这样写, 但所有标准都未认可 |
- 声明: 为变量指定变量名, 并标识该变量中储存的数据类型; C语言中所有变量须先声明才能使用
	- C99之前的C语言要求把变量声明在块的顶部, 其他语句不能出现在任何声明之前
	- C99和C11遵循C++惯例, 可把声明放在块中的任何位置, 当然变量使用前还是一定要先声明
- 赋值: C语言通过赋值运算符而不是赋值语句完成赋值操作, C语言没有所谓"赋值语句"
- printf()函数: `\n`让计算机另起一行，`%d`告诉计算机以何种形式、在何处输出打印`num`值
	- 参数意指传递给函数的信息
		- 实参(实际参数, actual argument)是传递给函数的特定值;
		- 形参(形式参数)是函数中用于储存值的变量; 
	- 转义序列(escape sequence)用于代表难以表示或无法输入的字符
- return语句: 有返回值的C函数要有return语句; return语句是一种跳转语句
- 命名: 可以用小写字母、大写字母、数字、下划线来命名; 第一个字符不能是数字; 区分大小写; 注意代码可读性
	- C99和C11根据通用字符名(UCN)机制添加了扩展字符集, 包含了除英文字母以外的部分字符
	- C99和C11允许更长的标识符名, 但编译器只识别前63个字符; 外部标识符只允许使用31个字符
	- C90只允许6个字符, 旧式编译器只允许使用8个字符

## 2.6 多个函数

```
/* two_func.c -- 一个文件中包含两个函数 */
#include <stdio.h>

void butler(void);                      /* ANSI/ISO C 函数原型(prototype) */
int main(void)
{
	printf("HAHAHAHAHAHAHA.\n");    
	butler();                       /* 函数调用(function call) */
	printf("Yes.\n");

	return 0;
}

void butler(void)                      /* 函数定义(function definition) */
{
	printf("Are you crazy?\n");
}
```

- 函数声明(function declaration): `void butler();`     
	- 早期C语言的函数声明, 只需指定返回类型, 不用描述参数
	- C90 C99 C11标准都承认旧版本形式, 但它会逐步被淘汰
- 函数原型(prototype): `void butler(void);` 
	- C90新增了函数原型, 指明了函数的属性: 函数返回值, 函数描述参数
	- 标准include文件(包含文件)为标准库函数提供了函数原型, 如stdio.h文件包含了printf()的函数原型
- 函数执行: 无论在什么地方所有C程序都从main()开始执行, 但惯例把main()放开头, 因为它提供了程序的基本框架

## 2.8 关键字和保留标识符

|       |       |       |       |       |       |       |       |       |       |       |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| auto | break | case | char | **const** | continue | default | do | double | else | **enum** | 
| estern | float | for | goto | if | *inline* | int | long | register | restrict | return |
| short | **signed** | sizeof | static | struct | switch | typeof | union | unsigned | void | |**volatile** |
 while | ***_Alignas*** | ***_Aligof*** | ***_Atomic*** | ***_Bool*** | ***_Complex*** | ***_Generic*** | ***_Imaginary*** | ***_Noreturn*** | ***_Static_assert*** | ***_Thred_local*** |

* **粗体** 表示C90标准新增的关键字； *斜体* 表示C99标准新增的关键字； ***粗斜体*** 表示C11标准新增的关键字


# 3  数据和C

## 3.1 示例程序

```
#include <stdio.h>
int main(void)
{
	float weight;
	float value;
	printf("Are you worth your weight in platinum?\n");
	printf("Let's check it out.\n");
	printf("Please enter your weight in pounds: ");
	scanf("%f", &weight);
	value = 1700.0 * weight * 14.5833;
	printf("Your weight in platinum is worth $%.2f.\n", value);
	printf("You are easily worth that! If platinum prices drop,\n");
	printf("eat more to maintain your value.\n");
	return 0;
}
```

- 浮点数类型float可以储存带小数的数字，以便处理更大范围的数据
- scanf()读取键盘的输入: 
	- `%f`说明要读取的是浮点数
	- `&weight`告诉scanf()把输入的值赋给`weight`变量，即用`&`表明找到`weight`变量的地点
- printf()进行信息的输出
	- `%.2f`中的`.2`用于精确控制输出，即指定输出的浮点数只显示小数点后两位
	- printf()语句把输出发送到一个叫作缓冲区(buffer)得到中间存储区域
	  在缓冲区满或遇到换行字符或需要输入时, 缓冲区中的内容再不断被发送到屏幕上
	- 刷新缓冲区: 从缓冲区把数据发送到屏幕或文件

## 3.2 变量和常量数据

- 数据: 承载信息的数字和字符
	- 常量(constant): 数据类型在程序使用之前已经预设好了，在整个程序运行过程中没有变化的数据
	- 变量(variable): 数据类型在程序运行期间可能改变或被赋值的数据

## 3.3 数据: 数据类型关键字

|       |      |
| :---: | :--- |
| 位(bit) | 可以储存0或1 |
| 字节(byte) | char类型占用的位(bit)数, 通常1字节均为8位 |
| 字(word) | 设计计算机时给定的自然存储单位 |

- `int` (加`signed`、`unsigned`、`short`、`long`、`long long`) 表示基本的整数类型
- `char` 指定字母和其它字符(`# $ % * ...`)，以及较小的整数
- `float` `double` `long double` 表示带小数点的数
- `_Bool` 表示布尔值(`true` or `false`)
- `_Complex` 表示复数
- `_Imaginary` 表示虚数

整数类型: 没有小数部分, 计算机中整数以二进制数字储存
浮点数类型: 有小数部分, 同数学中的实数, 计算机中浮点数分开为小数部分和指数部分表示和储存

## 3.4 C语言基本数据类型

```
#include <stdio.h>
int main(void)
{
	printf("Type char has a size of %zd bytes.\n", sizeof(char));
	printf("Type short has a size of %zd bytes.\n", sizeof(short));
	printf("Type int has a size of %zd bytes.\n", sizeof(int));
	printf("Type long has a size of %zd bytes.\n", sizeof(long));
	printf("Type long long has a size of %zd bytes.\n", sizeof(long long));
	printf("Type float has a size of %zd bytes.\n", sizeof(float));
	printf("Type double has a size of %zd bytes.\n", sizeof(double));
	printf("Type long double has a size of %zd bytes.\n", sizeof(long double));
	return 0;
}
```

* `sizeof`: C语言的内置运算符, 以字节为单位给出指定对象(类型/特定量)的大小
	- 运算对象若是**类型**: 圆括号必不可少，应写成`sizeof(char)`形式
	- 运算对象是**特定量**: 圆括号可有可无，可写成`sizeof name`或`sizeof 6.28`或`sizeof(6.28)`
* `%zd`: C99和C11提供`%zd`转换说明匹配sizeof的返回类型(size_t类型)
* `%zd`: 一些不支持C99和C11的编译器可用`%u`或`%lu`代替`%zd`

### 3.4.1 int类型

- 声明: 为变量赋于名称并分配内存空间
- 初始化: 为变量赋一个初始值
- 进制表示: 通常假定整形常量为**十进制**，`0`前缀表示**八进制**，`0x`或`0X`前缀表示**十六进制**
- 整形常量/整形字面量: 
| 类型 | 十六进制 | 八进制 | 十进制 |
| :----: |:----: |:----: |:----: |
| char | \0x41 | \0101 | N.A. |
| int | 0x41 | 0101 | 65 |
| unsigned int | 0x41u | 0101u | 65u |
| long | 0x41L | 0101L | 65L |
| unsigned long | 0x41UL | 0101UL | 65UL |
| long long | 0x41LL | 0101LL | 65LL |
| unsigned long long | 0x41ULL | 0101ULL | 65ULL |
- 整型显示: `printf()`转换说明 `%d` **十进制**显示; `%(#)o` **八进制(前缀)**显示; `%(#)x` **十六进制(前缀)**显示
- 转换说明: printf()函数中的转换说明决定了数据的显示方式, 而不是数据的储存方式
- 转换说明: printf()函数中转换说明的数量应与待打印值(int类型的变量/常量，值为int类型的表达式)的数量相等
- 转换说明: C虽然允许使用大写或小写的多常量后缀, 但是在转换说明中只能用小写

### 3.4.3 char类型

- 表示: 字符以数值形式储存, 计算机在内存中用数值编码来表示字符(C支持常用的ASCII码及其他编码)
- 类型: C90标准中C语言允许在关键词char前使用signed和unsigned表示有/无符号类型
- 初始化: 可使用数字代码值或字符常量来赋值
- 变量名: 没有引号的(单个)字符
- 字符常量(character constant): 计算机系统使用数值编码的的符号表示，表示为单引号括起来的字符
- 字符串: 用双括号括起来的(单个)字符
- 字符串: 无论普通字符还是转义序列, 只要是双引号括起来颚的字符合集, 就无须用单引号括起来

* 打印字符

	```
	#include <stdio.h>
	int main()
	{
		char ch;
		printf("Please enter a character.\n");
		scanf("%c", &ch);
		printf("The code for %c is %d.\n", ch, ch);
		return 0;
	}
	```

* 非打印字符
	- ASCII码表示: `char beep = 7;`
	- 转义序列表示: `char nerf = '\n';`

* 转义序列(escape sequence)

	| 转义序列 | 含义 |
	| :---:   | :---: |
	|	\a    | 警报(ANSI C) |
	|	\b    | 退格 |
	|	\f    | 换页(把活跃位置移至下一页的开始处)(打印机上) |
	|	\n    | 换行(把活跃位置移至下一行的开始处) |
	|	\r    | 回车(把活跃位置移至当前行的开始处) |
	|	\t    | 水平制表符(把活跃位置移至下一个水平制表点)(打印机上) |
	|	\v    | 垂直制表符(把活跃位置移至下一个垂直制表点) |
	|	\\    | 反斜杠(\) |
	|	\'    | 单引号 |
	|	\"    | 双引号 |
	|	\?    | 问号 |
	|	\0oo  | 八进制值(oo必须是有效的八进制数, 即每个o可表示0～7中的一个数) |
	|	\xhh  | 十六进制值(hh必须是有效的十六进制数, 即每个h可表示0～f中的一个数) |

	C标准规定警报字符不得改变活跃位置(active position), 即显示设备中下一个字符将出现的位置

	```
	#include <stdio.h>
	int main()
	{
		float salary;
		printf("\aEnter your desired monthly salary:");
		printf(" $_______\b\b\b\b\b\b\b");
		scanf("%f", &salary);
		printf("\n\t$%.2f a month is $%.2f a year.", salary, salary * 12.0);
		printf("\rGee!\n");
		return 0;
	}
	```

### 3.4.4 ***_Bool*** 类型

C99标准添加了*`_Bool`*类型，用于表示布尔值，即逻辑值true和false，原则上仅占用1位存储空间
C语言用值1表示true，值0表示false，所以*`_Bool`*类型实际也是一种整数类型

### 3.4.5 可移植类型: stdint.h和inttypes.h

```
#include <stdio.h>
#include <inttypes.h>
int main(void)
{
	int32_t me32;
	me32 = 45933945;
	printf("First, assume int32_t is int: ");
	printf("me32 = %d\n", me32);
	printf("Next, let's not make any assumptions.\n");
	printf("Instead, use a \"macro\" from inttypes.h: ");
	printf("me32 = %" PRId32 "\n", me32);
	return 0;
}
```

- 精确宽度整数类型(exact-width integer type)
- 最小宽度类型(minimum width type): 保证所表示类型一定是至少有指定宽度的最小整数类型
- 最快最小宽度类型(fast minimum width type)
- 最大的无符号整数类型

### 3.4.6 浮点数类型: float、double、long double

- 浮点型常量: 默认情况编译器假定是`double`类型
	- 加上`f`或`F`后缀覆盖为`float`类型
	- 加上`l`或`L`覆盖为`long double`类型
- 十六进制表示浮点型常量(C99新增): 
	- 在十六进制数前加上十六进制前缀(`0x`或`0X`), 用`p`或`P`分别代替`e`和`E`
	- 用2的幂代替10的幂(即**p计数法**)

```
#include <stdio.h>
int main()
{
	float aboat = 32000.0;
	double abet = 2.14e9;
	long double dip = 5.32e-5;
	printf("%f can be written %e\n", aboat, aboat);
	printf("And it's %a in hexadecimal, powers of 2 notation\n", aboat);
	printf("%f can be written %e\n", abet, abet);
	printf("%Lf can be written %Le\n", dip, dip);
	return 0;
}
```

- 浮点值的上溢(overflow)和下溢(underflow)
	- 上溢: 当计算导致数字过大, 超过当前类型能表达的范围
		- C语言规定给其赋一个表示无穷大的特定值
		- printf()显示该值为inf或infinity(或有无穷意义的其他内容)
	- 下溢: 计算过程中损失了原本末尾有效位上的数字
		- 低于正常的(subnormal)浮点值: 损失了类型全精度的浮点值

```
#include <stdio.h>
int main(void)
{
	float a, b;
	b = 2.0e20 + 1.0;
	a = b - 2.0e20;
	printf("%f \n", a);
	return 0;
}
```

### 3.4.6 复数和虚数类型

- 复数类型和虚数类型的支持
	- C99标准支持复数类型和虚数类型, 但有所保留
	- 一些独立实现(如嵌入式处理器的实现)就不需要使用复数和虚数(如VCR芯片不需要复数)
	- 一般虚数类型都是可选项, C11标准把整个复数软件包都作为可选项
- 复数类型
	- `float_Complex` : 包含两个float类型的多值, 分别表示复数的实部和虚部
	- `double_Complex`
	- `long double_Complex`
- 虚数类型
	- `float_Imaginary`
	- `double_Imaginary`
	- `long double_Imaginary`

* complex.h: 若包含该头文件，便可用`complex`代替`_Complex`，`Imaginary`代替`_Imaginary`，`I`代替`-1`的平方根

### 3.4.7 其他类型(由基本类型衍生): 数组、指针、结构、联合


# 4 字符串和格式化输入/输出

## 4.1 前导程序

```
/* talkback.c —— 演示与用户交互 */
#include <stdio.h>
#include <string.h>
#define DENSITY 62.4                 //用C预处理器把字符常量DENSITY定义为62.4
int main()
{
	float weight, volume;
	int size, letters;
	char name[40];               //用数组储存字符串

	printf("Hi! What's your first name?\n");
	scanf("%s", name);           //name没有&前缀 （使用%s转换说明来处理字符串的输入和输出）
	printf("%s, what's your weight in pounds?\n", name);
	scanf("%f", &weight);        //weight有&前缀
	size = sizeof name;
	letters = strlen(name);      //用C函数strlen()获取字符串的长度
	volume = weight / DENSITY;
	printf("Well, %s, your volume is %2.2f cubic feet.\n", name, volume);
	printf("Also, your first name has %d letters,\n", letters);
	printf("and we have %d bytes to store it.\n", size);

	return 0;
}
```

## 4.2 字符串简介

数组(array): 同类型数据元素的有序序列
字符串(character string): 一个或多个字符的序列 e.g., `"I am your father!"`
双引号`" "`不是字符串的一部分，仅用来告知编译器它扩起来的是字符串，正如单引号''标识单个字符
C语言没有专门用于储存字符串的变量类型，字符串都被储存在char类型的数组中 e.g., `char name[40];`

|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  | 空字符 |
| :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: |
| I |   | a | m |   | y | o | u | r |   | f | a | t | h | e | r | ! | \0 |

C语言用空字符(null character)标记字符串的结束，即字符串一定以空字符结束，占用数组最后一个储存单元
有40个储存单元的字符串最多能储存39个字符，故字符串的数组容量必须至少比待存储字符串的字符数多1
空字符不是数字0，而是非打印字符，其ASCII码值是(或等价于)0

```
/* sizeof运算符、strlen()函数返回的数据类型d的转换说明: %u或%lu(早期)，%zd(C99、C11新增) */
#include <stdio.h>
#include <string.h>
# define PRAISE "OMG U R the one."
int main(void)
{
	char name[40];

	printf("What's your name? ");
	scanf("%s", name);
	printf("Your name of %zd letters ", strlen(name));
	printf("occupies %zd memory cells.\n", sizeof name);
	printf("The phrase of praise has %zd letters ", strlen(PRAISE));
	printf("and occupies %zd memory cells.\n", sizeof PRAISE);

	return 0;
}
```

* sizeof运算符: 以字节为单位给出对象的大小(字符串数组总的字节大小)
* strlen()函数: 给出字符串中的字符长度(字符串数组中字符信息的字节大小，不包括空字符)

## 4.3 常量和C预处理器

符号常量(symbolic constant): 符号常量名命名规则与变量相同，但习惯使用大写表示，有时表示为带`c_`或`k_`前缀
明示常量(manifest constant): C标准没有此概念，仅提到过`#define`最简单的用法是定义一个“明示常量”
编译时替换(compile-time substitution): 预处理器可用来定义常量、字符和字符串常量等，格式`#define NAME value`
const 限定符: `const`关键字用于限定一个**变量**为只读，如`const int MONTHS = 12;`，用起来比`#define`更灵活

## 4.4 printf()和scanf()

### 4.4.1 printf()函数

printf()函数使用的是值，无论是变量、常量还是表达式的值
printf()函数使用%符号来标识转换说明
转换说明(conversion specification): printf()函数打印数据的指令(须与待打印数据的类型相匹配)
转换说明修饰符: 在%和转换字符之间插入修饰符可修饰基本的转换说明(插入多个应注意顺序、不是所有组合都行)

| 转换说明 | 输出   |
| :--: | :--: |
| %a | 浮点数、十六进制数、p计数法(C99/C11) |
| %A | 浮点数、十六进制数、p计数法(C99/C11) |
| %c | 单个字符 |
| %d | 有符号的十进制整数 |
| %e | 浮点数、e计数法 |
| %E | 浮点数、e计数法 |
| %f | 浮点数、十进制计数法 |
| %g | 根据值的不同，自动选择%f或%e；%e格式用于指数小于-4、大于或等于精度时 |
| %G | 根据值的不同，自动选择%f或%e；%e格式用于指数小于-4、大于或等于精度时 |
| %i | 有符号十进制整数(与%d相同) |
| %o | 指针 |
| %p | 字符串 |
| %s | 无符号八进制整数 |
| %u | 无符号十进制整数 |
| %x | 无符号十六进制整数，使用十六进制数0f |
| %X | 无符号十六进制整数，使用十六进制数0F |
| %% | 打印一个百分号 |

| 修饰符 | 含义   |
| :--: | :--- |
| (标记) </br> - | 待打印项左对称，即从字段的左侧开始打印该项 </br> 示例：`"%-20s"` |
| (标记) </br> + | 有符号值若为正，则在值前面显示加号 </br> 有符号值若为负，则在值前显示减号 </br> 示例：`"%+6.2f"` |
| (标记) </br> 空格 | 有符号值若为正，则在值前面显示前导空格(不显示任何符号) </br> 若为负，则在值前面显示减号 </br> `+`标记覆盖一个空格 </br> 示例：`"% 6.2f"` |
| (标记) </br> # | 把结果转换为另一种形式： </br> 若是`#o`格式，则以`0`开始 </br> 若是`%x`或`%X`格式，则以`0x`或`0X`开始 </br> 对所有的浮点格式，`#`保证了即使后面没有任何数字，也打印一个小数点字符 </br> 对`%g`和`%G`格式，`#`防止结果后面的`0`被删除 </br> 示例：`"%#o"`、`"%#8.0f"`、`"%+#10.3e"` |
| (标记) </br> 0 | 对于数值格式，用前导`0`代替空格填充字段宽度 </br> 对于整数格式，若出现`-`标记或指定精度，则忽略该标记 </br> 示例：`"%010d"`、`"%0.83f"` |
| 数字 | 最小字段宽度：若该字段不能容纳待打印的数字或字符串，系统会使用更宽的字段 </br> 示例：`"%4d"` |
| .数字 | 精度： </br> 对于`%e`、`%E`、`%f`转换，表示小数点右边数字的位数 </br> 对于`%g`、`G`，表示有效数字最大位数 </br> 对于`%s`转换，表示待打印字符的最大数量 </br> 对于整形转换，表示待打印数字的最小位数 </br> 如有必要，使用前导`0`来达到这个位数 </br> 只使用`.`表示其后跟随一个`0`，所以`%.f`和`%.0f`相同 </br> 示例：`"%5.2f"`打印一个浮点数，字段宽度为5字符，其中小数点后有两位数字 |
| h | 和整形转换说明一起使用，表示`short int`或`unsigned short int`类型的值 </br> 示例：`"%hu"`、`"%hx"`、`"%6.4hd"` |
| hh | 和整形转换说明一起使用，表示`signed char`或`unsigned char`类型的值 </br> 示例：`"%hhu"`、`"%hhx"`、`"%6.4hhd"` |
| j | 和整形转换说明一起使用，表示`intmax_t`或`uintmax_t`类型的值(这些类型定义在`stdint.h`中) </br> 示例：`"%jd"`、`"%8jx"` |
| l | 和整形转换说明一起使用，表示`long int`或`unsigned long int`类型的值 </br> 示例：`"%ld"`、`"%8lu"` |
| ll | 和整形转换说明一起使用，表示`long long int`或`unsigned long long int`类型的值(C99) </br> 示例：`"%lld"`、`"%8llu"` |
| L | 和浮点转换说明一起使用，表示`long double`类型的值 </br> 示例：`"%Lf"`、`"%10.4Le"` |
| t | 和整形转换说明一起使用，表示`ptrdiff_t`类型的值，`ptrdiff_t`是两个指针差值的类型(C99) </br> 示例：`"%td"`、`"%12ti"` |
| z | 和整形转换说明一起使用，表示`size_t`类型的值，`size_t`是`sizeof`返回的类型(C99) </br> 示例：`"%zd"`、`"%12zd"` |

| 整数类型/type  | 十进制/dec  | 八进制/octal | 十六进制/hex   |       |
| :---: | :---: | :---: | :---: | :---: |
| `(signed) short (int)`     | %hd  | %(#)ho  | %(#)hx  | 有符号类型 |
| `(signed) int`             | %d   | %(#)o   | %(#)x   | 有符号类型 |
| `(signed) long (int)`      | %ld  | %(#)lo  | %(#)lx  | 有符号类型 |
| `(signed) long long (int)` | %lld | %(#)llo | %(#)llx | 有符号类型 |
| `unsigned short (int)`     | %hu  |         |         | 无符号类型 |
| `unsigned (int)`           | %u   |         |         | 无符号类型 |
| `unsigned long (int)`      | %lu  |         |         | 无符号类型 |
| `unsigned long long (int)` | %llu |         |         | 无符号类型 |
| `(signed)/unsigned char`   |      |         |         |          |
| `(signed) _Bool`           |      |         |         |          |

| 浮点数类型/type | 十进制/dec   | 指数/e计数法 | 十六进制/hex |    |
| :---: | :---: | :---: | :---: | :---: |            
| `float`       |   %f  |   %e      | %a或%A      | 至少能表达6位有效数字 |
| `double`      |   %f  |   %e      | %a或%A      | 至少能表达10位有效数字 |
| `long double` |   %Lf |   %Le     | %La        | 至少能表达10位有效数字 |

### 4.4.2 参数传递

```
...
float n1;
double n2;
long n3, n4;
...
printf("%ld %ld %ld %ld\n", n1, n2, n3, n4);
...
```
这是一种常见的参数传递方式，但是printf()函数读错了字节
首先，程序把传入的值放入被称为栈/stack的内存区域，计算机根据变量类型而不是转换说明把这些值放入栈中
然后，控制转到printf()函数，函数根据转换说明而不是变量类型从栈中读取值
结果，所读取值为n1的前半部分、n1的后半部分、n2的前半部分、n2的后半部分

### 4.4.3 scanf()函数


scanf()把输入的字符串转换成整数、浮点数、字符、字符串
printf()把整数、浮点数、字符、字符串转换成显示在屏幕上的文本

scanf()和printf()都使用格式字符串和参数列表，两个函数的主要区别在参数列表中
- printf()函数的参数列表使用变量、常量、表达式
- scanf()函数的参数列表使用指向变量的指针
	- 若用scanf()函数读取基本变量类型的值，在变量名前加上一个`&`
	- 若用scanf()函数把字符串读入字符数组中，不要使用`&`
```
/* input.c —— 何时使用& */

#include <stdio.h>
int main(void)
{
	int age;
	float assets;
	char pet[30];
	printf("%d $%.2f %s\n", age, assets, pet);
	scanf("%d %f", &age, &assets);               //基本变量类型要用&
	scanf("%s", pet);                            //字符数组不要使用&
}
return 0;
```

| 转换说明 | 含义   |
| :--: | :--: |
| %c | 把输入解释成字符 |
| %d | 把输入解释成有符号十进制整数 |
| %e %f %g %a | 把输入解释成浮点数 (C99标准新增%a) |
| %E %F %G %A | 把输入解释成浮点数 (C99标准新增%A) |
| %i | 把输入解释成有符号十进制整数 |
| %o | 把输入解释成有符号八进制整数 |
| %p | 把输入解释成指针 (地址) |
| %s | 把输入解释成字符串: 从第1个非空白字符开始到下一个空白字符之前的所有字符都是输入 |
| %u | 把输入解释成无符号十进制整数 |
| %x %X | 把输入解释成有符号十六进制整数 |

| 修饰符 | 含义   |
| :--: | :--- |
| * | 抑制赋值 ; 示例: `%*d` |
| 数字 | 最大字段宽度: 输入达到最大字段宽度处，或第1次遇到空白字符时停止 ; 示例: `%10s` |
| hh | 把整数作为`signed char`或等价于`unsigned char`类型读取 ; 示例: `%hhd` `%hhu` |
| ll | 把整数作为`long long`或`unsigned long long`类型读取 (C99) ; 示例: `%lld` `%llu` |
| h l L | `"%hd"`、`"%hi"`表明把对应的值储存为`short int`类型 <br> `"%ho"`、`"%hx"`、`"%hu"`表明把对应的值储存为`unsigned short int`类型 <br> `"ld"`、`"li"`表明把对应的值储存为`long`类型 <br> `"%lo"`、`"%lx"`、`"%lu"`表明把对应的值储存为`unsigned long`类型 <br> `"%le"`、`"%lf"`、`"%lg"`表明把对应的值储存为`double`类型 <br> 在e、f、g前面使用L而不是l，表明把对应的值储存为`long double`类型 <br> 若无修饰符，d、i、o、x表明对应的值应被储存为`int`类型，f、g表明把对应的值储存为`float`类型 |
| j | 在整型转换说明后面时，表明使用intmax_t或uintmax_t类型 （C99) ; 示例: `%jd` `%ju` |
| z | 在整型转换说明后面时，表明使用sizeof的返回类型 (C99) ; 示例: `%zd` `%zo` |
| t | 在整型转换说明后面时，表明使用表示两个指针差值的类型 (C99) ; 示例: `%td` `%tx` |


# 5 运算符、表达式和语句


# 6 C控制语句：循环


# 7 C控制语句：分支和跳转


# 8 字符输入/输出和输入验证


# 9 函数


# 10 数组和指针


# 11 字符串和字符串函数


# 12 存储类别、链接和内存管理


# 13 文件输入/输出


# 14 结构和其他数据形式


# 15 位操作


# 16 C预处理器和C库


# 17 高级数据表示

