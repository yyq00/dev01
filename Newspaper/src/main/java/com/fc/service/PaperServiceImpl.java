package com.fc.service;

import com.fc.dao.PaperMapper;
import com.fc.entity.Papers;
import com.github.pagehelper.PageHelper;
import org.springframework.stereotype.Service;

import java.util.List;
@Service("PaperServiceImpl")
public class PaperServiceImpl implements PaperService {

    //调用dao层的操作，设置一个set接口，方便Spring管理
    private PaperMapper paperMapper;

    public void setPaperMapper(PaperMapper paperMapper) {
        this.paperMapper = paperMapper;
    }

    public int addPaper(Papers paper) {
        return paperMapper.addPaper(paper);
    }

    public int deletePaperById(int id) {
        return paperMapper.deletePaperById(id);
    }

    public int updatePaper(Papers papers) {
        return paperMapper.updatePaper(papers);
    }

    public Papers queryPaperById(int id) {
        return paperMapper.queryPaperById(id);
    }

    public List<Papers> queryAllPaper() {
        return paperMapper.queryAllPaper();
    }

    @Override
    public Papers queryPaperByName(String paperName) {
        return paperMapper.queryPaperByName(paperName);
    }

    @Override
    public List<Papers> listPapers(String offest, String pageSize) {
        Integer pnum=Integer.valueOf(offest);//第几页
        Integer psize=Integer.valueOf(pageSize);//一页多少内容
        //调用PageHelper获取第1页，10条内容，默认查询总数count
        PageHelper.startPage(pnum,psize);
        //调用CityDaoImpl 分页查询
        return paperMapper.queryAllPaper();
    }


}
