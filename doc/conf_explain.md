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


## 其他的（other）

这里就简单了，除了主要的配置以外，其他的全为other。已经为用户准备好在ds-yibasuo项目的conf目录中了，目录结构与ds一致，用户只需要去修改你感兴趣的部分即可。

但是在配置时，我是不知道该怎么配置这些变量才`合理`，或者叫`合适`。

下面就对这些配置讲解，让用户知道配置的真正含义。

## 配置讲解

### [conf/common/hadoop/hadoop.properties] hadoop或者存储相关的配置

| 名字 | 解释 |
| --- | --- |
|fs.defaultFS|如果resUploadStartupType为HDFS，defaultFS写namenode地址，支持HA,需要将core-site.xml和hdfs-site.xml放到conf目录下。如果是S3，则写S3地址，比如说：s3a://escheduler，注意，一定要创建根目录/escheduler|
|fs.s3a.endpoint|如果配置了S3，需要填写S3的地址， 例如：http://192.168.199.91:9010|
|fs.s3a.access.key|如果配置了S3，需要填写S3的账号， 例如：*******|
|fs.s3a.secret.key|如果配置了S3，需要填写S3的密码， 例如：*******|
|yarn.resourcemanager.ha.rm.ids|resourcemanager HA配置，如果是单resourcemanager,这里为yarnHaIps=""|
|yarn.application.status.address|如果是单 resourcemanager,只需要配置一个主机名称,如果是resourcemanager HA,则默认配置就好|