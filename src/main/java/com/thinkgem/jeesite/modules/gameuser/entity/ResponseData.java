
package com.thinkgem.jeesite.modules.gameuser.entity;

import java.util.List;
/**
 * 数据返回对象.
 */

public class ResponseData {

    // 返回状态编码
    private String code;
    // 返回信息
    private String message;
    //数据
    private List<?> rows;

    //总数
    private Long total;


    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public List<?> getRows() {
        return rows;
    }

    public void setRows(List<?> rows) {
        this.rows = rows;
    }

    public Long getTotal() {
        return total;
    }

    public void setTotal(Long total) {
        this.total = total;
    }
}

