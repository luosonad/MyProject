package com.Express.service;

import com.Express.mapper.Express_logistics_Mapper;
import com.Express.mapper.UserMapper;
import com.Express.pojo.Express;
import com.Express.pojo.User;
import com.Express.utils.SqlSessionFactoryUtils;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.util.List;

public class ExpressService {
    SqlSessionFactory factory = SqlSessionFactoryUtils.getSqlSessionFactory();
    /**
     * 查询所有
     * @return
     */
    public List<Express> selectAll(){
        //2. 获取SqlSession
        SqlSession sqlSession = factory.openSession();
        //3. 获取BrandMapper
        Express_logistics_Mapper mapper = sqlSession.getMapper(Express_logistics_Mapper.class);

        //4. 调用方法
        List<Express> expresses = mapper.selectAll();

        sqlSession.close();

        return expresses;
    }

    public Express selectByID(String number){
        SqlSession sqlSession = factory.openSession();
        //3. 获取BrandMapper
        Express_logistics_Mapper mapper = sqlSession.getMapper(Express_logistics_Mapper.class);
        //4. 调用方法
        Express express = mapper.selectByID(number);
        sqlSession.close();
        return express;
    }


    public void add(Express express){

        //2. 获取SqlSession
        SqlSession sqlSession = factory.openSession();
        //3. 获取BrandMapper
        Express_logistics_Mapper mapper = sqlSession.getMapper(Express_logistics_Mapper.class);

        //4. 调用方法
        mapper.addExpress(express);

        //提交事务
        sqlSession.commit();
        //释放资源
        sqlSession.close();
    }
    public void update(Express express){
        SqlSession sqlSession = factory.openSession();
        //3. 获取BrandMapper
        Express_logistics_Mapper mapper = sqlSession.getMapper(Express_logistics_Mapper.class);
        //4. 调用方法
        mapper.update(express);
        //提交事务
        sqlSession.commit();
        //释放资源
        sqlSession.close();
    }

    public void del(String number){
        SqlSession sqlSession = factory.openSession();
        //3. 获取BrandMapper
        Express_logistics_Mapper mapper = sqlSession.getMapper(Express_logistics_Mapper.class);
        //4. 调用方法
        mapper.del(number);
        //提交事务
        sqlSession.commit();
        //释放资源
        sqlSession.close();
    }
}
