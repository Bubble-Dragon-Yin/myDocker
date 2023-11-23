# Docker 入门

## Quick Start

* Docker official website https://hub.docker.com/

* Tutorial document https://b11et3un53m.feishu.cn/wiki/MWQIw4Zvhil0I5ktPHwcoqZdnec

 check docker version

```HTML
docker -v
```

 check docker working status

```HTML
docker images

/* REPOSITORY   TAG       IMAGE ID   CREATED   SIZE */

```

## 部署mysql

```HTML
docker run -d \
   --name mysql \
   -p 3306:3306 \
   -e TZ=Asia/Shanghai \
   -e MYSQL_ROOT_PASSWORD=12345678 \
   mysql

/* latest: Pulling from library/mysql
e39ec8f010eb: Pull complete 
e2b7fadc33ec: Pull complete 
9d193449aafd: Pull complete 
6ea497c74b15: Pull complete 
7778acbf55f3: Pull complete 
a633e58f9669: Pull complete 
edd3047f9b4b: Pull complete 
70ae0c334fe1: Pull complete 
b139fc79e81c: Pull complete 
6956b492354c: Pull complete */

// deploy mysql02 

docker run -d \
   --name mysql02 \
   -p 3307:3306 \
   -e TZ=Asia/Shanghai \
   -e MYSQL_ROOT_PASSWORD=12345678 \
   mysql
```

 check if MySQL deployed already

```HTML
docker ps
```

## Docker 工作原理

![docker](/Volumes/MyDisk/Tutorial-imgs/docker.png)

## 常用命令

![02常用命令](/Users/laurence/Desktop/02常用命令.png)

## Exercise

1 拉取安装nginx镜像到docker

```HTML
// 没有版本号表示安装最新版本
docker pull nginx
```

2 查看是否安装成功

```HTML
docker images
```

3 将nginx打包成tar或是zip镜像文件到本地

```HTML
docker save --help
```

4 docker save ||-o || 镜像文件 || 镜像版本||

```HTML
docker save -o nginx.tar nginx:latest
```

5 查看新保存的镜像文件

```HTML
ll
```

6 删除景象 docker|| rmi || 镜像版本

```HTML
docker rmi nginx:latest
```

7 再次查看nginx 

```HTML
docker images 
```

8 因为镜像已经生成，所以删除nginx不影响，再次输入ll 来查看nginx.tar镜像是否存在？

```HTML
ll
```

9 加载镜像

```HTML
docker load --help
```

10 docker load || -i || 镜像文件

```HTML
docker load -i nginx.tar
```

11 将镜像运行到容器

```HTML
docker run -d --name nginx -p 80:80 nginx
```

12 查看容器是否被运行

```HTML
docker ps
```

13  停掉nginx 

```HTML
docker stop nginx
```

14 查看日志

```HTML
docker logs nginx
```

15 进入容器内部 exit 退出

```HTML
docker exec -it nginx bash
```

16 进入mysql容器

```HTML
docker exec -it mysql bash
```

17 输入用户名和密码来操作mysql

```HTML
mysql -u root -p

show databases;
```

18  删除mysql2容器，先停止进程再删除

```HTML
docker stop mysql02

docker images

docker rm mysql02
```

19 简化docker ps 输出格式化

```HTML
vi /root/.bashrc
// 1 e / i 编辑 
// 2 插入 : alias dps='docker ps --format "table {{.ID}}\t{{.Image}}\t{{.Ports}}\t{{.Status}}\t{{.Names}}"'
alias dis='docker images'
//3 退出 :wq
//4 执行更改： source /root/.bashrc

```

## 数据卷挂载 volume 

1 进入nginx 内部

```HTML
docker exec -it ngnix bash
```

2 访问nginx 主页面内容

```dockerfile
cd /usr/share/nginx/html
ls
```

![ 数据卷](/Users/laurence/Desktop/ 数据卷.png)