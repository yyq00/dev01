package com.fc.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

//有参无参
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Users {
    private int userID;
    private String userName;
    private String userPwd;
    private String salt;
//    private int start;		// 开始数据的索引
//    private int count;		// 每一页的数量
//    private int total;		// 总共的数据量
//    /**
//     * 提供一个构造方法
//     * @param start
//     * @param count
//     */
//    public Users(int start, int count) {
//        super();
//        this.start = start;
//        this.count = count;
//    }
//    /**
//     * 判断是否有上一页
//     * @return
//     */
//    public boolean isHasPreviouse(){
//        if(start==0)
//            return false;
//        return true;
//    }
//    /**
//     * 判断是否有下一页
//     * @return
//     */
//    public boolean isHasNext(){
//        if(start==getLast())
//            return false;
//        return true;
//    }
//    /**
//     * 计算得到总页数
//     * @return
//     */
//    public int getTotalUsers(){
//        int totalUsers;
//        // 假设总数是50，是能够被5整除的，那么就有10页
//        if (0 == total % count)
//            totalUsers = total /count;
//            // 假设总数是51，不能够被5整除的，那么就有11页
//        else
//            totalUsers = total / count + 1;
//        if(0==totalUsers)
//            totalUsers = 1;
//        return totalUsers;
//    }
//    /**
//     * 计算得到尾页
//     * @return
//     */
//    public int getLast(){
//        int last;
//        // 假设总数是50，是能够被5整除的，那么最后一页的开始就是45
//        if (0 == total % count)
//            last = total - count;
//            // 假设总数是51，不能够被5整除的，那么最后一页的开始就是50
//        else
//            last = total - total % count;
//        last = last<0?0:last;
//        return last;
//    }
}
