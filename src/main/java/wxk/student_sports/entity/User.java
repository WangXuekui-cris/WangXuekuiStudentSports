package wxk.student_sports.entity;

/**
 * @author 王学奎
 * @version 1.0
 * @className User
 * @description <学生实体，跟数据库对应，用于登录或注册等>
 * @date 2020/2/7 13:04
 */
public class User {
    private Integer id;
    //账号，即学号
    private Integer account;
    //密码
    private String password;
    //姓名
    private String name;
    //年龄
    private Integer age;
    //性别
    private String gender;
    //学院
    private Academy academy;
    //用户权限
    private Integer userState;

    public User() {
    }

    public User(Integer userState,Integer account, String password, String name,Integer age,String gender) {
        this.userState = userState;
        this.account = account;
        this.password = password;
        this.name = name;
        this.age = age;
        this.gender = gender;
    }

    public User(Integer id,Integer account, String password, String name, Integer age, String gender, Academy academy,Integer userState) {
        this.id = id;
        this.account = account;
        this.password = password;
        this.name = name;
        this.age = age;
        this.gender = gender;
        this.academy = academy;
        this.userState = userState;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getAccount() {
        return account;
    }

    public void setAccount(Integer account) {
        this.account = account;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Academy getAcademy() {
        return academy;
    }

    public void setAcademy(Academy academy) {
        this.academy = academy;
    }

    public Integer getUserState() {
        return userState;
    }

    public void setUserState(Integer userState) {
        this.userState = userState;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                "account=" + account +
                ", password='" + password + '\'' +
                ", name='" + name + '\'' +
                ", age=" + age +
                ", gender='" + gender + '\'' +
                ", academy=" + academy +
                ", userState=" + userState +
                '}';
    }
}
