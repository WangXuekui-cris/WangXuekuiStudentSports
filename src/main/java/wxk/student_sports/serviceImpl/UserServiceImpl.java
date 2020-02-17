package wxk.student_sports.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import wxk.student_sports.dao.UserDao;
import wxk.student_sports.entity.Academy;
import wxk.student_sports.entity.User;
import wxk.student_sports.service.UserService;

import java.util.ArrayList;

/**
 * @author 王学奎
 * @version 1.0
 * @className UserServiceImpl
 * @description <登录和注册>
 * @date 2020/2/7 13:57
 */
@Service("userServiceImpl")
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;

    /**
     *
     * @param user 传入学生对象用于获取账号
     * @return 返回 根据传入的账号查询出的学生对象
     */
    @Override
    public User login(User user) {
        int account = user.getAccount();
        User user1 = userDao.getUser(account);
        return user1;
    }

    //获取学院的所有信息
    @Override
    public ArrayList<Academy> getAllAcademy() {
        ArrayList<Academy> list = userDao.getAllAcademy();
        return list;
    }

    /**
     *
     * @param account 传入的学生账号
     * @return 返回根据account查询到的学生记录数
     */
    @Override
    public int checkAccount(int account) {
        int i = userDao.checkAccount(account);
        return i;
    }
    //添加学生账号信息
    @Override
    public int addUser(User user) {
        int i = userDao.addUser(user);
        return i;
    }
}
