# 离线安装

[返回首页](../../../)

主要是把ds-yibasuo 和 安装需要的包先自己在有网络的地方下载好。让后把这些包拷贝到你需要安装的集群中即可。

先把ds-yibasuo的包解压到你的指定目录，把其他的包放在ds-yibasuo的resources/pkg目录。

后续安装时跳过 `ansible-playbook dancer.yml` 这一步。

下载的时候 请把 ` # 替换成 . `。  
下载的时候 请把 ` # 替换成 . `。  
下载的时候 请把 ` # 替换成 . `。  
下载的时候 请把 ` # 替换成 . `。  
下载的时候 请把 ` # 替换成 . `。  

---

ds-yibasuo

github#com/feloxx/ds-yibasuo/archive/master#zip

---

ds

dist#apache#org/repos/dist/dev/incubator/dolphinscheduler/1#2#0/apache-dolphinscheduler-incubating-1#2#0-dolphinscheduler-backend-bin#tar#gz

dist#apache#org/repos/dist/dev/incubator/dolphinscheduler/1#2#0/apache-dolphinscheduler-incubating-1#2#0-dolphinscheduler-front-bin#tar#gz

---

zookeeper

mirrors#tuna#tsinghua#edu#cn/apache/zookeeper/zookeeper-3#4#14/zookeeper-3#4#14#tar#gz

---

jdk

github#com/AdoptOpenJDK/openjdk8-binaries/releases/download/jdk8u232-b09/OpenJDK8U-jdk_x64_linux_hotspot_8u232b09#tar#gz

请把jdk下载后的包，名字修改成 jdk8u232-b09.tar.gz

---

mysql

cdn#mysql#com/Downloads/MySQL-5#7/mysql-5#7#28-linux-glibc2#12-x86_64#tar#gz

repo1#maven#org/maven2/mysql/mysql-connector-java/5#1#48/mysql-connector-java-5#1#48#jar

---

nginx

nginx#org/download/nginx-1#10#3#tar#gz
