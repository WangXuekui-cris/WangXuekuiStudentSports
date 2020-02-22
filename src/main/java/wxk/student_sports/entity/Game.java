package wxk.student_sports.entity;

import java.sql.Timestamp;

/**
 * @author 王学奎
 * @version 1.0
 * @className Match
 * @description <赛事实体>
 * @date 2020/2/9 19:58
 */
public class Game {
    private Integer gameID;
    private String gameName;
    //比赛开始时间
    private Timestamp startTime;
    //比赛结束时间
    private Timestamp endTime;
    //需要的人数
    private Integer totalNum;
    //已报名的人数
    private Integer signNum;
    //赛事规则
    private String gameRule;

    public Game() {
    }

    public Game(Integer gameID, String gameName, Timestamp startTime, Timestamp endTime, Integer totalNum, Integer signNum,String gameRule) {
        this.gameID = gameID;
        this.gameName = gameName;
        this.startTime = startTime;
        this.endTime = endTime;
        this.totalNum = totalNum;
        this.signNum = signNum;
        this.gameRule = gameRule;
    }

    public Integer getGameID() {
        return gameID;
    }

    public void setGameID(Integer gameID) {
        this.gameID = gameID;
    }

    public String getGameName() {
        return gameName;
    }

    public void setGameName(String gameName) {
        this.gameName = gameName;
    }

    public Timestamp getStartTime() {
        return startTime;
    }

    public void setStartTime(Timestamp startTime) {
        this.startTime = startTime;
    }

    public Timestamp getEndTime() {
        return endTime;
    }

    public void setEndTime(Timestamp endTime) {
        this.endTime = endTime;
    }

    public Integer getTotalNum() {
        return totalNum;
    }

    public void setTotalNum(Integer totalNum) {
        this.totalNum = totalNum;
    }

    public Integer getSignNum() {
        return signNum;
    }

    public void setSignNum(Integer signNum) {
        this.signNum = signNum;
    }

    public String getGameRule() {
        return gameRule;
    }

    public void setGameRule(String gameRule) {
        this.gameRule = gameRule;
    }

    @Override
    public String toString() {
        return "Game{" +
                "gameID=" + gameID +
                ", gameName='" + gameName + '\'' +
                ", startTime=" + startTime +
                ", endTime=" + endTime +
                ", totalNum=" + totalNum +
                ", signNum=" + signNum +
                ", gameRule=" + gameRule +
                '}';
    }
}
