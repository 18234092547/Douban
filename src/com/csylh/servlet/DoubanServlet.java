package com.csylh.servlet;

import com.csylh.dao.DoubanDao;
import com.csylh.entity.Doubanc;
import net.sf.json.JSONArray;


import javax.servlet.ServletException;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;


public class DoubanServlet extends javax.servlet.http.HttpServlet {

    //把我们的dao对象声明成属性，便于后面初始化使用
    private DoubanDao doubanDao;
    @Override
    public void init() throws ServletException{
        //初始化
        doubanDao = new DoubanDao();
    }

    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        //调用初始化对象的方法，该方法返回一个集合，我们用定义列表doubancList来收取这个集合的值
        List<Doubanc> doubancList=doubanDao.getDoubancList();
//        request.setAttribute("doubancList",doubancList);
        response.setContentType("text/html;charset=utf-8");
        //把列表转换为json格式的数据
        JSONArray json=JSONArray.fromObject(doubancList);
        //使用输出流进行数据的输出
        PrintWriter writer =response.getWriter();
        writer.println(json);
        writer.flush();
        writer.close();


//        request.getRequestDispatcher("/.jsp").forward(request,response);
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
            doPost(request,response);
    }
}
