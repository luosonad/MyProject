package com.Express.mapper;

import com.Express.pojo.Administrator;
import com.Express.pojo.User;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;


public interface AdminMapper {
    @Select("select * from administrator ")
    List<Administrator> selectAll();

    @Insert("insert into administrator (ID,password, telephone_number) " +
            "values (#{ID},#{password},#{telephoneNumber})")
    int insertAdmin(Administrator administrator);

    @Delete("delete from administrator where ID=#{ID}")
    void delete(String ID);
}
