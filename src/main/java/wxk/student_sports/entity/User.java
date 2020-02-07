package wxk.student_sports.entity;

/**
 * @author 王学奎
 * @version 1.0
 * @className User
 * @description <学生实体，跟数据库对应，用于登录或注册等>
 * @date 2020/2/7 13:04
 */
public class User {
    //账号，即学号
    private int account;
    //密码
    private String password;
    //姓名
    private String name;
    //年龄
    private int age;
    //性别
    private String gender;
    //学院id
    private Academy academyId;

    public User() {
    }

    public User(int account, String password, String name) {
        this.account = account;
        this.password = password;
        this.name = name;
    }

    public User(int account, String password, String name, int age, String gender, Academy academyId) {
        this.account = account;
        this.password = password;
        this.name = name;
        this.age = age;
        this.gender = gender;
        this.academyId = academyId;
    }

    public int getAccount() {
        return account;
    }

    public void setAccount(int account) {
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

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Academy getAcademyId() {
        return academyId;
    }

    public void setAcademyId(Academy academyId) {
        this.academyId = academyId;
    }

    @Override
    public String toString() {
        return "User{" +
                "account=" + account +
                ", password='" + password + '\'' +
                ", name='" + name + '\'' +
                ", age=" + age +
                ", gender='" + gender + '\'' +
                ", academyId=" + academyId +
                '}';
    }
}
