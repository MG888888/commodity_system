package com.ghq.boot.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ghq.boot.entity.Cost;
import com.ghq.boot.entity.RespBean;
import com.ghq.boot.mapper.CostMapper;
import com.ghq.boot.service.ICostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import org.springframework.stereotype.Controller;

import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 高煌庆
 * @since 2022-07-18
 */
@Controller
@RestController
@RequestMapping("/cost")
public class CostController {
    @Autowired
    private ICostService iStuffInformationService;
    @Autowired
    private CostMapper stuffInformationMapper;
    @GetMapping("/list")
    public RespBean getAllList(@RequestParam Integer page, @RequestParam Integer limit){
        Page<Cost> ppage = new Page<>(page,limit);
        stuffInformationMapper.selectPage(ppage,null);
        return RespBean.success("返回成功",ppage);
    }
    @PostMapping("/save")
    public RespBean save(@RequestBody Cost stuffInformation) {
        if (iStuffInformationService.saveOrUpdate(stuffInformation)) {
            return RespBean.success("更新成功");
        } else {
            return RespBean.error("更新失败");
        }
    }
    @DeleteMapping("/remove/{id}")
    public RespBean delete(@PathVariable Integer id){
        if(iStuffInformationService.removeById(id)){
            return RespBean.success("删除成功");
        }
        else {
            return RespBean.error("删除失败");
        }
    }
    @GetMapping("/select")
    public RespBean selectByName(@RequestParam String selectName){
        QueryWrapper<Cost> queryWrapper = new QueryWrapper<>();
        queryWrapper.like("name",selectName);
        List<Cost> list = stuffInformationMapper.selectList(queryWrapper);
        return RespBean.success("查询成功",list);
    }
}
