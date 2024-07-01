package com.Express.web;

import com.Express.pojo.Express;
import com.Express.pojo.User;
import com.Express.service.ExpressService;
import com.Express.service.UserService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/UserLogin")
public class UserServlet extends HttpServlet {
    ExpressService expressService = new ExpressService();
    UserService userService = new UserService();
    List<User> users;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if(action.equals("loGin")){
            loGin(req,resp);
        }else if(action.equals("signLn")){
            singLn(req,resp);
        }else if(action.equals("delete")){
            delete(req,resp);
        }
    }

    private void delete(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        HttpSession session = req.getSession();
        String userAccount = (String) session.getAttribute("userAccount");
        System.out.println("userAcc=" + userAccount);
        List<Express> allService = expressService.selectAll();
        for (Express express: allService) {
            if(express.getReciAcc().equals(userAccount)){
                expressService.del(express.getNumber());
            }
        }
        userService.del(userAccount);
        resp.sendRedirect("userLogin.jsp");
    }

    private void singLn(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        User user = new User();
        user.setUserName(req.getParameter("userName"));
        user.setUserAccount(req.getParameter("userAccount"));
        user.setPassWord(req.getParameter("userPassWord"));
        user.setIDNumber(req.getParameter("IDNumber"));
        user.setRealName(req.getParameter("realName"));
        user.setTelephoneNumber(req.getParameter("telephoneNumber"));
        int i = userService.insertUser(user);
        users = userService.selectAll();
        if(i > 0){
            resp.sendRedirect("userLogin.jsp");

        }else{
            resp.sendRedirect("userSignln.jsp");
        }
    }

    private void loGin(HttpServletRequest req , HttpServletResponse resp) throws IOException, ServletException {
        boolean ishave = false;
        // 获取用户输入的账号密码
        String userAccount = req.getParameter("userAccount");
        String passWord = req.getParameter("passWord");
        users = userService.selectAll();
        for (User user: users) {
            if (user.getUserAccount().equals(userAccount) && user.getPassWord().equals(passWord)) {

                // 登录成功后存储账号和密码到会话对象中
                HttpSession session = req.getSession();
                session.setAttribute("userAccount", userAccount);
                session.setAttribute("userName",user.getUserName());
                resp.sendRedirect("/Express/ExpressServlet?action=read&person=user");
                ishave = true;
                break;
            }
        }
        if(!ishave){
            req.getSession().setAttribute("UserLoginError", "账号或密码错误，请重试。");
            resp.sendRedirect("userLogin.jsp");
        }
    }
}
