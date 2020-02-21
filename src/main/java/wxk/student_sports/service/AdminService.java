package wxk.student_sports.service;

import wxk.student_sports.entity.Game;

/**
 * @author 王学奎
 * @version 1.0
 * @className AdminService
 * @description <管理员业务接口>
 * @date 2020/2/21 15:40
 */
public interface AdminService {
    //更新赛事
    int update(Game game);
    //删除赛事
    int delete(int gameID);
}
