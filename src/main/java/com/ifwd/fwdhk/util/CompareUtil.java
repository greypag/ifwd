package com.ifwd.fwdhk.util;

import java.lang.reflect.Method;
import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedList;
import java.util.List;

import org.apache.commons.lang.StringUtils;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.ifwd.fwdhk.model.savieOnline.ProductList;
import com.ifwd.fwdhk.model.savieOnline.Products;

public class CompareUtil {

	private static Gson g = new Gson();
	private static String TO_100 = "To age 100";
	private static String ONE_OFF ="One-Off";
	private static String SAVIE = "SAVIE";
	private static String SAVIE_GROUP = "Insurance product with savings element -with savings but without investment element";
	private static Comparator<String> sortProductList = new Comparator<String>() {
		@Override
		public int compare(String o1, String o2) {
			if (TO_100.equalsIgnoreCase(o1)) {
				return -1;
			} else if (ONE_OFF.equalsIgnoreCase(o1)){
				return 1;
			} else if (TO_100.equalsIgnoreCase(o2)) {
				return 1;
			} else if (ONE_OFF.equalsIgnoreCase(o2)){
				return -1;
			} else {
				return Integer.valueOf(o2) - Integer.valueOf(o1);
			}
		}
	};

	/**
	 * 对json数组中的Period进行升序排序
	 * @param jsonArr
	 * @return
	 */
	public static String comparePeriodAsc(String jsonArr) {
		LinkedList<Products> beans = g.fromJson(jsonArr,
				new TypeToken<LinkedList<Products>>() {
				}.getType());
		Collections.sort(beans, new Comparator<Products>() {
			@Override
			public int compare(Products o1, Products o2) {
				List<String> periods1 = o1.getContribution_period();
				periods1.sort(sortProductList);
				List<String> periods2 = o2.getContribution_period();
				periods2.sort(sortProductList);

				if(periods1.size() < 1 || periods2.size() < 1) {
					return 1;
				}else if (TO_100.equalsIgnoreCase(periods1.get(0))) {
					return 1;
				} else if (ONE_OFF.equalsIgnoreCase(periods1.get(0))){
					return -1;
				} else if (TO_100.equalsIgnoreCase(periods2.get(0))) {
					return -1;
				} else if (ONE_OFF.equalsIgnoreCase(periods2.get(0))){
					return 1;
				} else {
					return Integer.valueOf(periods1.get(0))
							- Integer.valueOf(periods2.get(0));
				}
			}
		});
		return g.toJson(beans);
	}

	/**
	 * 对json数组中的Period进行降序排序
	 * @param jsonArr
	 * @return
	 */
	public static String comparePeriodDesc(String jsonArr) {
		LinkedList<Products> beans = g.fromJson(jsonArr,
				new TypeToken<LinkedList<Products>>() {
				}.getType());
		Collections.sort(beans, new Comparator<Products>() {
			@Override
			public int compare(Products o1, Products o2) {
				List<String> periods1 = o1.getContribution_period();
				periods1.sort(sortProductList);
				List<String> periods2 = o2.getContribution_period();
				periods2.sort(sortProductList);
				
				if(periods1.size() < 1 || periods2.size() < 1) {
					return 1;
				}else if (TO_100.equalsIgnoreCase(periods1.get(0))) {
					return -1;
				} else if (ONE_OFF.equalsIgnoreCase(periods1.get(0))){
					return 1;
				} else if (TO_100.equalsIgnoreCase(periods2.get(0))) {
					return 1;
				} else if (ONE_OFF.equalsIgnoreCase(periods2.get(0))){
					return -1;
				} else {
					return Integer.valueOf(periods2.get(0))
							- Integer.valueOf(periods1.get(0));
				}
			}
		});
		return g.toJson(beans);
	}

	/**
	 * 对json数组中数字类型的attr进行升序排序
	 * @param jsonArr
	 * @param attr
	 * @return
	 */
	public static String compareIntAsc(String jsonArr, String attr) {
		LinkedList<Products> beans = g.fromJson(jsonArr,
				new TypeToken<LinkedList<Products>>() {
				}.getType());

		Collections.sort(beans, new Comparator<Products>() {
			@Override
			public int compare(Products o1, Products o2) {
				return (int)getAttr(o1, attr) - (int)getAttr(o2, attr);
			}
		});
		return g.toJson(beans);
		/*JSONArray jsonArray = JSONArray.fromObject(beans);
		return jsonArray.toString();*/
	}

	/**
	 * 对json数组中数字类型的attr进行降序排序
	 * @param jsonArr
	 * @param attr
	 * @return
	 */
	public static String compareIntDesc(String jsonArr, String attr) {
		LinkedList<Products> beans = g.fromJson(jsonArr,
				new TypeToken<LinkedList<Products>>() {
				}.getType());

		Collections.sort(beans, new Comparator<Products>() {
			@Override
			public int compare(Products o1, Products o2) {
				return (int)getAttr(o2, attr) - (int)getAttr(o1, attr);
			}
		});
		return g.toJson(beans);
	}
	
	/**
	 * 对json数组中字符类型的attr进行升序排序
	 * @param jsonArr
	 * @param attr
	 * @param maxOrMin 如果为max设为true
	 * @return
	 */
	public static String compareArrAsc(String jsonArr, String attr, boolean maxOrMin) {
		try {
			LinkedList<Products> beans = g.fromJson(jsonArr,
					new TypeToken<LinkedList<Products>>() {
			}.getType());
			
			Collections.sort(beans, new Comparator<Products>() {
				String str1;
				String str2;
				String[] strArr1;
				String[] strArr2;
				@Override
				public int compare(Products o1, Products o2) {
					str1 = (String)getAttr(o1, attr);
					str2 = (String)getAttr(o1, attr);
					if(StringUtils.isBlank(str1)) {
						return -1;
					}else if (StringUtils.isBlank(str2)) {
						return -1;
					}else {
						strArr1 = ((String)getAttr(o1, attr)).split(",");
						strArr2 = ((String)getAttr(o2, attr)).split(",");
						return maxOrMin ? strArr1[strArr1.length - 1].compareTo(strArr2[strArr2.length - 1])
								: strArr1[0].compareTo(strArr2[0]);
						
					}
				}
			});
			return g.toJson(beans);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}

	/**
	 * 对json数组中字符类型的attr进行降序排序
	 * @param jsonArr
	 * @param attr
	 * @param maxOrMin 如果为max设为true
	 * @return
	 */
	public static String compareArrDesc(String jsonArr, String attr, boolean maxOrMin) {
		try {
			LinkedList<Products> beans = g.fromJson(jsonArr,
					new TypeToken<LinkedList<Products>>() {
			}.getType());
			
			Collections.sort(beans, new Comparator<Products>() {
				String str1;
				String str2;
				String[] strArr1;
				String[] strArr2;
				@Override
				public int compare(Products o1, Products o2) {
					str1 = (String)getAttr(o1, attr);
					str2 = (String)getAttr(o1, attr);
					if(StringUtils.isBlank(str1)) {
						return -1;
					}else if (StringUtils.isBlank(str2)) {
						return -1;
					}else {
						strArr1 = ((String)getAttr(o1, attr)).split(",");
						strArr2 = ((String)getAttr(o2, attr)).split(",");
						return maxOrMin ? strArr2[strArr2.length - 1].compareTo(strArr1[strArr1.length - 1])
								: strArr2[0].compareTo(strArr1[0]);
					}
				}
			});
			return g.toJson(beans);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	
	/**
	 * 对json数组将SAVIE排到前面
	 * @param jsonArr
	 * @param attr
	 * @return
	 */
	public static String compareCodeDesc(String jsonArr) {
		LinkedList<Products> beans = g.fromJson(jsonArr,
				new TypeToken<LinkedList<Products>>() {
				}.getType());

		Collections.sort(beans, new Comparator<Products>() {
			@Override
			public int compare(Products o1, Products o2) {
				if(SAVIE.equals(o1.getProduct_code())) {
					return -1;
				}else if (SAVIE.equals(o2.getProduct_code())) {
					return 1;
				}else {
					return 0;
				}
			}
		});
		return g.toJson(beans);
	}
	
	/**
	 * 对json数组将包含SAVIE的Group排到前面
	 * @param jsonArr
	 * @param attr
	 * @return
	 */
	public static String compareGroup(String jsonArr) {
		LinkedList<ProductList> beans = g.fromJson(jsonArr,
				new TypeToken<LinkedList<ProductList>>() {
				}.getType());

		Collections.sort(beans, new Comparator<ProductList>() {
			@Override
			public int compare(ProductList o1, ProductList o2) {
				if(SAVIE_GROUP.equals(o1.getGroup())) {
					return -1;
				}else if (SAVIE_GROUP.equals(o2.getGroup())) {
					return 1;
				}else {
					return 0;
				}
			}
		});
		return g.toJson(beans);
	}

	private static Object getAttr(Object obj, String Attr) {
		Method method;
		try {
			method = obj.getClass().getMethod(Attr);
			return method.invoke(obj);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
}
