# 配置解释

## 概述

DolphinScheduler 所有配置的详细解释。在介绍前请大家先来理解这一点。

> ds-yibasuo项目将DolphinScheduler所有的配置，分成了两类。 
>
> 主要的（main），必须要进行配置的。
>
> 其他的（other），暂时不需要配置。

为什么这么分呢？因为DolphinScheduler的分布式特性，又有前后端，qz，db等多个角色。所以不管怎么去调整，需要配置的总会有那么7、8个。
与其去对配置做瘦身，不如告诉用户配置的优先级。

哪些的安装必须要配置的，哪些是不必须的可以暂时使用默认值的。而且还有一点官方在配置上面是没有一些常见的例子，比如我要配置`QQ邮箱作为我的邮件告警`
没有对这方面有过配置经验的用户，确实很容易配置错误。

终上所述，我将配置分成了两类，首先我先介绍 `主要的（main）` 的配置：

## 主要的（main）

我的想法很简单，ds-yibasuo项目中的`inventory.ini`和`hosts.ini`即为主要配置，是安装时必须要配置的。

里面需要配置的内容主要为6大类：
* ds安装的各个角色ip
* host名字定义
* ds版本
* 安装目录
* 安装用户
* 数据库（类型，库户，账号密码）

虽然看上去主要的配置稍微有点多，但是90%的部分都是在描述你的集群角色分布，这些的配置是不会带来用户配置的难度。因为用户是需要明确知道我的集群内角色是怎么分布的，所以这里配置多一点，是会对集群架构描述带来好处的。

## 主要的（main）配置详细讲解

| 名字 | 解释 |
| --- | --- |
| servers | 所有的服务器信息，ip名，host名 |
| db_servers | db准备装在哪个节点上，建议这里只配置1个 |
| zookeeper_servers | zk的服务器信息，需要添加对应的myid，节点数建议是奇数 |
| master_servers | master的服务器信息 |
| worker_servers | worker的服务器信息 |
| api_servers | api的服务器信息，建议这里只配置1个 |
| alert_servers | alert的服务器信息，建议这里只配置1个 |
| nginx_servers | nginx的服务器信息，放网页的地方，建议这里只配置1个 |
| dolphinscheduler_version | ds的版本信息，只能从1.2.0开始配置，不能低于此版本 |
| deploy_dir | ds的部署目录 |
| ansible_user | 操作的用户，建议使用`easy` |
| db_type | 数据库的类型，支持mysql和postgresql |
| db_name | ds的库名 |
| db_username | ds的账号 |
| db_password | ds的密码 |

## 其他的（other）

这里就简单了，除了主要的配置以外，其他的全为other。已经为用户准备好在ds-yibasuo项目的conf目录中了，目录结构与ds一致，用户只需要去修改你感兴趣的部分即可。

但是在配置时，我是不知道该怎么配置这些变量才`合理`，或者叫`合适`。

下面就对这些配置讲解，让用户知道配置的真正含义。

## 其他的（other）配置详细讲解

### [conf/common/hadoop/hadoop.properties] hadoop或者存储相关的配置
| 名字 | 解释 |
| --- | --- |
|fs.defaultFS|如果resUploadStartupType为HDFS，defaultFS写namenode地址，支持HA,需要将core-site.xml和hdfs-site.xml放到conf目录下。如果是S3，则写S3地址，比如说：s3a://escheduler，注意，一定要创建根目录/escheduler|
|fs.s3a.endpoint|如果配置了S3，需要填写S3的地址， 例如：http://192.168.199.91:9010|
|fs.s3a.access.key|如果配置了S3，需要填写S3的账号， 例如：*******|
|fs.s3a.secret.key|如果配置了S3，需要填写S3的密码， 例如：*******|
|yarn.resourcemanager.ha.rm.ids|resourcemanager HA配置，如果是单resourcemanager,这里为yarnHaIps=""|
|yarn.application.status.address|如果是单 resourcemanager,只需要配置一个主机名称,如果是resourcemanager HA,则默认配置就好|

### [conf/common/common.properties]  ds的公共配置
| 名字 | 解释 |
| --- | --- |
| dolphinscheduler.queue.impl | ds工作队列，默认是在zk中，这一项不建议修改 | 
| data.basedir.path | 执行程序的路径，例如：/tmp/dolphinscheduler |
| data.download.basedir.path | 下载的路径，例如：/tmp/dolphinscheduler/download |
| process.exec.basepath | 进程执行目录。自我配置，请确保目录存在并且具有读写权限，例如：/tmp/dolphinscheduler/exec |
| hdfs.root.user | 操作hdfs的用户。例如：hdfs |
| data.store2hdfs.basepath | 资源中心的存储目录。例如：/dolphinscheduler |
| res.upload.startup.type | 资源中心的类型。目前支持的有： HDFS,S3,NONE |
| hadoop.security.authentication.startup.state | 是否开启kerberos，默认不开启 |
| java.security.krb5.conf.path | krb5的配置文件路径，例如：/opt/krb5.conf |
| login.user.keytab.username ||
| login.user.keytab.path ||
| dolphinscheduler.env.path | ds全局环境变量配置，记录着ds所需要的所有角色的环境变量。例如：/opt/.dolphinscheduler_env.sh |
| resource.view.suffixs | 资源中心支持的文件后缀名，例如：txt,log,sh,conf,cfg,py,java,sql,hql,xml |
| development.state | 开发模式，默认不开启 |

### [conf/zookeeper.properties] zookeeper的配置
| 名字 | 解释 |
| --- | --- |
| zookeeper.quorum | zk的地址，例如：192.168.220.188:2181 |
| zookeeper.dolphinscheduler.root | ds在zk中的工作目录，例如：zookeeper.dolphinscheduler.root |
| zookeeper.dolphinscheduler.dead.servers | 用来记录挂掉机器的zk目录，例如：/dolphinscheduler/dead-servers |
| zookeeper.dolphinscheduler.masters | master目录，例如：/dolphinscheduler/masters |
| zookeeper.dolphinscheduler.workers | worker目录，例如：/dolphinscheduler/workers |
| zookeeper.dolphinscheduler.lock.masters | master的分布式锁  |
| zookeeper.dolphinscheduler.lock.workers | worker的分布式锁 |
| zookeeper.dolphinscheduler.lock.failover.masters | master的容错分布式锁 |
| zookeeper.dolphinscheduler.lock.failover.workers | worker的容错分布式锁 |
| zookeeper.dolphinscheduler.lock.failover.startup.masters | master启动容错分布式锁 |
| zookeeper.session.timeout | session 超时 |
| zookeeper.connection.timeout | 连接超时 |
| zookeeper.retry.sleep | 重试间隔 |
| zookeeper.retry.maxtime | 重试最大次数 |