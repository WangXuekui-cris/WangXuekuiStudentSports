package wxk.student_sports.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import wxk.student_sports.entity.Academy;
import wxk.student_sports.entity.Game;
import wxk.student_sports.entity.User;
import wxk.student_sports.service.AdminService;
import wxk.student_sports.service.UserMenuService;
import wxk.student_sports.service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;

/**
 * @author 王学奎
 * @version 1.0
 * @className AdminController
 * @description <管理员功能>
 * @date 2020/2/20 12:56
 */
@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private UserMenuService userMenuService;
    @Autowired
    private AdminService adminService;
    @Autowired
    private UserService userService;

    /**
     * 查看赛事信息
     * @param model
     * @return
     */
    @RequestMapping("/gameInfo")
    public String gameInfo(Model model){
        //获取所有的赛事信息
        ArrayList<Game> gameList = userMenuService.getAllGame();
        //将赛事信息响应到前台
        model.addAttribute("gameList", gameList);
        return "adminGameInfo";
    }

    /**
     * 根据gameID获取要修改的赛事信息
     * @param gameID
     * @param model
     * @return
     */
    @RequestMapping("/updateGame")
    public String updateGame(String gameID,Model model){
        int gameId = Integer.parseInt(gameID);
        Game game = userMenuService.getGameInfo(gameId);
        model.addAttribute("game",game);
        return "updateGame";
    }

    /**
     * 提交更新赛事的信息
     * @param game
     * @return
     */
    @RequestMapping("/update")
    public String update(Game game){
        int update = adminService.update(game);
        if(update > 0){
            return "forward:gameInfo";
        }else{
            return "updateGame";
        }
    }

    /**
     * 删除赛事
     * @param gameID
     * @return
     */
    @RequestMapping("/delete")
    public String delete(String gameID){
        int gameId = Integer.parseInt(gameID);
        adminService.delete(gameId);
        return "forward:gameInfo";
    }

    /**
     * 跳往增加赛事界面
     * @return
     */
    @RequestMapping("/addGame")
    public String addGame(){
        return "addGame";
    }

    /**
     * 添加赛事
     * @param game 接收前台传来的参数
     * @return
     */
    @RequestMapping("/add")
    public String add(Game game){
        int add = adminService.addGame(game);
        if(add > 0) {//添加成功跳往赛事信息界面
            return "forward:gameInfo";
        }else {//失败则重新添加
            return "addGame";
        }
    }

    /**
     * 带着已结束赛事信息到录入成绩界面
     * @param model
     * @return
     */
    @RequestMapping("/entryResult")
    public String goResult(Model model){
        //获取当前系统时间
        Date date =new Date();
        Timestamp currentTime =new Timestamp(date.getTime());
        //获得所有赛事信息
        ArrayList<Game> gameList = userMenuService.getAllGame();
        //获取已结束的赛事信息
        Iterator<Game> iterator = gameList.iterator();
        while(iterator.hasNext()){
            Game game = iterator.next();
            if(currentTime.before(game.getEndTime())){
                iterator.remove();
            }
        }
        model.addAttribute("gameList",gameList);
        return "entryResult";
    }

    /**
     * 录入成绩
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/entry")
    public String entry(HttpServletRequest request,Model model){
        //获得前台输入的参数
        Integer sAccount = Integer.parseInt(request.getParameter("sAccount"));
        Integer gID = Integer.parseInt(request.getParameter("gID"));
        String score = request.getParameter("score");
        //根据账号和赛事ID判断是否已经插入该成绩
        int count = adminService.selectByAccountAndGid(sAccount,gID);
        //count>0说明存在相同记录，否则可以录入
        if(count > 0){
            model.addAttribute("msg","重复录入");
            return "forward:entryResult";
        }else{
            adminService.entryResult(sAccount, gID, score);
            model.addAttribute("sMsg","录入成功");
            return "forward:entryResult";
        }
    }

    /**
     * 携带所有用户信息去用户管理界面
     * @param model
     * @return
     */
    @RequestMapping("/userManage")
    public String userManage(Model model){
        ArrayList<User> userList = adminService.selectAllUser();
        model.addAttribute("users",userList);
        return "userManage";
    }

    /**
     * 携带个人信息和学院信息
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("/modify")
    public String modify(String id,Model model){
        Integer ID = Integer.parseInt(id);
        //获取用户个人信息响应到前台
        User user = adminService.selectByUserID(ID);
        model.addAttribute("user",user);
        //获取所有的学院信息
        ArrayList<Academy> allAcademy = userService.getAllAcademy();
        //响应到注册界面
        model.addAttribute("academyList",allAcademy);
        return "modifyUser";
    }

    /**
     * 修改用户
     * @param user
     * @return
     */
    @RequestMapping("/modifyUser")
    public String modifyUser(User user){
        adminService.modify(user);
        return "forward:userManage";
    }

    /**
     * 删除用户以及他的成绩和报名赛事
     * @param response
     * @param account
     * @return
     * @throws IOException
     */
    @RequestMapping("/removeUser")
    public String removeUser(HttpServletResponse response,String account) throws IOException {
        int userAccount = Integer.parseInt(account);
        //获取响应
        PrintWriter out = response.getWriter();
        //查看该用户是否有成绩信息
        int score = adminService.score(userAccount);
        if(score > 0){//删除成绩信息
            adminService.deleteScore(userAccount);
        }
        //查看该用户是否有报名信息
        int regInfo = userMenuService.checkAllRegInfo(userAccount);
        if(regInfo > 0){
            //删除报名信息
            adminService.deleteRegInfo(userAccount);
        }
        //删除用户
        int dUser = adminService.deleteUser(userAccount);
        out.print(dUser);
        return null;
    }
}
