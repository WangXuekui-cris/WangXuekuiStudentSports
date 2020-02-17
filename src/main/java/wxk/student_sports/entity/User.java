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

    public User() {
    }

    public User(Integer account, String password, String name,Integer age,String gender) {
        this.account = account;
        this.password = password;
        this.name = name;
        this.age = age;
        this.gender = gender;
    }

    public User(Integer account, String password, String name, Integer age, String gender, Academy academy) {
        this.account = account;
        this.password = password;
        this.name = name;
        this.age = age;
        this.gender = gender;
        this.academy = academy;
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

    @Override
    public String toString() {
        return "User{" +
                "account=" + account +
                ", password='" + password + '\'' +
                ", name='" + name + '\'' +
                ", age=" + age +
                ", gender='" + gender + '\'' +
                ", academy=" + academy +
                '}';
    }
}
