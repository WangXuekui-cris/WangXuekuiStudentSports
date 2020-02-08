package wxk.student_sports.dao;

import org.springframework.stereotype.Repository;
import wxk.student_sports.entity.Academy;
import wxk.student_sports.entity.User;

import java.util.ArrayList;

/**
 * @author 王学奎
 * @version 1.0
 * @className UserDao
 * @description <功能描述>
 * @date 2020/2/7 13:15
 */
@Repository("userDao")
public interface UserDao {
    //根据账号获取user对象
    User getUser(int account);
    //查询所有学院id和name
    ArrayList<Academy> getAllAcademy();
    //获取学生记录数
    int checkAccount(int account);
}
