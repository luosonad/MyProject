package com.Express.service;

import com.Express.mapper.AdminMapper;
import com.Express.mapper.UserMapper;
import com.Express.pojo.Administrator;
import com.Express.pojo.User;
import com.Express.utils.SqlSessionFactoryUtils;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.util.List;

public class AdminService {
    SqlSessionFactory factory = SqlSessionFactoryUtils.getSqlSessionFactory();

    /**
     * 查询所有
     * @return
     */
    public List<Administrator> selectAll(){

        //2. 获取SqlSession
        SqlSession sqlSession = factory.openSession();
        //3. 获取BrandMapper
        AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);

        //4. 调用方法
        List<Administrator> administrators = mapper.selectAll();

        sqlSession.close();

        return administrators;
    }

    /**
     * 添加快递
     * @param
     * @return
     */
    public int insertAdmin(Administrator administrator){
        SqlSession sqlSession = factory.openSession();
        AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
        int i = mapper.insertAdmin(administrator);
        sqlSession.commit();
        sqlSession.close();
        return i;
    }

    public void delete(String ID){
        SqlSession sqlSession = factory.openSession();
        AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
        mapper.delete(ID);
        sqlSession.commit();
        sqlSession.close();
    }
}
