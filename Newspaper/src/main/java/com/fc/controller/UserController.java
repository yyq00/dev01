package com.fc.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.fc.entity.Papers;
import com.fc.entity.Users;
import com.fc.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

//@Controller 处理http请求
@Controller
@RequestMapping("/user")
public class UserController {
    //Controller层 调用 Service层
    //@Autowired 注解 ioc自动装配  byName byType
    //@Qualifier 和 @Autowired配合使用调用Service
    @Autowired
    @Qualifier("UserServiceImpl")
    private UserService userService;

    @RequestMapping("/a1")
    public String test(){
        return "a1";
    }
//查询所有用户
    @RequestMapping("/allUser")
    public String Userlist(Model model) {
//        String pwd1 = DigestUtils.md5Hex(pwd);
        List<Users> users= userService.queryAllUser();
        model.addAttribute("list", users);
        return "admin-list";

    }
    /*@RequestMapping("/allUser")
    public String list(HttpServletRequest request, HttpServletResponse response){
        // 获取分页参数
        int start = 0;
        int count = 10;
        try {
            start = Integer.parseInt(request.getParameter("users.start"));
            count = Integer.parseInt(request.getParameter("users.count"));
        } catch (Exception e) {
        }
        Users users = new Users(start, count);
        //  使用 PageHelper 来设置分页
        PageHelper.offsetPage(users.getStart(),users.getCount());
        List<Users> students = userService.list(users);
        //  使用 PageHelper 来获取总数
        int total = (int) new PageInfo<>(students).getTotal();
        users.setTotal(total);
        request.setAttribute("students", students);
        request.setAttribute("users", users);
        return "admin-list";
    }*/
//登陆验证
    @RequestMapping("/queryUser")
    public String queryUser(HttpSession session, String name, String pwd){
        //md5密码加密
        //
//        String salt = (pwd);
//        String newpwd = salt+pwd;
//        String pwdMd5 = DigestUtils.md5Hex(newpwd);
        Users users = userService.findByUsername(name,pwd);
        List<Users> list= new ArrayList<Users>();
        list.add(users);

        if(users == null){
            session.setAttribute("error","用户名或密码错误");
            return "redirect:/index.jsp";
        }
//        session.setAttribute("list",list);
        session.setAttribute("Qname",users );
        return "a";
    }

    @RequestMapping("/a")
    public String a(HttpSession session){
        List<Users> list = userService.queryAllUser();
        session.setAttribute("list", list);
        return "member-list1";
    }
//注册
@RequestMapping("/toAddUser")
public String toAddPaper() {
    return "c";
}
    //注册用户请求
    @RequestMapping("/addUser")
    public String addUser(Users users,Model model,String userName) {
//        String uPwd = users.getUserPwd();
//        String uName = users.getUserName();
        Users a = userService.queryUserByName2(userName);
        List<Users> list = new ArrayList<Users>();
        list.add(a);
        if(a != null){
            model.addAttribute("error","该用户名已被注册");
            return "c";
        }

        userService.addUser(users);
        return "redirect:index.jsp";
    }

    //新增报刊
    //添加报刊  跳转到增加报刊页面
    @RequestMapping("/toAddUser2")
    public String test2() {
        return "admin-add";
    }
    //添加报刊请求
    @RequestMapping("/addUser2")
    public String addBook(Users users) {
        System.out.println("addUser2=>"+users);
        userService.addUser(users);
        return "redirect:/user/allUser";//重定向到 return "allUser";
    }

    //查询
    @RequestMapping("/queryUser2")
    public String queryUser2(@RequestParam(value = "offest",defaultValue = "1") String offest,String queryUserName2,Model model){
        Users user = userService.queryUserByName2(queryUserName2);
        List<Users> users = new ArrayList<Users>();
        users.add(user);
        //查询报刊为空时显示所有书籍      并提示未查到
        if(user == null){
            users = userService.queryAllUser();
            model.addAttribute("error","未查到");

        }
        model.addAttribute("users", users);
        PageInfo pageInfo = new PageInfo(users,5);
        model.addAttribute("pageInfo",pageInfo);
        return "admin-list";
    }
    //修改报刊 跳转到修改用户页面
    @RequestMapping("/toUpdateUser")
    public String toUpdateUser(Model model, int id) {
        /*根据id获取数据*/
        Users users = userService.queryUserById(id);
        model.addAttribute("QUser",users );
        return "admin-edit";
    }
    //    //修改请求
    @RequestMapping("/updateUser")
    public String updateUser(Users users) {
        userService.updateUser(users);
        return "redirect:/user/allUser";//重定向到 return "allUser";
    }
    //删除用户
    @RequestMapping("/deleteUser/{userId}")
    public String deleteUser(@PathVariable("userId") int id) {
        userService.deleteUserById(id);
        return "redirect:/user/allUser";//重定向到 return "allUser";
    }
    //个人信息页修改请求
    @RequestMapping("/updateUser1")
    public String updateUser1(Users users) {
        userService.updateUser(users);
        return "redirect:/index.jsp";
    }
    //分页查询  学生信息集合
    @RequestMapping("/listUsers")
    public String listUsers(@RequestParam(value = "offest",defaultValue = "1") String offest, Model model){
        List<Users> users = userService.listUsers(offest, "3");
        PageInfo pageInfo = new PageInfo(users,5);
        model.addAttribute("pageInfo",pageInfo);
        model.addAttribute("users",users);
        return "admin-list";
    }
}