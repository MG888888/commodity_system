package com.ghq.boot.mapper;

import com.ghq.boot.entity.User;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author 高煌庆
 * @since 2022-07-17
 */
public interface UserMapper extends BaseMapper<User> {

    @Select("select * from user where accoun = #{account}")
    User getUserByAccount(@Param("account") String account);
}
