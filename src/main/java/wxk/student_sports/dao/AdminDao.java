package wxk.student_sports.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import wxk.student_sports.entity.Game;
import wxk.student_sports.entity.GameScores;
import wxk.student_sports.entity.User;

import java.util.ArrayList;

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
    //删除赛事
    int delete(int gameID);
    //添加赛事
    int addGame(Game game);
    //录入成绩
    int entry(@Param("sAccount") Integer sAccount,@Param("gID") Integer gID,@Param("score") String score);
    //根据sAccount和gID查询成绩表中是否已存在
    int selectByAccountAndGid(@Param("sAccount") Integer sAccount,@Param("gID") Integer gID);
    //查询所有用户的信息
    ArrayList<User> selectAllUser();
    //根据指定id查询用户
    User selectByUserID(int id);
    //修改用户
    int modify(User user);
    //删除报名信息
    int deleteRegInfo(int userAccount);
    //查询是否有成绩信息
    int score(int sAccount);
    //查删除成绩信息
    int deleteScore(int sAccount);
    //删除用户
    int deleteUser(int userAccount);
    //获取已经录入赛事成绩的赛事名称
    ArrayList<Game> getGames();
    //根据赛事ID获取指定的成绩列表
    ArrayList<GameScores> getGameScoreByGid(int gID);
    //根据学生账号和赛事ID查询学生报名记录
    //int selectCount(@Param("studentAccount") int studentAccount, @Param("gameID") int gameID);
    int selectCount( int studentAccount, int gameID);
}
