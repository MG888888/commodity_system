package com.ghq.boot.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ghq.boot.entity.CustomerInfomation;
import com.ghq.boot.entity.RespBean;
import com.ghq.boot.mapper.CustomerInfomationMapper;
import com.ghq.boot.service.ICustomerInfomationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 高煌庆
 * @since 2022-07-17
 */
@RestController
@RequestMapping("/customer/infomation")
public class CustomerInfomationController {
    @Autowired
    private ICustomerInfomationService iCustomerInfomationService;
    @Autowired
    private CustomerInfomationMapper customerInfomationMapper;
    @GetMapping("/list")
    public RespBean getAllList(@RequestParam Integer page, @RequestParam Integer limit){
        Page<CustomerInfomation> ppage = new Page<>(page,limit);
        customerInfomationMapper.selectPage(ppage,null);
        return RespBean.success("返回成功",ppage);
    }
    @PostMapping("/save")
    public RespBean save(@RequestBody CustomerInfomation customerInfomation) {
        if (iCustomerInfomationService.saveOrUpdate(customerInfomation)) {
            return RespBean.success("更新成功");
        } else {
            return RespBean.error("更新失败");
        }
    }
    @DeleteMapping("/remove/{id}")
    public RespBean delete(@PathVariable Integer id){
        if(iCustomerInfomationService.removeById(id)){
            return RespBean.success("删除成功");
        }
        else {
            return RespBean.error("删除失败");
        }
    }
    @GetMapping("/select")
    public RespBean selectByName(@RequestParam String selectName){
        QueryWrapper<CustomerInfomation> queryWrapper = new QueryWrapper<>();
        queryWrapper.like("company",selectName);
        List<CustomerInfomation> list = customerInfomationMapper.selectList(queryWrapper);
        return RespBean.success("查询成功",list);
    }
}
