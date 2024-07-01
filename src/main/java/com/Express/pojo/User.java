package com.Express.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class User{
    private String userName;    //用户名
    private String userAccount;     //账号
    private String passWord;    //密码
    private String IDNumber;    //身份证号
    private String realName;        //姓名
    private String telephoneNumber;     //电话号码

}
