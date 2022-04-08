package com.fc.service;

import com.fc.entity.Users;

import java.util.List;

public interface UserService {
    //查询
    List<Users> queryAllUser();
    //登录
    Users findByUsername(String userName,String userPwd);
    //注册
    int addUser(Users users);
    //增加一个Admin
    int addUser2(Users users);
    //根据用户名查询用户
    Users queryUserByName2(String userName);
    //删除
    int deleteUserById(int id);
    //更新
    int updateUser(Users users);
    //根据id查询,返回一个User
    Users queryUserById(int id);

//    //根据name查询,返回一个User
//    Users zhang(String userName);


//    int total();
//    List<Users> list(Users users);
    int updateUser1(Users users);
    //根据id查询,返回一个User
//分页查询
    List<Users> listUsers(String pageNum,String pageSize);
}
