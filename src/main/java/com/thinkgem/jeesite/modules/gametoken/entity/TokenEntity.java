package com.thinkgem.jeesite.modules.gametoken.entity;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * token表结构字段
 * @author sudong
 * @since 2018-05-13
 */
public class TokenEntity extends DataEntity<TokenEntity> {

    private String id;
    private String accessToken; //token
    private String clientId; //用户名
    private Long   expiresIn; //有效期  秒


    @Override
    public String getId() {
        return id;
    }

    @Override
    public void setId(String id) {
        this.id = id;
    }


    public Long getExpiresIn() {
        return expiresIn;
    }

    public void setExpiresIn(Long expiresIn) {
        this.expiresIn = expiresIn;
    }

    public String getAccessToken() {
        return accessToken;
    }

    public void setAccessToken(String accessToken) {
        this.accessToken = accessToken;
    }

    public String getClientId() {
        return clientId;
    }

    public void setClientId(String clientId) {
        this.clientId = clientId;
    }
}

