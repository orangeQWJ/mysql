# docker-compose.yml

这段配置是一个 Docker Compose 文件，版本 3.0，用于定义和运行多个 Docker 容器的应用程序。具体来说，这里配置了一个名为`mysql8`的服务，它基于`mysql:8.0`镜像运行 MySQL 数据库服务器。以下是详细解释：

### 版本

- `version: "3.0"`: 指定了使用的 Docker Compose 文件格式版本是 3.0。版本号影响可用的配置选项和行为。

### 服务

- `services`: 下面定义的是 Docker Compose 文件中的服务列表。

### mysql8 服务

- `image: mysql:8.0`: 指定使用的 Docker 镜像是`mysql`的 8.0 版本。这意味着将会从 Docker Hub 下载 MySQL 8.0 版本的官方镜像。
- `restart: always`: 设置容器总是重启。这确保了在 Docker 守护进程启动时，或者容器退出时，容器将会被自动重启。
- `command`: 用于定制容器启动时执行的命令。这里添加了三个参数来配置 MySQL 服务器：
  - `--default_authentication_plugin=mysql_native_password`: 设置默认的身份验证插件为`mysql_native_password`。MySQL 8.0 引入了新的默认身份验证插件`caching_sha2_password`，但一些客户端可能不支持这个新插件，所以这里使用了旧的插件以确保兼容性。
  - `--binlog-format=ROW`: 设置二进制日志格式为`ROW`，这对于复制和某些类型的恢复操作是必要的。
  - `--server-id=1`: 设置服务器 ID 为 1。在 MySQL 复制配置中，每个服务器必须有唯一的 ID。
- `environment`: 设置环境变量。
  - `MYSQL_ROOT_PASSWORD: root`: 设置 MySQL root 用户的密码为`root`。
- `volumes`: 定义数据卷，用于数据持久化和配置。
  - `./mysql_scripts:/docker-entrypoint-initdb.d/`: 将宿主机的`./mysql_scripts`目录挂载到容器的`/docker-entrypoint-initdb.d/`目录。MySQL 容器会在初始化时执行该目录下的所有`.sql`、`.sh`和`.sql.gz`文件，这常用于数据库的初始化。
- `ports`: 映射端口。
  - `"13316:3306"`: 将容器的 3306 端口映射到宿主机的 13316 端口。这意味着可以通过宿主机的 13316 端口访问 MySQL 服务器。

总的来说，这个 Docker Compose 配置定义了一个 MySQL 8.0 服务器的容器，配置了身份验证插件、二进制日志格式、服务器 ID，设置了 root 密码，指定了初始化脚本的位置，并映射了端口以便外部访问。

# 创建运行环境
```bash
docker-compose up -d
```
# 销毁
```bash
docker-compose down
```



