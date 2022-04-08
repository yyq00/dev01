package com.fc.controller;

import com.github.pagehelper.PageInfo;
import com.fc.entity.Papers;
import com.fc.service.PaperService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

//@Controller 处理http请求
@Controller
@RequestMapping("/paper")
public class PaperController {
    //Controller层 调用 Service层
    //@Autowired 注解 ioc自动装配  byName byType
    //@Qualifier 和 @Autowired配合使用调用Service
    @Autowired
    @Qualifier("PaperServiceImpl")
    private PaperService paperService;
//查询所有书籍 并返回到一个书集展示页面
    @RequestMapping("/allPaper")
    public String list(Model model) {
        List<Papers> papers = paperService.queryAllPaper();
        model.addAttribute("papers", papers);
        return "member-list";
    }
    //添加报刊  跳转到增加报刊页面
    @RequestMapping("/toAddPaper")
    public String toAddPaper() {
        return "member-add";
    }
    //添加报刊请求
    @RequestMapping("/addPaper")
    public String addPaper(Papers papers) {
        System.out.println("addPaper=>"+ papers);
        paperService.addPaper(papers);
        return "redirect:/paper/listPapers";//重定向到 return "allBook";
    }
    //修改报刊 跳转到修改报刊页面
    @RequestMapping("/toUpdate")
    public String toUpdatePaper(Model model, int id) {
        /*根据id获取数据*/
        Papers papers = paperService.queryPaperById(id);
        model.addAttribute("QPaper", papers);
        return "member-edit";
    }
//    //修改请求
    @RequestMapping("/updatePaper")
    public String updatePaper(Papers papers) {
        paperService.updatePaper(papers);
        return "redirect:/paper/listPapers";//重定向到 return "allBook";
    }
    //删除报刊
    @RequestMapping("/deletePaper/{paperId}")
    public String deletePaper(@PathVariable("paperId") int id) {
        paperService.deletePaperById(id);
        return "redirect:/paper/listPapers";//重定向到 return "allBook";
    }
    //查询报刊
    @RequestMapping("/queryPaper")
    public String queryPaper(@RequestParam(value = "offest",defaultValue = "1") String offest,String queryPaperName,Model model){
        Papers paper = paperService.queryPaperByName(queryPaperName);
        List<Papers> papers = new ArrayList<Papers>();
        papers.add(paper);
        //查询书籍为空时显示所有书籍      并提示未查到
        if(paper == null){
            papers = paperService.queryAllPaper();
            model.addAttribute("error","未查到");
        }
        model.addAttribute("papers",papers);
        PageInfo pageInfo = new PageInfo(papers,5);
        model.addAttribute("pageInfo",pageInfo);
        return "member-list";
    }

    //报刊列表
//    @RequestMapping("/a")
//    public String a(Model model){
//        List<Papers> papers = paperService.queryAllPaper();
//        model.addAttribute("papers", papers);
//        return "member-list";
//    }
    //退回登录页
    @RequestMapping("/b")
    public String b(Model model){
        return "redirect:/index.jsp";
    }
    //分页查询 报刊信息集合
    @RequestMapping("/listPapers")
    public String listPapers(@RequestParam(value = "offest",defaultValue = "1") String offest, Model model){
        List<Papers> papers = paperService.listPapers(offest, "3");
        PageInfo pageInfo = new PageInfo(papers,5);
        model.addAttribute("pageInfo",pageInfo);
        model.addAttribute("papers",papers);
        return "member-list";
    }
}

