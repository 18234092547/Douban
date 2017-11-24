package com.csylh.dao;

import com.csylh.entity.Doubanc;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DoubanDao {
    public List<Doubanc> getDoubancList(){
        List<Doubanc> doubancList=new ArrayList<Doubanc>();
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet=null;


        try {
            //1.加载驱动
            Class.forName("com.mysql.jdbc.Driver");
            //2.驱动管理器获取数据库连接
            connection =DriverManager.getConnection("jdbc:mysql://localhost:3306/article","root","123456");
            //3.获取statement,执行sql
            statement = connection.createStatement();
            //4.执行sql,返回结果集
            resultSet= statement.executeQuery("select country,nums from doubanc");
            //循环解析结果集
            while (resultSet.next()){
                //定义变量来收取我们的结果集
                String country=resultSet.getString("country");
                int nums=resultSet.getInt("nums");
                //把这些数据封装到doubanc的对象里面去，
                Doubanc doubanc=new Doubanc(country,nums);
                //把上面的对象添加到集合里面去
                doubancList.add(doubanc);

            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if(resultSet!=null){
                    resultSet.close();
                }
                if(statement!=null){
                    statement.close();
                }
                if(connection!=null){
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }


        return doubancList;
    }

}
