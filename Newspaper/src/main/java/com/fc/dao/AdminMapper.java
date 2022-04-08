package com.fc.dao;

import com.fc.entity.Admin;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AdminMapper {
    //用户登录
    Admin findByAdminName(@Param("adminName")String adminName, @Param("adminPwd")String adminPwd);


    int updateAdmin(Admin admin);

    Admin queryAdminById(@Param("adminID")int id);
    List<Admin> queryAllAdmin();
}
