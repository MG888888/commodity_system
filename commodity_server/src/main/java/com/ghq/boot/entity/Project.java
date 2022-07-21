package com.ghq.boot.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * <p>
 *
 * </p>
 *
 * @author 高煌庆
 * @since 2022-07-17
 */
public class Project implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    private String name;

    private LocalDateTime createtime;

    private Integer isfinish;

    private LocalDateTime updatetime;

    private String charge;

    private String detail;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    public LocalDateTime getCreatetime() {
        return createtime;
    }

    public void setCreatetime(LocalDateTime createtime) {
        this.createtime = createtime;
    }
    public Integer getIsfinish() {
        return isfinish;
    }

    public void setIsfinish(Integer isfinish) {
        this.isfinish = isfinish;
    }
    public LocalDateTime getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(LocalDateTime updatetime) {
        this.updatetime = updatetime;
    }
    public String getCharge() { return this.charge; }

    public void setCharge(String charge) { this.charge = charge; }
    public String getDetail() { return this.detail; }

    public void setDetail(String detail) { this.detail = detail; }

    @Override
    public String toString() {
        return "Project{" +
            "id=" + id +
            ", name=" + name +
            ", createtime=" + createtime +
            ", isfinish=" + isfinish +
            ", updatetime=" + updatetime +
            ", charge=" + charge +
            ", detail=" + detail +
        "}";
    }
}
