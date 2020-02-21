package wxk.student_sports.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import wxk.student_sports.entity.Game;
import wxk.student_sports.service.AdminService;
import wxk.student_sports.service.UserMenuService;

import java.util.ArrayList;

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
}
