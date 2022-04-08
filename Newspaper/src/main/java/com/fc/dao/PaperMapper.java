package com.fc.dao;

import com.fc.entity.Papers;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PaperMapper {
    //增加一个Paper
    int addPaper(Papers paper);

    //根据id删除一个Paper
    int deletePaperById(@Param("paperID") int id);

    //更新Paper
    int updatePaper(Papers papers);

    //根据id查询,返回一个Paper
    Papers queryPaperById(@Param("paperID") int id);

    //查询全部Paper,返回list集合
    List<Papers> queryAllPaper();
    //根据报刊名查询出所有报刊
    Papers queryPaperByName(@Param("paperName")String paperName);
}
