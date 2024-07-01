## 目录

一：引言…………………………………………………………………….1

1. 项目背景
2. 项目目的
3. 项目范围

二：需求分析………………………………………………………………

1. 用户需求
2. 功能需求
3. 系统用例图
4. 系统需求规格说明
5. 6大属性（可靠性，安全性，实时性，易用性，易维护性，可升级性及扩充能力）

三：系统设计

1. 业务流程分析

2. 系统架构

3. 数据库设计

4. 界面设计

5. 系统模块设计

   - 用户管理

   - 订单管理

   - 管理员管理

四：系统实现

开发准备（开发环境，技术选型，开发工具）

1. 创建项目

2. 准备需要的相关的配置

   - 调整webapp下的WEB-INF目录下的web.xml

   - 添加相关的maven依赖在pom.xml中

   - 在resources包下创建一个mybatis-config.xml文件

3. 数据库的设计和实现

   - SQL语句创建

   - 在表中添加一些测试数据  

创建页面

- 创建用户和管理员的登录界面
- 创建管理员和用户的注册界面
- 创建登录后显示的主界面

使用三层架构编写后端程序

五：系统运行管理和维护

- 系统运行情况
- 系统资源管理
- 系统维护管理

六：系统评价

- 系统性能评价
- 系统管理评价
- 系统功能评价

七：总结

## 引言

#### 项目背景

​		随着电子商务和全球化贸易的发展，物流行业面临着巨大的市场需求。物流管理系统可以帮助企业提高物流效率，降低成本，提升竞争力。信息技术的不断进步为物流管理系统的实施提供了技术支持，如物流跟踪系统、仓储管理系统、运输管理系统等，可以实现物流过程的自动化和智能化。物流成本在企业运营中占据重要地位，通过物流管理系统可以实现对物流成本的有效控制和管理，提高企业的盈利能力。市场竞争日益激烈，企业需要提高物流效率和服务质量，物流管理系统可以帮助企业快速响应市场需求，提升客户满意度。物流活动对环境造成的影响越来越受到关注，物流管理系统可以帮助企业优化物流路线，减少能源消耗和排放，实现可持续发展。

#### 项目目的

1. 提高物流运作效率：通过自动化和优化物流流程，提高货物运输、仓储和配送的效率，降低物流成本。
2. 提升服务质量：通过实时跟踪货物位置、提供准确的交货时间等功能，提升客户满意度和服务质量。
3. 降低库存成本：通过精准的库存管理和需求预测，减少库存积压和过剩，降低库存成本。
4. 提高信息透明度：通过信息化管理，实现货物、订单、车辆等信息的实时监控和共享，提高信息透明度和管理效率。
5. 优化资源利用：通过智能调度和路线优化，最大限度地利用运输资源，降低能源消耗和环境影响。

#### 项目范围

1. **供应链管理**：物流管理系统在供应链管理中起着关键作用，帮助企业优化供应链的各个环节，包括供应商管理、库存管理、订单处理、运输和配送等。
2. **仓储管理**：物流管理系统可以用于优化仓库内部的操作，包括货物接收、存储、拣选和装运，帮助提高仓库的效率和准确性。
3. **运输管理**：涵盖运输路线优化、运输成本控制、运输安排和跟踪等功能，帮助企业降低运输成本，提高运输效率。
4. **订单管理**：包括订单处理、库存分配、订单跟踪和交付管理，确保订单能够准时、准确地送达客户手中。
5. **跨境电商和国际物流**：特别适用于跨境电商企业，处理国际运输、关务申报和跨境物流等复杂流程。
6. **数据分析和报告**：通过收集和分析各个环节的数据，提供决策支持和业务洞察，帮助企业优化运营和制定战略。

## 需求分析

#### 用户需求：

​		订单管理模块应能够支持订单的创建、查看、编辑和取消，并能实时跟踪订单状态。其次，库存管理模块需要实时监控库存进出和位置，并生成详尽的库存变化报告。运输管理方面，系统需具备优化运输路线、选择最佳运输方式（如陆运、海运、空运）、计算运输成本和实时更新运输状态的能力。配送和路线优化功能应根据订单和库存位置优化配送路线，确保效率和成本最优化。报告和分析模块则需要生成库存报告、运输成本分析和订单处理时间等报告，支持业务决策和优化。此外，系统需具备用户权限管理和数据安全保障功能，确保不同用户仅能访问其权限范围内的信息。界面设计应简洁清晰，操作逻辑合理，便于用户快速上手。最后，系统最好能与财务系统、ERP系统等其他业务系统实现集成，实现信息的互通共享。综上所述，一个功能完善、操作便捷、全面管理物流过程的系统是理想的设计目标。

#### 功能需求：

1. 用户的登录以及注册和注销
2. 管理员的登录以及注册和注销
3. 用户和管理员都能对他们所管理的对应的物流件进行增删改查

#### 系统用例图：

![物流管理系统用例图](D:\java\javaProject\Express-demo\报告书上内的图片\物流管理系统用例图.png)

#### 系统需求规格说明：

- 有用户，管理员，物流件三个类
- 用户有用户名，登录账号，登录密码，身份证号，姓名，电话号码的属性
- 管理员要有管理员编号（用于登录时输入的账号），密码，该管理员的电话号码的属性
- 物流件要有快递单号，物品名称，物品的件数，寄件人的姓名，电话，收件人的账号，姓名，号码，以及收件地址。

#### 6大属性：

##### 可靠性：

-  **可用性**：99.9%的可用性。

##### **安全性：**

- **数据安全**： 使用明文。
- **访问控制**：用户只能访问和他同账号的物流件，管理员可以访问所有的物流件。
-  **身份认证与授权**：登录时判断时用户还是管理员登录。

##### 实时性：

- **响应快：**进行数据的操作后能立即在数据库及表现层得到反馈。

##### 易用性：

- **操作性强**：界面简单易懂，不花哨。

##### 易维护性：

- **易管理**：代码结构清晰、模块化设计。

##### **可升级性及扩充能力**：

​	**易升级和扩充**：各个模块高内聚，低耦合。

## 系统设计

##### 业务流程分析

​	**用户：**

1. 用户登录到主界面，查看自己名下的物流件
2. 选择是否对物流件进行增删改查
3. 操作完毕后选择是退出系统还是注销账号

​	**管理员：**

1. 管理员登录到主界面，可以查看数据库中所有的物流件
2. 如果有需要修改的，可以对其进行修改
3. 修改完成后选择退出系统或者注销账号

##### 系统架构

​	**MVC架构：**

​	MVC，即 Model 模型、View 视图，及 Controller 控制器。

​	View：视图，为用户提供使用界面，与用户直接进行交互。
​	Model：模型，承载数据，并对用户提交请求进行计算的模块。其分为两类，一类称为	数据承载 Bean，一类称为业务处理 Bean。所谓数据承载 Bean 是指实体类，专门用户	承载业务数据的，如 Student，User 等.而业务处理 Bean 则是指 Service 或 Dao 对象， 	专门用于处理用户提交请求的。
​	Controller：控制器，用于将用户请求转发给相应的 Model 进行处理，并根据 Model 的	计算结果向用户提供相应响应。

##### 数据库设计

数据库使用mySQL数据库，使用navicat17进行可视化编辑。数据库版本8.4.0。

端口号3306。

​	

##### 界面设计

用户登录界面，实现输入账号，密码登录账号。并可以对未拥有账号的用户实现注册功能，还有对输入错账号或密码的用户及时有一个反馈。

管理员登录界面，实现输入管理员编号和密码来登录管理员账号，对新添加的管理员有一个新建管理员账户功能，如果输错账号或密码会有及时的错误信息反馈。

主界面，展示了与登录账号符合权限的物流信息，并可以对其进行增删查改，也给一个让登录账号者一个可以选择退出或者注销账号的一个选择。

##### 系统模块设计

用户：用户名（userName） 用户登录账号（userAccount） 用户密码（password）

​           用户身份证号(ID_number) 用户姓名(real_name) 用户号码（telephoneNumber）

管理员：管理员账号(ID)  管理员密码(password) 管理员电话号码(telephoneNumber)

物流件：快递单号(number)  物品名称(name)  数量(pieces)  寄件人姓名(SerderName)

​                寄件人电话(senderTele)  收件人账号(ReciAcc)  收件人姓名(ReciName)  

​                收件人号码(ReciTele)  收件地址(ReciArea)

## 系统实现

### 开发准备

##### 创建项目

1. 首先点击new-->project
2. 选择Maven Archetype
3. 填写项目名Express-demo，存放的地址, 选择jdk版本为17
4. Archetype选择org.apache.maven.archetypes:maven-archetype-webapp（最后一项）
5. 点击创建

##### 准备需要的相关配置

​	**调整webapp下的WEB-INF目录下的web.xml**

```
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns="http://xmlns.jcp.org/xml/ns/javaee"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee http://xmlns.jcp.org/xml/ns/javaee/web-app_4_0.xsd"
         version="4.0">
</web-app>
```

**添加相关的maven依赖在pom.xml中**

```XML
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 https://maven.apache.org/maven-v4_0_0.xsd">
  <modelVersion>4.0.0</modelVersion>
  <groupId>org.example</groupId>
  <artifactId>Express-demo</artifactId>
  <packaging>war</packaging>
  <version>1.0-SNAPSHOT</version>
  <name>Express-demo Maven Webapp</name>
  <url>https://maven.apache.org</url>
  <dependencies>
    <dependency>
      <groupId>junit</groupId>
      <artifactId>junit</artifactId>
      <version>3.8.1</version>
      <scope>test</scope>
    </dependency>
    <dependency>
      <groupId>jakarta.servlet</groupId>
      <artifactId>jakarta.servlet-api</artifactId>
      <version>6.0.0</version>
    </dependency>
    <dependency>
      <groupId>jakarta.servlet.jsp.jstl</groupId>
      <artifactId>jakarta.servlet.jsp.jstl-api</artifactId>
      <version>3.0.0</version>
    </dependency>
    <dependency>
      <groupId>org.glassfish.web</groupId>
      <artifactId>jakarta.servlet.jsp.jstl</artifactId>
      <version>2.0.0</version>
    </dependency>

    <dependency>
      <groupId>org.apache.taglibs</groupId>
      <artifactId>taglibs-standard-spec</artifactId>
      <version>1.2.5</version>
    </dependency>
    <dependency>
      <groupId>org.mybatis</groupId>
      <artifactId>mybatis</artifactId>
      <version>3.5.6</version>
    </dependency>
    <dependency>
      <groupId>mysql</groupId>
      <artifactId>mysql-connector-java</artifactId>
      <version>8.0.28</version>
    </dependency>
    <dependency>
      <groupId>org.projectlombok</groupId>
      <artifactId>lombok</artifactId>
      <version>1.18.32</version>
      <scope>compile</scope>
    </dependency>
  </dependencies>
  <build>
    <finalName>Express-demo</finalName>
  </build>
</project>
```

**在resources包下创建一个mybatis-config.xml文件用于连接数据库**

```XML
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE configuration
        PUBLIC "-//mybatis.org//DTD Config 3.0//EN"
        "http://mybatis.org/dtd/mybatis-3-config.dtd">

<!--核心配置文件-->
<configuration>
    <environments default="development">
        <environment id="development">
            <transactionManager type="JDBC"/>
            <dataSource type="POOLED">
                <property name="driver" value="com.mysql.cj.jdbc.Driver"/>
                <property name="url" value="jdbc:mysql://localhost:3306/express_logistics"/>
                <property name="username" value="root"/>
                <property name="password" value="1234"/>
            </dataSource>
        </environment>
    </environments>

    <!--  关联xml配置的文件  -->
    <mappers>
        <mapper class="com.Express.mapper.UserMapper" />
        <mapper class="com.Express.mapper.Express_logistics_Mapper" />
        <mapper class="com.Express.mapper.AdminMapper" />
    </mappers>
</configuration>
```

##### 数据库的设计和实现

**数据库名称：**express_logistics

​	**数据库表：**

- 管理员表：administrator
- 用户表：user
- 物流件表：express

​	**创建表**：

​		管理员表：

```sql
create table administrator
(
    ID  varchar(6)   not null comment '管理员编号' primary key,
    password  varchar(255) not null comment '管理员账号登录密码',
    telephone_number varchar(11)  not null comment '管理员电话号码'
);
```

​		用户表：

```sql
create table user
(
    userName varchar(255) not null comment '用户名',
    userAccount varchar(255) not null comment '用户登录账号'
        primary key,
    password  varchar(255) not null comment '用户密码',
    ID_number varchar(255) not null comment '用户身份证号',
    real_name varchar(255) not null comment '用户姓名',
    telephoneNumber varchar(11)  not null comment '用户号码'
);
```

​		物流件表：

```sql
create table express
(
    number  varchar(255) not null comment '快递单号' primary key,
    name  varchar(255) not null comment '快递物品名称',
    pieces  int  not null comment '快递物品件数',
    SenderName varchar(255) not null comment '寄件人姓名',
    senderTele varchar(11)  not null comment '寄件人电话',
    ReciAcc    varchar(255) not null comment '收件人账号',
    ReciName   varchar(255) not null comment '收件人姓名',
    ReciTele   varchar(11)  not null comment '收件人号码',
    ReciArea   varchar(255) not null comment '收件地址',
    constraint ReciAcc
        foreign key (ReciAcc) references user (userAccount)
);
```

​		给各个表增加几个测试数据：

​		添加三个管理员数据

```sql
insert into administrator (ID,password, telephone_number)
        values ('001','123456','13255914685')
        
insert into administrator (ID,password, telephone_number)
        values ('002','123456','15681626584')
        
insert into administrator (ID,password, telephone_number)
        values ('003','123456','48498484977')        
```

​		添加三个用户数据

```
insert into user (userName, userAccount, passWord, ID_number, real_name, telephoneNumber)
       values ('小王', '111111', '111111', '11'}, '11','11')
       
insert into user (userName, userAccount, passWord, ID_number, real_name, telephoneNumber)
       values ('小李', '222222', '222222', '22'}, '22','22')
       
insert into user (userName, userAccount, passWord, ID_number, real_name, telephoneNumber)
       values ('小赵', '333333', '333333', '33'}, '33','33')
```

​	添加三个物流件分别属于这三个用户

```
insert into express (number, name, pieces, senderName, senderTele, reciAcc ,reciName, reciTele, reciArea)
        values ('1001', '苹果', '20','发货方', '12546186489', '111111', '小王','11','地球村65号')
        
insert into express (number, name, pieces, senderName, senderTele, reciAcc ,reciName, reciTele, reciArea)
        values ('1002', '李子', '50','发货方', '12546186489', '222222', '小李','22','火星村42号')
        
insert into express (number, name, pieces, senderName, senderTele, reciAcc ,reciName, reciTele, reciArea)
        values ('1003', '西瓜', '3','发货方', '12546186489', '333333', '小赵','33','太阳村85号')
```

在navicat里面检查表和数据是否正确

### 创建页面

##### 创建用户和管理员的登录界面

**用户登录**

```jsp
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>用户登录</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f2f2f2;
            background-image: url(images/登录背景.jpg);
            background-size: cover;
        }
        .container {
            margin: auto;
            max-width: 400px;
            background-color: rgba(255, 255, 255, 0.4);
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
        }
        form {
            margin-top: 20px;
        }
        label {
            display: block;
            margin-bottom: 5px;
        }
        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            border-radius: 3px;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            color: #fff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        a {
            display: block;
            text-align: center;
            margin-top: 10px;
            text-decoration: none;
            color: blue;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>用户登录</h2>
    <form action="UserLogin?action=loGin" method="post">
        <label for="userAccount">用户名:</label>
        <input type="text" id="userAccount" name="userAccount" required><br><br>
        <label for="passWord">密码:</label>
        <input type="password" id="passWord" name="passWord" required><br><br>
        <input type="submit" value="登录">
        <a href="./userSignln.jsp">还没有账号? 注册</a>
    </form>
    <a href="./AdminLogin.jsp">切换为管理者登录</a>
    <% String loginError = (String) session.getAttribute("UserLoginError"); %>
    <% if (loginError != null) { %>
    <p style="color: red;"><%= loginError %></p>
    <% } %>

</div>
</body>
</html>
```

**管理员登录**

```jsp
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员登录</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f2f2f2;
            background-image: url(images/登录背景.jpg);
            background-size: cover;
        }
        .container {
            margin: auto;
            max-width: 400px;
            background-color: rgba(255, 255, 255, 0.4);
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
        }
        form {
            margin-top: 20px;
        }
        label {
            display: block;
            margin-bottom: 5px;
        }
        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            border-radius: 3px;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            color: #fff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        a {
            display: block;
            text-align: center;
            margin-top: 10px;
            text-decoration: none;
            color: blue;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>管理员登录</h2>
    <form action="AdminServlet?action=loGin" method="post">
        <label for="ID">ID:</label>
        <input type="text" id="ID" name="ID" required><br><br>
        <label for="password">密码:</label>
        <input type="password" id="password" name="password" required><br><br>
        <input type="submit" value="登录">
        <a href="./userLogin.jsp">切换为用户登录</a>
        <a href="./AdminSignln.jsp">还没有账号? 注册</a>
    </form>
    <% String loginError = (String) session.getAttribute("AdminLoginError"); %>
    <% if (loginError != null) { %>
    <p style="color: red;"><%= loginError %></p>
    <% } %>
</div>
</body>
</html>
```

**用户注册**

```jsp
<%--
  Created by IntelliJ IDEA.
  User: 鲁伟杰
  Date: 2024/5/30
  Time: 18:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>用户注册</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f2f2f2;
            background-image: url(images/登录背景.jpg);
            background-size: cover;
        }
        .container {
            margin: auto;
            max-width: 400px;
            background-color: rgba(255, 255, 255, 0.4);
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
        }
        form {
            margin-top: 20px;
        }
        label {
            display: block;
            margin-bottom: 5px;
        }
        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            border-radius: 3px;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            color: #fff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        a {
            display: block;
            text-align: center;
            margin-top: 10px;
            text-decoration: none;
            color: blue;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>用户注册</h2>
    <form action="UserLogin?action=signLn" method="post">
        <label for="userName">用户名:</label>
        <input type="text" id="userName" name="userName" required><br><br>
        <label for="userAccount">账号:</label>
        <input type="text" id="userAccount" name="userAccount" required><br><br>
        <label for="userPassWord">密码:</label>
        <input type="password" id="userPassWord" name="userPassWord" required><br><br>
        <label for="IDNumber">身份证号:</label>
        <input type="text" id="IDNumber" name="IDNumber" required><br><br>
        <label for="realName">姓名:</label>
        <input type="text" id="realName" name="realName" required><br><br>
        <label for="telephoneNumber">电话号码:</label>
        <input type="text" id="telephoneNumber" name="telephoneNumber" required><br><br>
        <input type="submit" value="注册">
    </form>
    <a href="./userLogin.jsp">已有账号? 去登录</a>
</div>
</body>
</html>
```

管理员注册

```jsp
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员登录</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f2f2f2;
            background-image: url(images/登录背景.jpg);
            background-size: cover;
        }
        .container {
            margin: auto;
            max-width: 400px;
            background-color: rgba(255, 255, 255, 0.4);
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
        }
        form {
            margin-top: 20px;
        }
        label {
            display: block;
            margin-bottom: 5px;
        }
        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            border-radius: 3px;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            color: #fff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        a {
            display: block;
            text-align: center;
            margin-top: 10px;
            text-decoration: none;
            color: blue;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>管理员登录</h2>
    <form action="AdminServlet?action=loGin" method="post">
        <label for="ID">ID:</label>
        <input type="text" id="ID" name="ID" required><br><br>
        <label for="password">密码:</label>
        <input type="password" id="password" name="password" required><br><br>
        <input type="submit" value="登录">
        <a href="./userLogin.jsp">切换为用户登录</a>
        <a href="./AdminSignln.jsp">还没有账号? 注册</a>
    </form>
    <% String loginError = (String) session.getAttribute("AdminLoginError"); %>
    <% if (loginError != null) { %>
    <p style="color: red;"><%= loginError %></p>
    <% } %>
</div>
</body>
</html>
```

##### **创建登录后显示的主界面**

```jsp
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Express List</title>
    <style>
        /* Global styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
        }

        /* Header styles */
        .header {
            background-color: #007bff;
            color: white;
            padding: 10px;
            text-align: center;
            font-size: 24px;
            margin-bottom: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        /* Container styles */
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        /* Button styles */
        .add-button {
            background-color: #007bff;
            color: white;
            border: none;
            cursor: pointer;
            padding: 10px 15px;
            font-size: 14px;
            border-radius: 5px;
            box-shadow: 0 0 8px rgba(0,0,0,0.1);
            margin-bottom: 10px;
            display: block;
            margin-left: auto;
            margin-right: auto;
        }
        .add-button:hover {
            background-color: #0056b3;
        }

        /* Popup styles */
        .popup {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 80%;
            max-width: 600px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            z-index: 1000;
        }
        .popup table {
            border-collapse: collapse;
            width: 100%;
        }
        .popup th, .popup td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }
        .popup input[type="text"], .popup input[type="submit"], .popup button {
            width: calc(100% - 16px);
            padding: 8px;
            margin: 6px 0;
            border: 1px solid #ccc;
            border-radius: 3px;
            box-sizing: border-box;
            font-size: 14px;
        }
        .popup input[type="submit"], .popup button {
            background-color: #007bff;
            color: white;
            border: none;
            cursor: pointer;
            padding: 10px 15px;
            font-size: 14px;
            border-radius: 3px;
        }
        .popup input[type="submit"]:hover, .popup button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<div class="header">
    Express List
    <button onclick="showSettingsPopup()">设置</button>
</div>

<div class="container">
    <!-- Popup container for settings -->
    <div id="settingsPopup" class="popup">
        <h2>设置</h2>
        <button onclick="window.location.href='./userLogin.jsp'" >退出</button>
        <button onclick="logout()">注销</button>
    </div>


    <!-- Popup container for adding new content -->
    <div id="addPopup" class="popup">
        <h2>添加新内容</h2>
        <form action="ExpressServlet?action=add&person=${person}" method="post">
            <table>
                <tr>
                    <td>订单编号</td>
                    <td><input type="text" name="number" required></td>
                </tr>
                <tr>
                    <td>商品名称</td>
                    <td><input type="text" name="name" required></td>
                </tr>
                <tr>
                    <td>价格</td>
                    <td><input type="text" name="pieces" required></td>
                </tr>
                <tr>
                    <td>发送人姓名</td>
                    <td><input type="text" name="senderName" required></td>
                </tr>
                <tr>
                    <td>发送人电话</td>
                    <td><input type="text" name="senderTele" required></td>
                </tr>
                <c:choose>
                    <c:when test="${person eq 'admin'}">
                        <tr>
                            <td>收件人账号</td>
                            <td><input type="text" name="reciAcc" required></td>
                        </tr>
                    </c:when>
                </c:choose>
                <tr>
                    <td>收件人电话</td>
                    <td><input type="text" name="reciTele" required></td>
                </tr>
                <tr>
                    <td>收件人姓名</td>
                    <td><input type="text" name="reciName" required></td>
                </tr>
                <tr>
                    <td>收件人地址</td>
                    <td><input type="text" name="reciArea" required></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="提交">
                        <button type="button" onclick="hideAddPopup()" class="add-button">取消</button>
                    </td>
                </tr>
            </table>
        </form>
    </div>

    <!-- Existing table for displaying data -->
    <table border="1" cellspacing="0" width="100%" style="margin-top: 20px;">
        <tr>
            <th>订单编号</th>
            <th>商品名称</th>
            <th>价格</th>
            <th>发送人姓名</th>
            <th>收件人电话</th>
            <th>收件人账号</th>
            <th>收件人姓名</th>
            <th>收件人手机号</th>
            <th>收件人地址</th>
            <th>操作</th>
        </tr>
        <jsp:useBean id="expressList" scope="request" type="java.util.List"/>
        <c:forEach items="${expressList}" var="express" varStatus="status">
            <tr align="center">
                <td>${express.number}</td>
                <td>${express.name}</td>
                <td>${express.pieces}</td>
                <td>${express.senderName}</td>
                <td>${express.senderTele}</td>
                <td>${express.reciAcc}</td>
                <td>${express.reciName}</td>
                <td>${express.reciTele}</td>
                <td>${express.reciArea}</td>
                <td><a href="/Express/ExpressServlet?action=showUpdate&number=${express.number}&person=${person}">修改</a> <a href="/Express/ExpressServlet?action=delete&number=${express.number}&person=${person}">删除</a></td>
            </tr>
        </c:forEach>
    </table>
    <div onclick="showAddPopup()"><button>添加</button></div>
</div>

<script>
    function showAddPopup() {
        var addPopup = document.getElementById("addPopup");
        addPopup.style.display = "block";
    }

    function hideAddPopup() {
        var addPopup = document.getElementById("addPopup");
        addPopup.style.display = "none";
    }

    function showSettingsPopup() {
        var settingsPopup = document.getElementById("settingsPopup");
        settingsPopup.style.display = "block";
    }

    function hideSettingsPopup() {
        var settingsPopup = document.getElementById("settingsPopup");
        settingsPopup.style.display = "none";
    }

    function logout() {
        var isConfirmed = confirm('您确定要注销吗？');
        if (isConfirmed) {
            var person = "${person}"; // 获取当前用户角色（通过 JSP 页面传递过来的）
            if (person === "user") {
                window.location.href = '/Express/UserLogin?action=delete&person=user';
            } else if (person === "admin") {
                window.location.href = '/Express/AdminServlet?action=delete&person=admin';
            }
        }
    }

</script>
</body>
</html>
```

##### 使用三层架构编写后端程序

所有实体类放在pojo层，service类放在service层，接口放在mapper层，工具放在util层

servlet放在web层

## 系统运行管理和维护

##### 系统运行情况

​	系统稳定运行，未产生已知的错误，也未发现逻辑错误

##### 系统资源管理

​	系统资源由mysql数据库和tomcat服务器协同管理

##### 系统维护管理

​	本系统由某大学某专业某班某小组进行协同维护管理。

## 系统评价

##### 系统性能评价

响应速度快，有较为安全的安全性，并行效率高，系统功能基本满足客户需求

##### 系统管理评价

分区管理明显，易于分辨，可扩展性强

##### 系统功能评价

系统功能齐全，还有自己的创意，界面简洁易操作，反馈明显

## 总结

物流管理系统是通过有效的信息流和物流流程优化，实现供应链各环节的协调与管理的关键工具。它涵盖了订单处理、库存管理等多个方面，通过技术手段提高运作效率、降低成本，并确保货物按时、按量、按质地达到目的地，从而满足客户需求，提升企业竞争力。