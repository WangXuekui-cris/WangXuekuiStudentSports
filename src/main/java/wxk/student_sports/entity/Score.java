package wxk.student_sports.entity;

/**
 * @author 王学奎
 * @version 1.0
 * @className Score
 * @description <功能描述>
 * @date 2020/2/19 12:08
 */
public class Score {
    private Integer scoreID;
    private Game game;
    private String score;

    public Score() {
    }

    public Score(Integer scoreID, Game game,String score) {
        this.scoreID = scoreID;
        this.game = game;
        this.score = score;
    }

    public Integer getScoreID() {
        return scoreID;
    }

    public void setScoreID(Integer scoreID) {
        this.scoreID = scoreID;
    }

    public Game getGame() {
        return game;
    }

    public void setGame(Game game) {
        this.game = game;
    }

    public String getScore() {
        return score;
    }

    public void setScore(String score) {
        this.score = score;
    }

    @Override
    public String toString() {
        return "Score{" +
                "scoreID=" + scoreID +
                ", game=" + game +
                ", score='" + score + '\'' +
                '}';
    }
}
