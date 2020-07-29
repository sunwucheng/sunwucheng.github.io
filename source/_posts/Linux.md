---
title: Linux
date: 2020-04-29 12:34:27
tags: 
categories: CS&EE
---

**来源: [Linux就该这么学](https://www.linuxprobe.com)**


# 0 咱们先来谈谈学习方法和红帽系统

## 0.3 开源共享精神

![](http://www.ruanyifeng.com/blogimg/asset/201105/free_software_licenses.png)

* GNU GPL (GNU General Public License)
* BSD (Berkeley Software Distribution)
* Apache (Apache License Version)
* MPL (Mozilla Public License)
* MIT (Massachusetts Institute of Technology)


# 1 部署虚拟环境安装linux系统

## 1.4 重置root用户密码

```
# cat /etc/redhat-release     //确定是否为RHEL 7系统
Red Hat Enterprise Linux Server release 7.0 (Maipo)
# reboot                      //重启系统
e                             //重启Linux系统主机并出现引导界面时，按下键盘上的e键进入内核编辑界面
↑↓←→                          //在linux16参数这行的 最后面 追加“rd.break”参数

Ctrl + X                      //组合键运行修改过的内核程序，大约30秒过后，进入到系统的紧急求援模式
mount -o remount,rw /sysroot
chroot /sysroot
passwd
touch /.autorelabel
exit
reboot
```

## 1.5 RPM (Red-Hat Package Manager) 红帽软件包管理器 

RPM = 源代码 + 安装规则

| 常用命令 | 对应命令格式 |
| :-----: | :----- |
| 安装软件 | rpm -ivh filename.rpm |
| 升级软件 | rpm -Uvh filename.rpm |
| 卸载软件 | rpm -e filename.rpm   |
| 查询软件描述信息    | rpm -qpi filename.rpm |
| 列出软件文件信息    | rpm -qpl filename.rpm |
| 查询文件属于哪个RPM | rpm -qf filename      |

## 1.6 YUM软件仓库 (Yellow dog Updater, Modified)

YUM = (源代码 + 安装规则) * N

| 命令 | 作用 |
| :--------------------- | :---------------------: |
| yum repolist all        | 列出所有仓库              | 
| yum list all            | 列出仓库中所有软件包       |
| yum info 软件包名称       | 查看软件包信息            |
| yum install 软件包名称    | 安装软件包               |
| yum reinstall 软件包名称  | 重新安装软件包            |
| yum update 软件包名称     | 升级软件包               |
| yum remove 软件包名称     | 移除软件包               |
| yum clean all           | 清除所有仓库缓存           |
| yum check-update        | 检查可更新的软件包         |
| yum grouplist           | 查看系统中已经安装的软件包组 |
| yum groupinstall 软件包组 | 安装指定的软件包组         |
| yum groupremove 软件包组  | 移除指定的软件包组         |
| yum groupinfo 软件包组    | 查询指定的软件包组信息     |

## 1.7 Systemd初始化进程

Linux操作系统的开机过程: BIOS -> Boot Loader -> 加载系统内核 -> 内核进行初始化 -> 启动初始化进程
红帽RHEL 7系统已经替换掉了熟悉的初始化进程服务System V init，正式采用全新的systemd初始化进程服务
Linux系统启动时的初始化工作可看作一个个单元(Unit)，systemd用目标(target)代替System V init中运行级别的概念

| System V init 运行级别 | Systemd 目标名称 | 作用 |
| :-------: | :---------------------------------- | :-----------: |
| 0         | runlevel0.target, poweroff.target   | 关机           |
| 1	        | runlevel1.target, rescue.target	  | 单用户模式      |
| 2	        | runlevel2.target, multi-user.target | 等同于级别3     |
| 3	        | runlevel3.target, multi-user.target | 多用户的文本界面 |
| 4	        | runlevel4.target, multi-user.target | 等同于级别3     |
| 5	        | runlevel5.target, graphical.target  | 多用户的图形界面 |
| 6	        | runlevel6.target, reboot.target     | 重启           |
| emergency | emergency.target	                  | 紧急Shell      |

```
/* 目录系统默认运行目标改为“多用户无图形”模式可用ln命令把多用户模式目标文件连接到/etc/systemd/system/ */
# ln -sf /lib/systemd/system/multi-user.target /etc/systemd/system/default.target
```

| System V init (RHEL6) | systemctl (RHEL7) | 作用 |
| :------------------ | :-------------------------------- | :-----: |
| service foo start	  | **systemctl start foo.service**   | 启动服务 |
| service foo restart |	**systemctl restart foo.service** | 重启服务 |
| service foo stop	  | **systemctl stop foo.service**    | 停止服务 |
| service foo reload  | systemctl reload foo.service      | 重新加载配置文件(不终止服务) |
| service foo status  | **systemctl status foo.service**  | 查看服务状态 |
| chkconfig foo on    | **systemctl enable foo.service**  | 开机自动启动 |
| chkconfig foo off   | systemctl disable foo.service     | 开机不自动启动 |
| chkconfig foo	      | systemctl is-enabled foo.service  | 查看特定服务是否为开机自启动 |
| chkconfig --list    | systemctl list-unit-files --type=service | 查看各级别下服务的启动禁用情况 |

* systemd = 服务名称
* systemctl = 配置工具


# 2 新手必须掌握的[Linux命令](https://www.linuxcool.com/)

## 2.1 强大好用的SHELL

计算机硬件通常由运算器、控制器、存储器、输入/输出设备等共同组成，系统内核让各硬件设备各司其职且协同运行
Linux系统内核负责对硬件资源分配、调度等管理任务，建议用户基于系统调用接口开发出的程序或服务来管理计算机
Users ⇦**Shell**⇨ Procedure & Service { System Call Interface [ Kernel ( Hardware ) ] }
Shell(终端/壳)充当人与内核/硬件之间的翻译官，主流Linux系统默认终端为**Bash**(Bourne-Again SHell)解释器

## 2.2 执行查看帮助命令

Linux命令的格式: 命令名称 [命令参数] [命令对象]

* 命令参数: 可以用长格式(完整的选项名称`man --help`)，也可以用短格式(单个字母的缩写`man -h`)
* 命令对象: 一般是指要处理的文件、目录、用户等资源

|          |          |
| :------: | :------: |
| man | `man [命令]`查看命令的帮助信息 |

| 按键 | 用处 |
| :-------: | :------: | 
| 空格键     | 向下翻一页 |
| PaGe down | 向下翻一页 |
| PaGe up   | 向上翻一页 |
| home      | 直接前往首页 |
| end       | 直接前往尾页 |
| /         | 从上至下搜索某个关键词，如`/linux` |
| ?         | 从下至上搜索某个关键词，如`?linux` |
| n         | 定位到下一个搜索到的关键词         |
| N         | 定位到上一个搜索到的关键词         |
| q         | 退出帮助文档 |

| 结构名称 | 代表意义 |
| :---------: | :----------------: |
| NAME        | 命令的名称           |
| SYNOPSIS    | 参数的大致使用方法    |
| DESCRIPTION | 介绍说明             |
| EXAMPLES    | 演示(附带简单说明)    |
| OVERVIEW    | 概述                |
| DEFAULTS    | 默认的功能           |         
| OPTIONS     | 具体的可用选项(带介绍) |
| ENVIRONMENT | 环境变量             |
| FILES       | 用到的文件           |
| SEE ALSO    | 相关的资料           |
| HISTORY     | 维护历史与联系方式     |

## 2.3 常用系统工作命令

|          |          |
| :------: | :------: |
| echo     | 在终端输出字符串或变量提取后的值，格式为`echo [字符串]`/`[$变量]` |
| date     | 显示及设置系统的时间或日期，格式为`date [选项] [+指定的格式]` |
| reboot   | 重启系统，其格式为`reboot` |
| poweroff | 关闭系统，其格式为`poweroff` |
| wget     | 在终端中下载网络文件，格式为`wget [参数] 下载地址` |
| ps       | 查看系统中的进程状态，格式为`ps [参数]` |
| top      | 动态地监视进程活动与系统负载等信息，其格式为`top` |
| pidof    | 查询某个指定服务进程的PID值，格式为`pidof [参数] [服务名称]` |
| kill     | 终止某个指定PID的服务进程，格式为`kill [参数] [进程PID]` |
| killall  | 终止某个指定名称的服务所对应的全部进程，格式为`killall [参数] [服务名称]` |

## 2.4 系统状态检测命令

|           |          |
| :-------: | :------- |
| ifconfig  | 用于获取网卡配置与网络状态等信息，格式为`ifconfig [网络设备] [参数]` |
| uname     | 查看系统内核与系统版本等信息，格式为`uname [-a]` |
| uptime    | 查看系统的负载信息，格式为`uptime` |
| free      | 显示当前系统中内存的使用量信息，格式为`free [-h]` |
| who       | 查看当前登入主机的用户终端信息，格式为`who [参数]` |
| last      | 查看所有系统的登录记录，格式为`last [参数]` |
| history   | 显示历史执行过的命令，格式为`history [-c]` |
| sosreport | 收集系统配置及架构信息并输出诊断文档，格式为`sosreport` |

## 2.5 工作目录切换命令

|      |      |
| :--: | :--- |
| pwd  | 显示用户当前所处的工作目录，格式为`pwd [选项]` |
| cd   | 切换工作路径，格式为`cd [目录名称]` |
| ls   | 显示目录中的文件信息，格式为`ls [选项] [文件]` |

* `cd .` 切换到当前目录
* `cd ..` 切换到上一级目录
* `cd`或`cd ~` 切换到该用户家目录
* `cd -` 切换到上一次目录
* `ls -a` 看到全部文件（包括隐藏文件）
* `ls -l` 查看文件的属性、大小等详细信息
* `ls -ld [目录名称]` 查看目录属性信息

## 2.6 文本文件编辑命令

|      |      |
| :--: | :--- |
| cat  | 查看纯文本文件(内容较少的)，格式为`cat [选项] [文件]` |
| more | 查看纯文本文件(内容较多的)，格式为`more [选项] [文件]` |
| head | 查看纯文本文档的前N行，格式为`head [选项] [文件]` |
| tail | 查看纯文本文档的后N行或持续刷新内容，格式为`tail [选项] [文件]` |
| tr   | 替换文本文件中的字符，格式为`tr [原始字符] [目标字符]` |
| wc   | 统计指定文本的行数、字数、字节数，格式为`wc [参数] 文本` |
| stat | 查看文件的具体存储信息和时间等信息，格式为`stat 文件名称` |
| cut  | 按列提取文本字符，格式为`cut [参数] 文本` |
| diff | 比较多个文本文件的差异，格式为`diff [参数] 文件` |

## 2.7 文件目录管理命令

|       |       |
| :---: | :---- |
| touch | 创建空白文件或设置文件的时间，格式为`touch [选项] [文件]` |
| mkdir | 创建空白的目录，格式为`mkdir [选项] 目录` |
| cp    | 复制文件或目录，格式为`cp [选项] 源文件 目标文件` |
| mv    | 剪切文件或将文件重命名，格式为`mv [选项] 源文件 [目标路径|目标文件名]` |
| rm    | 删除文件或目录，格式为`rm [选项] 文件` |
| dd    | 按照指定大小和个数的数据块来复制文件或转换文件，格式为`dd [参数]` |
| file  | 查看文件的类型，格式为`file 文件名` |

## 2.8 打包压缩与搜索命令

|      |      |
| :--: | :--- |
| tar  | 对文件进行打包压缩或解压，格式为`tar [选项] [文件]` |
| grep | 在文本中执行关键词搜索，并显示匹配的结果，格式为`grep [选项] [文件]` |
| find | 按照指定条件来查找文件，格式为`find [查找路径] 寻找条件 操作` |


# 3 管道符、重定向与环境变量。







# 4 Vim编辑器与Shell命令脚本。







# 5 用户身份与文件权限。







# 6 存储结构与磁盘划分






# 7 使用RAID与LVM磁盘阵列技术







# 8 Iptables与Firewalld防火墙







# 9 使用ssh服务管理远程主机






# 10 使用Apache服务部署静态网站







# 11 使用Vsftpd服务传输文件






# 12 使用Samba或NFS实现文件共享






# 13 使用Bind提供域名解析服务







# 14 使用DHCP动态管理主机地址







# 15 使用Postfix与Dovecot部署邮件系统






# 16 使用Squid部署代理缓存服务






# 17 使用iSCSI服务部署网络存储







# 18 使用MariaDB数据库管理系统






# 19 使用PXE+Kickstart无人值守安装服务





# 20 使用LNMP架构部署动态网站环境







