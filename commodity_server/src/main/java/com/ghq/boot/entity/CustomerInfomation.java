package com.ghq.boot.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * <p>
 *
 * </p>
 *
 * @author 高煌庆
 * @since 2022-07-17
 */
@TableName("customer_infomation")
@ApiModel(value = "CustomerInfomation对象", description = "")
public class CustomerInfomation implements Serializable {

    private static final long serialVersionUID = 1L;

    private Integer id;

    private String company;

    private String linkman;

    private String telephone;

    private String qq;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }
    public String getLinkman() {
        return linkman;
    }

    public void setLinkman(String linkman) {
        this.linkman = linkman;
    }
    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }
    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq;
    }

    @Override
    public String toString() {
        return "CustomerInfomation{" +
            "id=" + id +
            "company=" + company +
            ", linkman=" + linkman +
            ", telephone=" + telephone +
            ", qq=" + qq +
        "}";
    }
}
