package com.ifwd.fwdhk.message;




public interface MappingCodeAware {

	String getCode();

	static <T extends Enum<T> & MappingCodeAware> T fromCode(String code, Class<T> clazz) {
		for (T t : clazz.getEnumConstants()) {
			if (t.getCode().equals(code)) {
				return t;
			}
		}
		return null;
	}
	
}
