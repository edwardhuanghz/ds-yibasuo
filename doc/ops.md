# 常见运维操作

[返回首页](../../../)

### 启动

启动集群所有角色（后端，前端，nginx，zookeeper）。

```
ansible-playbook start.yml
```

单独启动后端。

```
ansible-playbook start.yml -t backend
```


单独启动前端。

```
ansible-playbook start.yml -t front
```


单独启动zookeeper集群。

```
ansible-playbook start.yml -t zookeeper
```


---

### 停止

停止集群所有角色（后端，前端，nginx，zookeeper）。

```
ansible-playbook stop.yml`
```

单独停止后端。

```
ansible-playbook stop.yml -t backend
```


单独停止前端。
```
ansible-playbook stop.yml -t front
```

单独停止zookeeper集群。
```
ansible-playbook stop.yml -t zookeeper
```