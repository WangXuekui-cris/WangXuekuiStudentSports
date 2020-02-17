package wxk.student_sports.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import wxk.student_sports.entity.Game;
import wxk.student_sports.entity.User;
import wxk.student_sports.service.UserMenuService;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

/**
 * @author 王学奎
 * @version 1.0
 * @className UserMenuController
 * @description <功能描述>
 * @date 2020/2/17 13:17
 */
@Controller
@RequestMapping("/userMenu")
public class UserMenuController {
    @Autowired
    private UserMenuService userMenuService;

    /**
     * 获取用户的报名信息
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("/userInfo")
    public String userInfo(HttpSession session, Model model){
        //获取session域中的用户对象，即登录对象
        User user = (User) session.getAttribute("user");
        Integer account = user.getAccount();
        //检查该账号下是否有报名记录
        int checkNum = userMenuService.checkAllRegInfo(account);
        //如果checkNum大于0.说明有报名信息
        if(checkNum > 0){
            ArrayList<Game> regInfoList = userMenuService.getAllRegInfo(account);
            model.addAttribute("regInfoList",regInfoList);
            return "userInfo";
        }else{//当报名记录<=0，说明该用户没有报名信息
            model.addAttribute("msg","您还没有报名任何赛事");
            return "userInfo";
        }
    }

    @RequestMapping("/sign")
    public String signGame(String gameID, HttpSession session, HttpServletResponse response) throws IOException {
        //获取当前系统时间
        Date date =new Date();
        Timestamp currentTime =new Timestamp(date.getTime());
        //获取响应
        PrintWriter out = response.getWriter();
        //获取前台传过来的赛事ID
        int gameId= Integer.parseInt(gameID);
        //获取当前登录账号和学生id
        User user = (User) session.getAttribute("user");
        int account = user.getAccount();
        //获取指定赛事信息
        Game game = userMenuService.getGameInfo(gameId);
        //判断该用户是否已经报名相同赛事
        int num = userMenuService.getGameByUser(account,gameId);
        if(num > 0){
            out.print("已报名");
        }else if(game.getSpNum() <= 0){
            out.print("满员");
        }else{//用户未报名
            if (currentTime.after(game.getStartTime())){
                out.print("不能报名");
            }else{
                //报名赛事
                userMenuService.signGame(account, gameId);
            }
        }
        return null;
    }
}
