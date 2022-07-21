package com.ghq.boot.service;

import com.ghq.boot.entity.RespBean;
import com.ghq.boot.entity.User;
import com.baomidou.mybatisplus.extension.service.IService;

import javax.servlet.http.HttpServletRequest;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author 高煌庆
 * @since 2022-07-17
 */
public interface IUserService extends IService<User> {

    //登录之后返回token
    RespBean login(String accoun, String password, HttpServletRequest request);

    //根据用户名获取用户
    User getUserByUserName(String username);
}
