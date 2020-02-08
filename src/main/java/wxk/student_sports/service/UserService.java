package wxk.student_sports.service;

import wxk.student_sports.entity.Academy;
import wxk.student_sports.entity.User;

import java.util.ArrayList;

/**
 * @author 王学奎
 * @version 1.0
 * @className UserService
 * @description <功能描述>
 * @date 2020/2/7 13:23
 */
public interface UserService {
    //根据账号获取一个user对象
    User login(User user);
    //获取所有的学院记录
    ArrayList<Academy> getAllAcademy();
    //获取学生记录数
    int checkAccount(int account);
    //添加学生账号
    int addUser(User user);
}
