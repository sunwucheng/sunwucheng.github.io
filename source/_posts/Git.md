---
title: Git
date: 2020-04-24 00:08:45
tags: 
categories: CS&EE
---

**来源: [Git教程 - 廖雪峰的官方网站](https://www.liaoxuefeng.com/wiki/896043488029600)**

## 安装Git
```Ubuntu
$ sudo apt-get install git
```

## 创建版本库/仓库
版本库/仓库相当于一个目录, 目录中所有文件修改、删除都可被Git追踪和管理
工作区working directory ⊃ 版本库repository ⊃ 暂存区stage + 分支master(⊃HEAD)  
```
$ mkdir git-repository       //创建版本库
$ cd git-repository          //转到版本库
$ git init                   //初始化版本库
/* 初始化后, 目录中生成了一个.git目录, 它用来跟踪管理此版本库 */
```

## 版本库文件操作
```
$ vim XXX.txt                //创建并编辑文件
$ git add XXX.txt            //添加文件到仓库
$ git commit -m "add XXX"    //提交添加到仓库(加备注说明)
$ git status                 //查看仓库当前状态

$ touch XXX.txt
$ vim XXX.txt              
$ git status               
/* `Changes not staged for commit`         = 工作区文件有修改待添加 */    
$ git add XXX.txt          
$ git status               
/* `Changes to be committed:`              = 缓冲区文件有添加待提交 */
$ git commit -m "add XXX"  
$ git status
/* `nothing to commit, working tree clean` = 仓库目录干净 */

$ rm XXX.txt
$ git status
/* `Changes not staged for commit`         = 工作区文件有修改待添加 */
$ git rm或add XXX.txt
$ git commit -m "remove XXX.txt"

$ vim XXX.txt 
$ git checkout -- XXX.txt    //丢弃工作区的修改, 回到最近一次commit或add时的状态
$ vim XXX.txt 
$ git add XXX.txt
$ git reset HEAD XXX.txt     //撤销(unstage)暂存区的修改, 重新放回工作区

$ git diff XXX.txt           //查看文件的修改
$ git diff HEAD -- XXX.txt   //查看工作区和版本库里面最新版本的区别

$ git log                    //显示从最近到最远的提交日志
$ git log --pretty=oneline   //显示从最近到最远的简要提交日志
$ git reset --hard HEAD^     //回退到上一个版本
$ git reset --hard HEAD~n    //往上回退n个版本
$ git reset --hard <commit>  //指定回到某个版本(根据版本号)
$ git reflog                 //查看记录的每一次命令
```

## 远程仓库
```
$ ssh-keygen -t rsa -C "youremail@example.com"  //-t(加密方式); -C(备注信息)
$ cat /Users/$USER/.ssh/id_rsa.pub
/* Github -> Account settings -> Add SSH Key -> Ctrl+V */

$ cd git-repository
$ git remote add origin git@server-name:path/repo-name.git
$ git push -u origin master                     //-u(关联本地与远程的分支)
$ vim XXX.txt;
$ git add XXX.txt
$ git commit -m "add XXX"
$ git push origin master                        

$ mkdir git-newrepository
$ cd git-newrepository
$ git clone git@server-name:path/repo-name.git
```

## 分支管理
```
step1: $ git branch dev             //创建dev分支
step2: $ git checkout dev           //转到dev分支
equal: $ git checkout -b dev        //创建并切换到新分支
equal: $ git switch -c dev          //创建并切换到新分支(新版本git提供switch切换命令)

$ git branch                        //查看当前分支
$ vim XXX.txt
$ git checkout或switch master       //转到已有master分支(新版本git提供switch切换命令)
$ cat XXX.txt
$ git merge (--no-ff -m "...") dev  //(非快速)合并指定分支到当前分支
$ cat XXX.txt
$ git branch -d dev                 //删除dev分支(快速模式在删除分支后分支信息会丢失)

$ git switch -c dev
$ vim XXX.txt
$ git add XXX.txt
$ git commit -m "in n line"         //修改XXX文件dev分支第n行
$ git switch master
$ vim XXX.txt
$ git add XXX.txt
$ git commit -m "in n line"         //修改XXX文件master分支第n行
$ git merge dev                     //合并dev分支到master分支: 无法快速合并
$ cat XXX.txt                       //可直接查看冲突内容
$ vim XXX.txt                       //修改好冲突内容
$ git add XXX.txt
$ git log --graph --pretty=oneline --abbrev-commit  //查看分支合并情况(合并图)
$ git branch -d dev                 //删除dev分支
$ git commit -m "conflict fixed"    //合并完成

$ git branch dev
$ vim XXX.txt
$ git status
$ git stash                         //把当前工作现场"储藏"起来
$ git checkout master
$ git checkout -b issue-101
$ vim readme.txt
$ git add readme.txt
$ git commit -m "fix bug 101"
$ git switch master
$ git merge --no-ff -m "merge bug fix 101"
$ git switch dev
$ git status
$ git stash list                    //查看"储藏"的工作现场
$ git stash pop 
/* = $ git stash apply + $ git stash drop; $ git stash apply stash@{0} */
$ git stash list
$ git branch
$ git cherry-pick <commit>

$ git switch -c feature             //添加新功能分支
$ git add valcan.py
$ git status
$ git commit -m "add feature vulcan"
$ git switch dev
$ git branch -d feature
$ git branch -D feature

$ cd /original-git
$ git remote (-v)
$ git push origin master
$ git push origin dev
$ cd /another-git                   //多用户分支
$ git clone git@server-name:path/repo-name.git
$ git branch
$ git checkout -b dev origin/dev
$ git add env.txt
$ git commit -m "add env"
$ git push origin dev
$ cd /original-git
$ git add env.txt
$ git commit -m "add new env"
$ git push origin dev
$ git pull
$ git branch --set-upstream-to=origin/dev dev
$ git pull
$ git commit -m "fix env conflict"

$ git rebase                        //把本地未push的分叉提交历史整理成直线
```

## 标签管理
tag就是一个让人容易记住的有意义的名字，它跟某个commit绑在一起
```
$ git branch
$ git checkout master
$ git tag <tag>                     //添加标签
$ git tag -a <tag> -m "description" <commit>
$ git tag                           //查看标签 
$ git show <tag>                    //查看某标签信息
$ git tag -d <tag>                  //删除标签
$ git push origin <tag>             //推送某标签到远程
$ git push origin --tags            //推送所有标签到远程
$ git tag -d <tag>                  //删除远程标签step1
$ git push origin :refs/tags/<tag>  //删除远程标签step2
```

## 自定义git
```
$ git config --global color.ui true //让Git显示颜色

$ git touch .gitignore              
$ vim .gitignore                    
$ git add .gitignore
$ git commit -m "add .gitignore"
$ git status
$ git add XXX.xxx
$ git add -f XXX.xxx
$ git check-ignore -v XXX.xxx

$ git config (--global) alias.xxx XXX或"XXX XXX"
/* --global参数是全局参数, 加则对电脑所有Git仓库都有用, 不加则只针对当前的仓库起作用 */

$ ssh root@xxxx.xxxx.xxxx.xxxx      //搭建Git服务器
$ sudo apt-get install git 
$ sudo adduser git
$ vim /home/git/.ssh/authorized_keys
$ cd /srv
$ sudo git init --bare sample.git
$ sudo chown -R git:git sample.git
$ vim /etc/passwd
/* git:x:1001:1001:,,,:/home/git:/bin/bash -> ...:/home/git:/usr/bin/git-shell */
$ exit
$ git clone git@server:/srv/sample.git
```

## 使用[SourceTree](https://www.sourcetreeapp.com/)