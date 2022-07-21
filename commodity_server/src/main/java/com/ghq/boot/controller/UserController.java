package com.ghq.boot.controller;


import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ghq.boot.entity.RespBean;
import com.ghq.boot.entity.User;
import com.ghq.boot.mapper.UserMapper;
import com.ghq.boot.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


import javax.servlet.http.HttpServletRequest;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 高煌庆
 * @since 2022-07-17
 */
@RestController
public class UserController {

    @Autowired
    private IUserService userService;
    @Autowired
    private UserMapper userMapper;
    @PostMapping("/login")
    public RespBean login(@RequestBody User user, HttpServletRequest request){
        return userService.login(user.getAccoun(),user.getPassword(),request);
    }

    @GetMapping("/user/list")
    public RespBean getAllList(@RequestParam Integer page, @RequestParam Integer limit){
        Page<User> ppage = new Page<>(page,limit);
        userMapper.selectPage(ppage,null);
        return RespBean.success("返回成功",ppage);
    }
    @GetMapping("/user/info")
    public RespBean getInfo(){
        return RespBean.success("返回成功");
    }

    @PostMapping("/logout")
    public RespBean logout(){
        return RespBean.success("注销成功");
    }
}
