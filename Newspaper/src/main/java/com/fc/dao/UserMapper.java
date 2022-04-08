package com.fc.dao;

import com.fc.entity.Users;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {
    //查询全部Users,返回list集合
    List<Users> queryAllUser();
    //用户登录
    Users findByUsername(@Param("userName")String userName,@Param("userPwd")String userPwd);
    //用户注册
    int addUser(Users users);
    //增加一个Admin
    int addUser2(Users users);
    //根据用户名查询用户
    Users queryUserByName2(@Param("userName")String userName);
    //删除
    int deleteUserById(@Param("userID") int id);
    //更新
    int updateUser(Users users);

    Users queryUserById(@Param("userID")int id);

//    public List<Users> list(Users users);
//    public int total();

}
