# 垃圾回收APP（ArkUI版）

## 项目概述
本项目是一个面向大学生作业的垃圾回收主题APP，基于HarmonyOS ArkTS开发前端应用，搭配Python Flask后端服务，实现了用户管理、商品交互、签到等核心功能。项目采用前后端分离架构，通过HTTP接口实现数据交互，后端连接MySQL数据库进行数据持久化存储。

## 功能亮点
- 用户体系：支持注册、登录功能，维护用户状态
- 商品交互：包含购物车、收藏、搜索功能
- 特色功能：每日签到、限时兑换（支持兑换人数实时更新）
- 数据存储：所有用户操作和商品信息均持久化到数据库


## 项目结构

### 前端（ArkUI应用）
```
rubbish/
└── rubbish/
    └── entry/
        └── src/
            └── main/
                └── ets/
                    ├── pages/                # 所有页面
                    │   ├── ZhuCePage.ets    # 注册页面
                    │   ├── Denglu.ets       # 登录页面
                    │   ├── Index.ets        # 首页
                    │   ├── Gouwuche.ets     # 购物车页面
                    │   ├── Shoucang.ets     # 收藏页面
                    │   ├── Qiandao.ets      # 签到页面
                    │   └── Xianshi.ets      # 限时兑换页面等等还有未列出的
                    ├── utils/               # 工具类
                    │   ├── ApiService.ets   # 接口请求封装
                    │   └── HttpUtils.ets    # HTTP工具
                    └── App.ets             # 应用入口
```

### 后端（Flask服务）
```
rubbishPY/
└── app.py                 # 后端主文件，包含所有接口实现
    ├── 核心接口：登录/注册/购物车/收藏/搜索/签到/限时兑换
    ├── 数据库连接配置
    └── 跨域支持与服务启动
```


## 技术栈

### 前端
- **HarmonyOS ArkTS**：基于TypeScript的声明式UI框架，用于构建跨设备应用
- **UI组件**：使用ArkUI提供的基础组件（Button、Text、Image等）和容器组件（Column、Row、List等）
- **网络请求**：`@ohos.net.http`模块实现HTTP接口调用
- **状态管理**：使用`@State`装饰器管理组件状态，`AppStorage`管理全局状态

### 后端
- **Python 3.7+**：编程语言
- **Flask 2.3.3**：轻量级Web框架，处理HTTP请求
- **Flask-CORS 4.0.0**：解决跨域资源共享问题
- **MySQL**：关系型数据库，存储用户、商品、订单等数据
- **pymysql**：Python连接MySQL的驱动


## 快速开始

### 环境准备
1. **前端**：
   - DevEco Studio 4.0+
   - HarmonyOS SDK 9+
   - Node.js 16+

2. **后端**：
   - Python 3.7+
   - 依赖安装：
     ```bash
     pip install flask flask-cors pymysql
     ```
   - MySQL 5.7+


### 配置修改
1. **后端配置（app.py）**：
   ```python
   # 数据库连接配置
   def get_db_connection():
       return pymysql.connect(
           host='你的IPv4地址',  # 替换为本地IPv4（如192.168.xxx.xxx）
           user='root',        # 数据库用户名
           password='你的密码',  # 数据库密码
           database='rubbish', # 数据库名称
           port=3306,          # 数据库端口（默认3306）
           charset='utf8'
       )

   # 服务启动配置
   if __name__ == '__main__':
       app.run(host='0.0.0.0', port=8080, debug=True)  # 端口可自定义
   ```

2. **前端配置（所有页面）**：
   所有涉及后端请求的页面（如登录、购物车等），需将请求URL中的IP和端口修改为后端服务的配置：
   ```typescript
   // 示例：登录页面的请求URL
   let url = `http://你的IPv4地址:8080/api/login`;  // 与后端host和port保持一致
   ```


### 启动步骤
1. **启动数据库**：确保MySQL服务已启动，并创建名为`rubbish`的数据库（可通过SQL脚本初始化表结构）。
2. **启动后端**：
   ```bash
   cd rubbishPY
   python app.py
   ```
3. **启动前端**：在DevEco Studio中打开前端项目，连接HarmonyOS模拟器或真实设备，点击运行按钮。


## 核心功能接口说明
| 功能         | 接口地址                  | 方法  | 说明                     |
|--------------|---------------------------|-------|--------------------------|
| 用户登录     | `/api/login`              | POST  | 验证用户账号密码         |
| 用户注册     | `/api/register`           | POST  | 创建新用户账号           |
| 添加购物车   | `/api/cart/add`           | POST  | 将商品加入购物车         |
| 添加收藏     | `/api/collect/add`        | POST  | 收藏商品                 |
| 商品搜索     | `/api/search`             | GET   | 根据关键词搜索商品       |
| 每日签到     | `/api/user/{id}/check-in` | POST  | 记录用户签到状态         |
| 限时兑换     | `/api/exchange`           | POST  | 兑换商品，更新兑换人数   |


## 备注
- 前端页面设计参考了[AxureShop作品](https://www.axureshop.com/ys/1048045)，非常精美好看，如需完整设计可前往购买。
- 项目为学习练习作品，如有侵权请联系：3131534429@qq.com
- 适合用于大学生作业参考，可根据需求扩展更多功能（如订单管理、垃圾分类指南等）。
