package com.fc.service;

import com.fc.entity.Admin;
import org.springframework.stereotype.Service;

import java.util.List;

public interface AdminService {
    //登录
    Admin findByAdminName(String adminName,String adminPwd);
    int updateAdmin(Admin admin);
    //根据id查询,返回一个User
    Admin queryAdminById(int id);
    //查询
    List<Admin> queryAllAdmin();
}
