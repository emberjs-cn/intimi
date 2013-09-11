## Intimi

Intimi作为一个Ember.js的示例应用而诞生，主要提供基于短信、彩信和邮件通知的功能。

缺省账号：

  用户名：intimi，密码：123456

### 开发说明

#### 流程与规范

参见[DEVELOPMENT.md](https://github.com/emberjs-cn/intimi/blob/develop/DEVELOPMENT.md)

#### 环境搭建

1. 安装Ruby（推荐使用RVM或rbenv进行安装）

1. 安装Compass

  ```bash
  gem install compass
  ```

1. 安装工具

  ```bash
  npm install -g bower grunt-cli
  ```

1. 安装依赖

  ```bash
  # 安装grunt依赖
  npm install

  # 安装bower依赖
  bower install
  ```

1. 启动服务

  ```bash
  grunt server
  ```

1. 运行测试

  ```bash
  grunt test
  ```
