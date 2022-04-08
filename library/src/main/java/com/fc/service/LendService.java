package com.fc.service;

import com.fc.bean.Lend;
import com.fc.dao.LendDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class LendService {
    @Autowired
    private LendDao lendDao;

    public boolean returnBook(long bookId, long readerId){
        return lendDao.returnBookOne(bookId, readerId)>0 && lendDao.returnBookTwo(bookId)>0;
    }

    public boolean lendBook(long bookId,long readerId){
        return lendDao.lendBookOne(bookId,readerId)>0 && lendDao.lendBookTwo(bookId)>0;
    }

    public ArrayList<Lend> lendList(){
        return lendDao.lendList();
    }
    public ArrayList<Lend> myLendList(long readerId){
        return lendDao.myLendList(readerId);
    }

    public int deleteLend(long serNum) {
        return lendDao.deleteLend(serNum);
    }

}
