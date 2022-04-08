package com.fc.controller;

import com.fc.entity.Admin;
import com.fc.service.AdminService;
import com.fc.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

//@Controller 处理http请求
@Controller
@RequestMapping("/admin")
public class AdminController {
    //Controller层 调用 Service层
    //@Autowired 注解 ioc自动装配  byName byType
    //@Qualifier 和 @Autowired配合使用调用Service
    @Autowired
    @Qualifier("AdminServiceImpl")
    private AdminService adminService;
    @Autowired
    @Qualifier("UserServiceImpl")
    private UserService userService;
    //跳转到登录页
    @RequestMapping("/queryAdmin")
    public String test() {
        return "admin-index";
    }
    //管理员登陆页跳回用户登录也
    @RequestMapping("/a")
    public String a() {
        return "redirect:/index.jsp";
    }
    //登陆验证
    @RequestMapping("/addAdmin")
    public String queryAdmin(HttpSession session, String adminName, String adminPwd) {
        Admin admin = adminService.findByAdminName(adminName, adminPwd);
        List<Admin> list = new ArrayList<Admin>();
        list.add(admin);
        if (admin == null) {
            session.setAttribute("error", "用户名或密码错误");
            return "admin-index1";
        }
//        session.setAttribute("list", list);
//        List<Users> list1 = userService.queryAllUser();
//        model.addAttribute("list", list1);
        session.setAttribute("QAdmin",admin );
        return "admin-a";
    }
    @RequestMapping("/aa")
    public String a(HttpSession session){
        List<Admin> admin = adminService.queryAllAdmin();
        session.setAttribute("admin", admin);
        return "admin-list1";
    }
    //修改
//    @RequestMapping("/toUpdateAdmin")
//    public String toUpdateAdmin(Model model, int id) {
//        /*根据id获取数据*/
//        Admin admin = adminService.queryAdminById(id);
//        model.addAttribute("QAdmin",admin);
//        return "admin-list1";
//    }
    //    //修改请求
    @RequestMapping("/updateAdmin")
    public String updateAdmin(Admin admin) {
        adminService.updateAdmin(admin);
        return "redirect:/index.jsp";
    }
    @RequestMapping("/admin")
    public String admin(){
        return "z";
    }

}