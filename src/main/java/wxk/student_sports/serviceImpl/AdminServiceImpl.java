package wxk.student_sports.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import wxk.student_sports.dao.AdminDao;
import wxk.student_sports.entity.Game;
import wxk.student_sports.entity.GameScores;
import wxk.student_sports.entity.User;
import wxk.student_sports.service.AdminService;

import java.util.ArrayList;

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

    /**
     * 添加新的赛事
     * @param game
     * @return
     */
    @Override
    public int addGame(Game game) {
        int add = adminDao.addGame(game);
        return add;
    }

    /**
     * 录入成绩
     * @param sAccount
     * @param gID
     * @param score
     * @return
     */
    @Override
    public int entryResult(Integer sAccount, Integer gID, String score) {
        int entry = adminDao.entry(sAccount, gID, score);
        return entry;
    }

    /**
     * 根据账号和赛事ID查询是否存在记录
     * @param sAccount
     * @param gID
     * @return
     */
    @Override
    public int selectByAccountAndGid(Integer sAccount, Integer gID) {
        int count = adminDao.selectByAccountAndGid(sAccount,gID);
        return count;
    }

    /**
     * 查询所有用户
     * @return
     */
    @Override
    public ArrayList<User> selectAllUser() {
        ArrayList<User> users = adminDao.selectAllUser();
        return users;
    }

    /**
     * 根据id查询指定用户
     * @param id
     * @return
     */
    @Override
    public User selectByUserID(int id) {
        User user = adminDao.selectByUserID(id);
        return user;
    }

    /**
     * 修改用户
     * @param user
     * @return
     */
    @Override
    public int modify(User user) {
        int modify = adminDao.modify(user);
        return modify;
    }

    /**
     * 根据账号删除报名信息
     * @param userAccount
     * @return
     */
    @Override
    public int deleteRegInfo(int userAccount) {
        int info = adminDao.deleteRegInfo(userAccount);
        return info;
    }

    /**
     * 查询该账户下是否有成绩信息
     * @param sAccount
     * @return
     */
    @Override
    public int score(int sAccount) {
        int score = adminDao.score(sAccount);
        return score;
    }

    /**
     * 删除成绩信息
     * @param sAccount
     * @return
     */
    @Override
    public int deleteScore(int sAccount) {
        int i = adminDao.deleteScore(sAccount);
        return i;
    }

    /**
     * 根据用户账号删除用户
     * @param userAccount
     * @return
     */
    @Override
    public int deleteUser(int userAccount) {
        int dUser = adminDao.deleteUser(userAccount);
        return dUser;
    }

    /**
     *
     * @return 获取已经录入成绩的赛事名称
     */
    @Override
    public ArrayList<Game> getGames() {
        ArrayList<Game> games = adminDao.getGames();
        return games;
    }

    /**
     * 根据赛事ID获取指定的成绩列表
     * @param gID 赛事ID
     * @return 成绩集合
     */
    @Override
    public ArrayList<GameScores> getGameScoreByGid(int gID) {
        ArrayList<GameScores> gameScore = adminDao.getGameScoreByGid(gID);
        return gameScore;
    }

    /**
     * 根据学生账号和赛事ID查询学生报名记录
     * @param studentAccount
     * @param gameID
     * @return 返回记录数
     */
    @Override
    public int selectCount(int studentAccount, int gameID) {
        int count = adminDao.selectCount(studentAccount,gameID);
        return count;
    }
}
