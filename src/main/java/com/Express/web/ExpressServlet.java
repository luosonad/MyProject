package com.Express.web;



import com.Express.pojo.Express;
import com.Express.service.ExpressService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/ExpressServlet")
public class ExpressServlet extends HttpServlet {
    ExpressService expressService = new ExpressService();
    List<Express> expresses;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String number = req.getParameter("number");
        String action = req.getParameter("action");
        if ("add".equals(action)) {
            add(req, resp);
        } else if ("read".equals(action)) {
            read(req, resp);
        } else if ("showUpdate".equals(action)) {
            showUpdate(req, resp, number);
        } else if ("delete".equals(action)) {
            del(req, resp,number);
        }else if("update".equals(action)){
            update(req,resp,number);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req,resp);
    }

    private void add(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Express express = new Express();
        String acc = null;

        if (req.getParameter("person").equals("user")) {
            acc = (String) req.getSession().getAttribute("userAccount");
        }
        if(req.getParameter("person").equals("admin")){
            acc = req.getParameter("reciAcc");
            System.out.println("acc="+acc);
        }
        express.setReciAcc(acc);
        express.setNumber(req.getParameter("number"));
        express.setName(req.getParameter("name"));
        express.setPieces(req.getParameter("pieces"));
        express.setSenderName(req.getParameter("senderName"));
        express.setSenderTele(req.getParameter("senderTele"));
        express.setReciName(req.getParameter("reciName"));
        express.setReciTele(req.getParameter("reciTele"));
        express.setReciArea(req.getParameter("reciArea"));

        expressService.add(express);
        read(req, resp);
    }

    private void del(HttpServletRequest req, HttpServletResponse resp, String number) throws ServletException, IOException{
        expressService.del(number);
        read(req,resp);
    }
    private void read(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Express> allService = expressService.selectAll();
        expresses = new ArrayList<>();
        String person = req.getParameter("person");

        if ("admin".equals(person)) {
            // 如果是管理员，直接添加所有快递信息
            expresses.addAll(allService);
        } else if ("user".equals(person)) {
            // 如果是普通用户，根据用户账号筛选快递信息
            String acc = (String) req.getSession().getAttribute("userAccount");
            for (Express express : allService) {
                if (express.getReciAcc().equals(acc)) {
                    expresses.add(express);
                }
            }
        }

        // 设置请求属性
        req.setAttribute("person", person);
        req.setAttribute("expressList", expresses);

        // 转发到相应的 JSP 页面
        req.getRequestDispatcher("Express.jsp").forward(req, resp);
    }

    private void showUpdate(HttpServletRequest req, HttpServletResponse resp, String number) throws ServletException, IOException{
        Express express = expressService.selectByID(number);
        req.setAttribute("person",req.getParameter("person"));
        req.setAttribute("express", express);
        // 转发到 JSP 页面
        req.getRequestDispatcher("updateExpress.jsp").forward(req, resp);
    }
    private void update(HttpServletRequest req , HttpServletResponse resp , String number)  throws ServletException, IOException{
        Express newExpress = new Express();
        if(req.getParameter("person").equals("user")){
            String acc = (String) req.getSession().getAttribute("userAccount");
        }
        if(req.getParameter("person").equals("admin")){
            newExpress.setReciAcc(req.getParameter("reciAcc"));
        }
        newExpress.setNumber(number);
        newExpress.setName(req.getParameter("name"));
        newExpress.setPieces(req.getParameter("pieces"));
        newExpress.setSenderName(req.getParameter("senderName"));
        newExpress.setSenderTele(req.getParameter("senderTele"));
        newExpress.setReciName(req.getParameter("reciName"));
        newExpress.setReciTele(req.getParameter("reciTele"));
        newExpress.setReciArea(req.getParameter("reciArea"));
        expressService.update(newExpress);
        req.setAttribute("person",req.getParameter("person"));
        read(req,resp);
    }
}
