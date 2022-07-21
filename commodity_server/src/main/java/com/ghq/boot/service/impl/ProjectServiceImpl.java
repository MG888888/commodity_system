package com.ghq.boot.service.impl;

import com.ghq.boot.entity.Project;
import com.ghq.boot.mapper.ProjectMapper;
import com.ghq.boot.service.IProjectService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author 高煌庆
 * @since 2022-07-17
 */
@Service
public class ProjectServiceImpl extends ServiceImpl<ProjectMapper, Project> implements IProjectService {

}
