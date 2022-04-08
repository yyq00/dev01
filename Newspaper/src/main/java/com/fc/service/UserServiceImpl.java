package com.fc.service;

import com.fc.dao.UserMapper;
import com.fc.entity.Users;
import com.github.pagehelper.PageHelper;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("UserServiceImpl")
public class UserServiceImpl implements UserService {
    private UserMapper userMapper;

    public void setUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }


    //查询所有用户
    public List<Users> queryAllUser() {
        return userMapper.queryAllUser();
    }
    //登录
    @Override
    public Users findByUsername(String userName,String userPwd) {
        return userMapper.findByUsername(userName,userPwd);
    }
    //注册
    @Override
    public int addUser(Users users) {
        return userMapper.addUser(users);
    }
    //新增
    @Override
    public int addUser2(Users users) {
        return userMapper.addUser2(users);
    }
    //查询
    @Override
    public Users queryUserByName2(String userName) {
        return userMapper.queryUserByName2(userName);
    }
    //删除
    @Override
    public int deleteUserById(int id) {
        return userMapper.deleteUserById(id);
    }
    //更新
    @Override
    public int updateUser(Users users) {
        return userMapper.updateUser(users);
    }

    @Override
    public Users queryUserById(int id) {
        return userMapper.queryUserById(id);
    }

    @Override
    public int updateUser1(Users users) {
        return userMapper.updateUser(users);
    }


//    public List<Users> list(Users users) {
//        return userMapper.list(users);
//    }

//    @Override
//    public int total() {
//        return userMapper.total();
//    }
@Override
public List<Users> listUsers(String offest, String pageSize) {
    Integer pageNum=Integer.valueOf(offest);//第几页
    Integer pagesize=Integer.valueOf(pageSize);//一页多少内容
    //调用PageHelper获取第1页，10条内容，默认查询总数count
    PageHelper.startPage(pageNum,pagesize);
    //调用CityDaoImpl 分页查询
    return userMapper.queryAllUser();
}

}

