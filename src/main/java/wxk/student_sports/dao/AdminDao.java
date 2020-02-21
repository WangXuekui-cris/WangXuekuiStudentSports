package wxk.student_sports.dao;

import org.springframework.stereotype.Repository;
import wxk.student_sports.entity.Game;

/**
 * @author 王学奎
 * @version 1.0
 * @className AdminDao
 * @description <功能描述>
 * @date 2020/2/21 15:35
 */
@Repository
public interface AdminDao {
    //更新赛事
    int update(Game game);

    int delete(int gameID);
}
