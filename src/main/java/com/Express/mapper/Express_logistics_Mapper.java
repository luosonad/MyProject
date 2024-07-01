package com.Express.mapper;

import com.Express.pojo.Express;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface Express_logistics_Mapper {
    //查询用户所有的快递
    @Select("select * from express")
    List<Express> selectAll();
    @Select("select * from express where number= #{number}")
    Express selectByID(String number);
    @Insert("insert into express (number, name, pieces, senderName, senderTele, reciAcc ,reciName, reciTele, reciArea) " +
            "values (#{number}, #{name}, #{pieces}, #{senderName}, #{senderTele}, #{reciAcc}, #{reciName},#{reciTele},#{reciArea})")
    int addExpress(Express express);
    @Update("update express set name=#{name},pieces=#{pieces},senderName=#{senderName},senderTele=#{senderTele},reciName=#{reciName},reciTele=#{reciTele},reciArea=#{reciArea} where number=#{number}")
    void update(Express express);
    @Delete("delete from express where number=#{number}")
    void del(String number);
}
