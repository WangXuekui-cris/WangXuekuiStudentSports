package wxk.student_sports.dao;

import org.springframework.stereotype.Repository;
import wxk.student_sports.entity.User;

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
    //获取学生记录数
    int checkUser(int account);
}
