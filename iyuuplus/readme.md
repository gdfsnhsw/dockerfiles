## 简介

本镜像测试通过以后就把代码PR到了官方仓库中：https://github.com/ledccn/IYUUPlus 

**2022年1月18日，本镜像增加了一项功能：允许用户以非root用户权限运行iyuuplus，修改PUID，PGID两个环境变量即可。未推送到官方。**

**2022年6月29日，先合并官方未合并的[#57](https://github.com/ledccn/IYUUPlus/pull/57)，本镜像已经可以用于qBittorrent 4.4.x版本转移种子了。**

## 说明

因为从php7升级到了php8，如果要使用旧的配置文件，需要作些修改工作，请从下列方式中**选择其一进行**：

- 修改配置文件夹db下的`crontab.php`和`crontab.json`，将其中的`php7`改为`php`；

- 删除配置文件夹db下的`crontab.php`和`crontab.json`，然后重新设置定时任务；

- 删除原有所有配置文件，全新创建容器。

## 创建

### docker compose
```
version: "3.8"
services:
  iyuuplus:
    image: nevinee/iyuuplus
    container_name: iyuuplus
    restart: always
    network_mode: bridge
    hostname: iyuuplus
    volumes:
      - ./db:/IYUU/db
      - /qb种子路径/:/BT_backup
      - /tr种子路径/:/torrent
    environment:
      - PUID=1000  # 以什么用记运行iyuuplus，该用户的uid
      - PGID=100   # 以什么用记运行iyuuplus，该用户的gid
    ports:
      - 8787:8787
```

### docker cli
```
docker run -d \
  --name iyuuplus \
  --hostname iyuuplus \
  --restart always \
  --network bridge \
  --volume $(pwd)/db:/IYUU/db \
  --volume /qb种子路径/:/BT_backup \
  --volume /tr种子路径/:/torrent \
  --env PUID=1000 `# 以什么用记运行iyuuplus，该用户的uid` \
  --env PGID=100  `# 以什么用记运行iyuuplus，该用户的gid` \
  --publish 8787:8787 \
  nevinee/iyuuplus
```

## 源代码、问题反馈、意见建议

全套代码见 [Github](https://github.com/devome/dockerfiles/tree/master/iyuuplus) 或 [Gitee](https://gitee.com/evine/dockerfiles/tree/master/iyuuplus)。

如有使用上的问题，或者有其他好的功能建议，请在 [Github这里](https://github.com/devome/dockerfiles/issues) 或 [Gitee这里](https://gitee.com/evine/dockerfiles/issues) 提交。
