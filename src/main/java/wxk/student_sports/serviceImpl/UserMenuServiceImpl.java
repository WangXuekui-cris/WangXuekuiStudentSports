package wxk.student_sports.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import wxk.student_sports.dao.UserMenuDao;
import wxk.student_sports.entity.Game;
import wxk.student_sports.service.UserMenuService;

import java.util.ArrayList;

/**
 * @author 王学奎
 * @version 1.0
 * @className UserMenuServiceImpl
 * @description <功能描述>
 * @date 2020/2/9 21:19
 */
@Service
public class UserMenuServiceImpl implements UserMenuService {
    @Autowired
    private UserMenuDao userMenuDao;

    /**
     * 查询所有赛事信息
     * @return
     */
    @Override
    public ArrayList<Game> getAllGame() {
        ArrayList<Game> gameList = userMenuDao.getAllGameInfo();
        return gameList;
    }

    /**
     * 检查该账号下是否有报名信息
     * @param account 用户登录的账号
     * @return
     */
    @Override
    public int checkAllRegInfo(int account) {
        int checkNum = userMenuDao.checkRegInfo(account);
        return checkNum;
    }

    /**
     * 查询account账号下所有的报名信息
     * @param account
     * @return
     */
    @Override
    public ArrayList<Game> getAllRegInfo(int account) {
        ArrayList<Game> regGameList = userMenuDao.getRegInfo(account);
        return regGameList;
    }

    /**
     * 获得指定的赛事信息
     * @param gameID 赛事ID
     * @return 返回一个game对象
     */
    @Override
    public Game getGameInfo(int gameID) {
        Game game = userMenuDao.getGameInfo(gameID);
        return game;
    }

    /**
     * 查询指定账号和指定赛事ID下是否有记录
     * @param account 用户账号
     * @param gameID 赛事ID
     * @return 返回一个记录数
     */
    @Override
    public int getGameByUser(int account, int gameID) {
        int num = userMenuDao.getGameByUser(account,gameID);
        return num;
    }

    /**
     * 报名赛事
     * @param account 学生账号
     * @param gameID 赛事ID
     * @return
     */
    @Override
    public int signGame(int account, int gameID) {
        int i = userMenuDao.signGame(account, gameID);
        return i;
    }
}
