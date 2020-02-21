package wxk.student_sports.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import wxk.student_sports.dao.AdminDao;
import wxk.student_sports.entity.Game;
import wxk.student_sports.service.AdminService;

/**
 * @author 王学奎
 * @version 1.0
 * @className AdminServiceImpl
 * @description <功能描述>
 * @date 2020/2/21 15:41
 */
@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminDao adminDao;

    /**
     * 更新赛事
     * @param game
     * @return
     */
    @Override
    public int update(Game game) {
        int update = adminDao.update(game);
        return update;
    }

    /**
     * 删除赛事
     * @param gameID
     * @return
     */
    @Override
    public int delete(int gameID) {
        int delete = adminDao.delete(gameID);
        return delete;
    }
}
