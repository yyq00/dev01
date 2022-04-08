package com.fc.service;

import com.fc.dao.AdminMapper;
import com.fc.entity.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("AdminServiceImpl")
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminMapper adminMapper;
    public void setAdminMapper(AdminMapper adminMapper) {
        this.adminMapper = adminMapper;
    }
    //登录验证
    @Override
    public Admin findByAdminName(String adminName, String adminPwd) {
        return adminMapper.findByAdminName(adminName,adminPwd);
    }

    @Override
    public int updateAdmin(Admin admin) {
        return adminMapper.updateAdmin(admin);
    }

    @Override
    public Admin queryAdminById(int id) {
        return adminMapper.queryAdminById(id);
    }

    @Override
    public List<Admin> queryAllAdmin() {
        return adminMapper.queryAllAdmin();
    }

}
