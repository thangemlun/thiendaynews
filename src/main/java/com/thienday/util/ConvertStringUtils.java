package com.thienday.util;

import org.apache.commons.codec.binary.StringUtils;
import org.springframework.stereotype.Component;

@Component
public class ConvertStringUtils {
	public String encodeString(String a) {
		byte[] stringBytes = StringUtils.getBytesIso8859_1(a);
		String result = StringUtils.newStringUtf8(stringBytes);
		return result;
	}
}
