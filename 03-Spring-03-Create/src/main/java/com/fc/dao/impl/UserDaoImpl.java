package com.fc.dao.impl;

import com.fc.dao.UserDao;

public class UserDaoImpl implements UserDao {
   private String sqlSession;
    @Override
    public void add(){
        System.out.println("sqlSession调用方法，添加了一个新用户。。。");
    }
    public UserDaoImpl() {
    }
    //添加一个有参构造
    public UserDaoImpl(String sqlSession) {
        this.sqlSession = sqlSession;
    }
}
