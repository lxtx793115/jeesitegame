package com.thinkgem.jeesite.modules.unit;

import java.util.UUID;

/**
 * 用于生成特定的UUID，
 * @author wangmiao
 * @date 2015-11-4 下午02:32:25
 */
public final class UUIDUtils {
	public static String randomUUID() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
}
