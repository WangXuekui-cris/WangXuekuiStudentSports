package wxk.student_sports.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * @author 王学奎
 * @version 1.0
 * @className UserController
 * @description <功能描述>
 * @date 2020/2/2 22:46
 */
@Controller
@RequestMapping("/user")
public class UserController {

    //到注册界面
    @RequestMapping("/show_reg")
    public String showRegister(){
        return "register";
    }
    //验证注册
    @RequestMapping("/login")
    public String login(HttpServletRequest request){
        String username = request.getParameter("username");
        System.out.println(username);
        String password = request.getParameter("password");
        if("201407350".equals(username)&&"123456".equals(password)){
            return "main";
        }else{
            return "register";
        }
    }

}
