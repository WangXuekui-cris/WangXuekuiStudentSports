package wxk.student_sports.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import wxk.student_sports.entity.Game;

import java.util.ArrayList;

/**
 * @author 王学奎
 * @version 1.0
 * @className UserMenuDao
 * @description <用户菜单>
 * @date 2020/2/9 20:42
 */
@Repository
public interface UserMenuDao {
    //获得所有的赛事信息
    ArrayList<Game> getAllGameInfo();
    //检查该账号下是否有报名信息
    int checkRegInfo(int account);
    //获取报名信息
    ArrayList<Game> getRegInfo(int account);
    //获得指定的赛事信息
    Game getGameInfo(int gameID);
    //查询指定账号和指定赛事ID下是否有记录
    int getGameByUser(@Param("account")int account,@Param("gameID") int gameID);
    //报名赛事
    int signGame(@Param("account")int account,@Param("gameID")int Game);
}
