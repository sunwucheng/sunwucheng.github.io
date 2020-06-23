---
title: JavaScript
date: 2020-05-29 11:38:27
tags: 
categories: CS&EE
---

**来源: [JavaScript教程 - 廖雪峰的官方网站](https://www.liaoxuefeng.com/wiki/1022910821149312)**


## 简介

### 重要性

JavaScript是一种运行在浏览器中的解释型的编程语言
在Web世界里，只有JavaScript能跨平台、跨浏览器驱动网页，与用户交互

### 标准

ECMAScript: 一种语言标准 (ECMA, European Computer Manufacturers Association)
JavaScript: 网景公司对ECMAScript标准的一种实现


## 快速入门

### 使用

JavaScript代码可以直接嵌在网页的任何地方，不过通常我们都把JavaScript代码放到<head>中

```
<html>
<head>
  <script>
    alert('Hello, world');
  </script>
</head>
<body>
  ...
</body>
</html>
```

由<script>...</script>包含的代码就是JavaScript代码，它将直接被浏览器执行

```
<script type="text/javascript">
  ...
</script>
```

> 设置type属性没有必要，因为默认的type就是JavaScript，所以不必显式地把type指定为JavaScript

把JavaScript代码放到一个单独的.js文件中再在HTML中通过<script src="..."></script>引入

```
<html>
<head>
  <script src="/static/js/abc.js"></script>
</head>
<body>
  ...
</body>
</html>
```

这样, /static/js/abc.js就会被浏览器执行
把JavaScript代码放入一个单独的.js文件中更利于维护代码, 并且多个页面可以各自引用同一份.js文件
可以在同一个页面中引入多个.js文件，还可以在页面中多次编写<script> js代码... </script>, 浏览器按照顺序依次执行

### 运行

首要让浏览器运行JavaScript, 必须先有一个HTML页面, 在HTML页面中引入JavaScript
然后让浏览器加载该HTML页面, 就可以执行JavaScript代码

### 语法


## 数据类型和变量

### 数据类型

* Number: JavaScript不区分整数和浮点数，统一用Number表示
  + 123; // 整数123
  + 0.456; // 浮点数0.456
  + 1.2345e3; // 科学计数法表示1.2345x1000，等同于1234.5
  + -99; // 负数
  + NaN; // NaN表示Not a Number，当无法计算结果时用NaN表示
  + Infinity; // 数值超过了JavaScript的Number所能表示的最大值时，就表示为Infinity
* 字符串: 字符串是以单引号'或双引号"括起来的任意文本(''或""本身只是一种表示方式, 不包括在内)
* 布尔值: 布尔值和布尔代数的表示完全一致，一个布尔值只有true、false两种值
  + true; // 这是一个true值
  + false; // 这是一个false值
  + 2 > 1; // 这是一个true值
  + 2 >= 3; // 这是一个false值

  + true && true; // 这个&&语句计算结果为true
  + true && false; // 这个&&语句计算结果为false
  + false && true && false; // 这个&&语句计算结果为false

  + false || false; // 这个||语句计算结果为false
  + true || false; // 这个||语句计算结果为true
  + false || true || false; // 这个||语句计算结果为true

  + ! true; // 结果为false
  + ! false; // 结果为true
  + ! (2 > 5); // 结果为true

  + 2 > 5; // false
  + 5 >= 2; // true
  + 7 == 7; // true

  + false == 0; // true 会自动转换数据类型再比较
  + false === 0; // false 不会自动转换数据类型, 若数据类型不一致直接返回false

  + NaN === NaN; // false
  + isNaN(NaN); // true

  + 1 / 3 === (1 - 2 / 3); // false
  + Math.abs(1 / 3 - (1 - 2 / 3)) < 0.0000001; // true
* null和undefined
  + undefined表示值“未定义”(其实仅仅在判断函数参数是否传递的情况下有用)
  + null表示一个“空”的值 //(JavaScript)null = (Swift)nil = (Python)None
  + 0是一个数值
  + 空字符串''表示长度为0的字符串
* 数组: 数组是一组按顺序排列的集合，集合的每个值称为元素, JavaScript的数组可以包括任意数据类型
```
[1, 2, 3.14, 'Hello', null, true]; // 数组包含6个元素。数组用[]表示，元素之间用,分隔

new Array(1, 2, 3); // 创建了数组[1, 2, 3]

var arr = [1, 2, 3.14, 'Hello', null, true];
arr[0]; // 返回索引为0的元素，即1
arr[5]; // 返回索引为5的元素，即true
arr[6]; // 索引超出了范围，返回undefined
```
* 对象: JavaScript的对象是一组由键-值组成的无序集合, 键都是字符串类型，值可以是任意数据类型
```
var person = {
    name: 'Bob',
    age: 20,
    tags: ['js', 'web', 'mobile'],
    city: 'Beijing',
    hasCar: true,
    zipcode: null
};
```
> 每个键又称为对象的属性, 要获取一个对象的属性，我们用对象变量.属性名的方式
```
person.name; // 'Bob'
person.zipcode; // null
```

### 变量




















