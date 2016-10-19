package com.ifwd.fwdhk.model.tngsavie;

import java.util.HashMap;
import java.util.Map;

public class TngPolicyConstants {

	//TNG policy status
	public static final String TNG_POLICY_STATUS_READY_LINKUP="eligible";
	public static final String TNG_POLICY_STATUS_READY_WITHDRAW="linked";
	public static final String TNG_POLICY_STATUS_LOCKED="locked";
	
	//policy warning code
	public static final String TNG_POLICY_WARN_CODE_001="TPW001";
	public static final String TNG_POLICY_WARN_CODE_002="TPW002";
	public static final String TNG_POLICY_WARN_CODE_003="TPW003";
	public static final String TNG_POLICY_WARN_CODE_004="TPW004";

	//Backend warning code
	public static final String BE_TNG_POLICY_WARN_CODE_001="GPW001";
	public static final String BE_TNG_POLICY_WARN_CODE_002="GPW002";
	public static final String BE_TNG_POLICY_WARN_CODE_003="GPW003";
	public static final String BE_TNG_POLICY_WARN_CODE_004="GPW004";
	
	
	private static final Map<String, String> TNG_POLICY_WARN_CODE_MAP = new HashMap<String, String>();
	static {
		TNG_POLICY_WARN_CODE_MAP.put(BE_TNG_POLICY_WARN_CODE_001,TNG_POLICY_WARN_CODE_001);
		TNG_POLICY_WARN_CODE_MAP.put(BE_TNG_POLICY_WARN_CODE_002,TNG_POLICY_WARN_CODE_002);
		TNG_POLICY_WARN_CODE_MAP.put(BE_TNG_POLICY_WARN_CODE_003,TNG_POLICY_WARN_CODE_003);
		TNG_POLICY_WARN_CODE_MAP.put(BE_TNG_POLICY_WARN_CODE_004,TNG_POLICY_WARN_CODE_004);
    }
	
}
