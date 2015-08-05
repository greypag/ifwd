package com.ifwd.fwdhk.model;


/**
 * This Enum should define all supported locale.
 * 
 */
public enum LocaleKeyEnum {

	EN_US("EN", "English"), ZH_HK("CN", "Chinese TC");

	private final String value;
	private final String displayName;

	private LocaleKeyEnum(String value, String displayName) {
		this.value = value;
		this.displayName = displayName;
	}

	public String getValue() {
		return value;
	}

	public String getDisplayName() {
		return displayName;
	}

	public String getName() {
		return name();
	}

	public static LocaleKeyEnum findByAbbr(String abbr) {
		LocaleKeyEnum keyEnum = null;
		for (LocaleKeyEnum v : values()) {
			if (abbr.equalsIgnoreCase(v.getName())) {
				return keyEnum = v;
			}
		}
		return keyEnum;
	}

}
