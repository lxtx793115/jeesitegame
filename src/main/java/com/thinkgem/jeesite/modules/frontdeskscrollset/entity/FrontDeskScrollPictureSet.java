/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.frontdeskscrollset.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 前台滚动图片设置Entity
 * @author sss
 * @version 2018-05-11
 */
public class FrontDeskScrollPictureSet extends DataEntity<FrontDeskScrollPictureSet> {
	
	private static final long serialVersionUID = 1L;
	private String pictureAddress;		// 图片地址
	private String picturenumber;//图片序号
	
	public String getPicturenumber() {
		return picturenumber;
	}

	public void setPicturenumber(String picturenumber) {
		this.picturenumber = picturenumber;
	}

	public FrontDeskScrollPictureSet() {
		super();
	}

	public FrontDeskScrollPictureSet(String id){
		super(id);
	}

	@Length(min=0, max=255, message="图片地址长度必须介于 0 和 255 之间")
	public String getPictureAddress() {
		return pictureAddress;
	}

	public void setPictureAddress(String pictureAddress) {
		this.pictureAddress = pictureAddress;
	}
	
}