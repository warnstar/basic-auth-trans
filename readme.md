# kong网关
> kong源码地址：https://github.com/Mashape/kong.git
## 插件 basic-auth-trans
> 此插件用于校验请求头中的token，并设置校验结果到请求头中

## 部署
1. 使用docker-compose构建
2. 文件配置
    - 'kong_defaults.lua'
        - 首要是pg-db
    - 'docker-compose.yml'
    - 存放ssl证书
3. 进入kong容器，进行数据库迁移：kong migrations up
4. 重新运行kong容器