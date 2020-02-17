package wxk.student_sports.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import wxk.student_sports.entity.Academy;
import wxk.student_sports.entity.Game;
import wxk.student_sports.entity.User;
import wxk.student_sports.service.UserMenuService;
import wxk.student_sports.service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

/**
 * @author 王学奎
 * @version 1.0
 * @className UserController
 * @description <登录和注册>
 * @date 2020/2/2 22:46
 */
@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private UserMenuService userMenuService;

    //到注册界面
    @RequestMapping("/show_reg")
    public String showRegister(Model model){
        //获取所有的学院信息
        ArrayList<Academy> allAcademy = userService.getAllAcademy();
        //响应到注册界面
        model.addAttribute("academyList",allAcademy);
        return "register";
    }
    /**
     * 验证登录
     * @param request 用于获取前台输入的账户和密码
     * @param model 存放错误信息
     * @param session 存放姓名，用于前台的显示
     * @return
     */
    @RequestMapping("/login")
    public String login(HttpServletRequest request, Model model, HttpSession session){
        User user = new User();
        //获取前台输入的账号和密码
        Integer account = Integer.valueOf(request.getParameter("userAccount"));
        String password = request.getParameter("password");
        //将account添加到user对象中，并根据这个user的account返回一个新的user对象
        user.setAccount(account);
        User login = userService.login(user);
        //验证账号和密码，如果正确跳转到main.jsp；错误则重新返回index.jsp并提示信息
        if(login!=null&&account.equals(login.getAccount())&&password.equals(login.getPassword())){
            session.setAttribute("user",login);
            return "main";
        }else{
            model.addAttribute("msg","账号或密码错误");
            return "../../index";
        }
    }
    @RequestMapping("/gameInfo")
    public String gameInfo(Model model){
        //获取所有的赛事信息
        ArrayList<Game> gameList = userMenuService.getAllGame();
        //将赛事信息响应到前台
        model.addAttribute("gameList", gameList);
        return "gameInfo";
    }


    @RequestMapping("/gameResult")
    public String gameResult(){
        return "gameResult";
    }
    @RequestMapping("/resultPrint")
    public String resultPrint(){
        return "resultPrint";
    }

    /**
     *
     * @param request 用于获取前台的输入的账号account
     * @param response 用于响应前台数据
     * @return
     * @throws IOException
     */
    @RequestMapping("/check")
    public String checkAccount(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //获取前台输入的账号
        String account = request.getParameter("account");
        Integer userAccount = Integer.valueOf(account);
        //获取查询的记录数
        int check = userService.checkAccount(userAccount);
        //响应给前台
        PrintWriter out = response.getWriter();
        //如果记录数check大于0，说明该账号已存在，返回"true";否则，返回"false"
        if(check>0){
            out.print("true");
        }else{
            out.print("false");
        }
        return null;
    }

    /**
     *
     * @param user 直接使用SpringMVC实体类与注册界面参数对应的方法接收参数
     * @param session 注册成功后将用户账号显示在输入框
     * @return
     */
    @RequestMapping("/reg")
    public String register(User user,HttpSession session){
        int i = userService.addUser(user);
        session.setAttribute("user","user");
        if(i > 0){
            return "../../index";
        }else{
            return "register";
        }
    }
}
