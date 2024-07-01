package com.Express.mapper;

import com.Express.pojo.User;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;


public interface UserMapper {
    @Select("select * from user ")
    List<User> selectAll();

    @Insert("insert into user (userName, userAccount, passWord, ID_number, real_name, telephoneNumber) " +
            "values (#{userName}, #{userAccount}, #{passWord}, #{IDNumber}, #{realName}, #{telephoneNumber})")
    int insertUser(User user);

    @Delete("delete from user where userAccount =#{userAcc}")
    void del(String suerAcc);
}
