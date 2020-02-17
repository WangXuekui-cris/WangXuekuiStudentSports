package wxk.student_sports.service;

import wxk.student_sports.entity.Game;

import java.util.ArrayList;

/**
 * @author 王学奎
 * @version 1.0
 * @className UserMenuService
 * @description <用户菜单>
 * @date 2020/2/9 21:18
 */
public interface UserMenuService {
    //获取所有学院信息
    ArrayList<Game> getAllGame();
    //检查该账号下是否有报名信息
    int checkAllRegInfo(int account);
    //获取该账号下所有的报名信息
    ArrayList<Game> getAllRegInfo(int account);
    //获得指定的赛事信息
    Game getGameInfo(int gameID);
    //查询指定账号和指定赛事ID下是否有记录
    int getGameByUser(int account,int gameID);
    //报名赛事
    int signGame(int account,int gameID);
}
