package com.ghq.boot.mapper;

import com.ghq.boot.entity.Project;
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
public interface ProjectMapper extends BaseMapper<Project> {
    @Select("SELECT COUNT(*) As finish from project WHERE isfinish = 1")
    Integer countFinish();
    @Select("SELECT COUNT(*) As finish from project WHERE isfinish = 0")
    Integer countUnFinish();
    @Select("SELECT COUNT(*) FROM `project` WHERE createtime LIKE #{date}  ")
    Integer countProjectByDate(@Param("date") String date);
}
