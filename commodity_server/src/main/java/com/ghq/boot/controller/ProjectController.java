package com.ghq.boot.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ghq.boot.entity.Project;
import com.ghq.boot.entity.RespBean;
import com.ghq.boot.mapper.ProjectMapper;
import com.ghq.boot.service.IProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 高煌庆
 * @since 2022-07-17
 */
@RestController
@RequestMapping("/project")
public class ProjectController {
    @Autowired
    private IProjectService projectService;
    @Autowired
    private ProjectMapper projectMapper;
    @GetMapping("/list")
    public RespBean getAllList(@RequestParam Integer page, @RequestParam Integer limit){
            Page<Project> ppage = new Page<>(page,limit);
        projectMapper.selectPage(ppage,null);
        return RespBean.success("返回成功",ppage);
    }
    @PostMapping("/save")
    public RespBean save(@RequestBody Project project) {
            if (projectService.saveOrUpdate(project)) {
                return RespBean.success("更新成功");
            } else {
                return RespBean.error("更新失败");
            }
    }
    @DeleteMapping("/remove/{id}")
    public RespBean delete(@PathVariable Integer id){
        if(projectService.removeById(id)){
            return RespBean.success("删除成功");
        }
        else {
            return RespBean.error("删除失败");
        }
    }
    @GetMapping("/select")
    public RespBean selectByName(@RequestParam String selectName){
        QueryWrapper<Project> queryWrapper = new QueryWrapper<>();
        queryWrapper.like("name",selectName);
        List<Project> list = projectMapper.selectList(queryWrapper);
        return RespBean.success("查询成功",list);
    }
    @GetMapping("/count")
    public RespBean countFinish(){
        Map<String,Integer> map = new HashMap<>();
        map.put("finish",projectMapper.countFinish());
        map.put("unfinish",projectMapper.countUnFinish());
        return RespBean.success("查询成功",map);
    }
    @GetMapping("/select/project")
    public RespBean countProject(@RequestParam String date){
        Map<String,Integer> map = new HashMap<>();
        date = date.concat("%");
        map.put("res",projectMapper.countProjectByDate(date));
        return RespBean.success("查询成功",map);
    }
}
