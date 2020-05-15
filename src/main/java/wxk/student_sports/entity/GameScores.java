package wxk.student_sports.entity;

/**
 * @author 王学奎
 * @version 1.0
 * @className GameScores
 * @description <功能描述>
 * @date 2020/5/8 16:05
 */
public class GameScores {
    private String gameName;
    private Integer account;
    private String name;
    private String score;
    private Integer scoreNo;

    public GameScores() {
    }

    public GameScores(String gameName, Integer account, String name, String score, Integer scoreNo) {
        this.gameName = gameName;
        this.account = account;
        this.name = name;
        this.score = score;
        this.scoreNo = scoreNo;
    }

    public String getGameName() {
        return gameName;
    }

    public void setGameName(String gameName) {
        this.gameName = gameName;
    }

    public Integer getAccount() {
        return account;
    }

    public void setAccount(Integer account) {
        this.account = account;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getScore() {
        return score;
    }

    public void setScore(String score) {
        this.score = score;
    }

    public Integer getScoreNo() {
        return scoreNo;
    }

    public void setScoreNo(Integer scoreNo) {
        this.scoreNo = scoreNo;
    }

    @Override
    public String toString() {
        return "GameScores{" +
                "gameName='" + gameName + '\'' +
                ", account=" + account +
                ", name='" + name + '\'' +
                ", score='" + score + '\'' +
                ", scoreNo=" + scoreNo +
                '}';
    }
}
