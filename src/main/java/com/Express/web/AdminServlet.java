package com.Express.web;

import com.Express.pojo.Administrator;
import com.Express.pojo.User;
import com.Express.service.AdminService;
import com.Express.service.ExpressService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {
    List<Administrator> administrators;
    AdminService service = new AdminService();
    ExpressService expressService = new ExpressService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if(action.equals("loGin")){
            loGin(req,resp);
        }else if(action.equals("signLn")){
            signLn(req,resp);
        }else if(action.equals("delete")){
            delete(req,resp);
        }
    }

    private void delete(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        HttpSession session = req.getSession();
        String ID = (String) session.getAttribute("ID");
        List<Administrator> allAdmin = service.selectAll();
        for (Administrator administrator: allAdmin) {
            if(administrator.getID().equals(ID)){
                service.delete(ID);
            }
        }
        resp.sendRedirect("userLogin.jsp");
    }

    private void signLn(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        boolean isExist = false;
        Administrator administrator = new Administrator();
        administrator.setID(req.getParameter("ID"));
        administrator.setPassword(req.getParameter("password"));
        administrator.setTelephoneNumber(req.getParameter("TelephoneNumber"));
        System.out.println(administrator.getID());
        administrators = service.selectAll();
        // 检查管理员ID是否已经存在
        for (Administrator admin : administrators) {
            if (administrator.getID().equals(admin.getID())) {
                isExist = true;
                break; // 找到相同ID就跳出循环
            }
        }

        if (isExist) {
            req.getSession().setAttribute("AdminSignlnError", "该账号已经被注册过");
            resp.sendRedirect("AdminSignln.jsp");
        } else {
            int result = service.insertAdmin(administrator);
            resp.sendRedirect("AdminLogin.jsp");
        }
    }


    private void loGin(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        boolean ishave = false;
        // 获取用户输入的账号密码
        String ID = req.getParameter("ID");
        String password = req.getParameter("password");
        administrators = service.selectAll();
        for (Administrator administrator: administrators) {
            if (administrator.getID().equals(ID) && administrator.getPassword().equals(password)) {
                // 登录成功后存储账号和密码到会话对象中
                HttpSession session = req.getSession();
                session.setAttribute("ID", ID);
                resp.sendRedirect("/Express/ExpressServlet?action=read&person=admin");
                ishave = true;
                break;
            }
        }
        if(!ishave){
            req.getSession().setAttribute("AdminLoginError", "账号或密码错误，请重试。");
            resp.sendRedirect("AdminLogin.jsp");
        }
    }
    

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
