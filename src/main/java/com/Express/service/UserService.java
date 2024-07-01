package com.Express.service;

import com.Express.mapper.UserMapper;
import com.Express.pojo.User;
import com.Express.utils.SqlSessionFactoryUtils;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.util.List;

public class UserService {
    SqlSessionFactory factory = SqlSessionFactoryUtils.getSqlSessionFactory();

    /**
     * 查询所有
     * @return
     */
    public List<User> selectAll(){
        //调用BrandMapper.selectAll()

        //2. 获取SqlSession
        SqlSession sqlSession = factory.openSession();
        //3. 获取BrandMapper
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);

        //4. 调用方法
        List<User> users = mapper.selectAll();

        sqlSession.close();

        return users;
    }

    /**
     * 添加快递
     * @param user
     * @return
     */
    public int insertUser(User user){
        SqlSession sqlSession = factory.openSession();
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        int i = mapper.insertUser(user);
        sqlSession.commit();
        sqlSession.close();
        return i;
    }

    public void del(String userAcc){
        SqlSession sqlSession = factory.openSession();
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        mapper.del(userAcc);
        sqlSession.commit();
        sqlSession.close();
    }
}
