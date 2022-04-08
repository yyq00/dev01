package com.fc.service;

import com.fc.entity.Papers;

import java.util.List;

//PaperService:底下需要去实现,调用dao层
public interface PaperService {
    //增加一个Paper
    int addPaper(Papers paper);
    //根据id删除一个Paper
    int deletePaperById(int id);
    //更新Paper
    int updatePaper(Papers papers);
    //根据id查询,返回一个Paper
    Papers queryPaperById(int id);
    //查询全部Paper,返回list集合
    List<Papers> queryAllPaper();

    Papers queryPaperByName(String paperName);
    //分页查询
    List<Papers> listPapers(String offest, String pageSize);
}