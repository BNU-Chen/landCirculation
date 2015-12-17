package cn.ac.irsa.landcirculation;

import java.lang.reflect.Field;

public class ObjUpdate {
	static int update(Object objDes, Object objSrc) {

		if (objDes.getClass() != objSrc.getClass()) {
			return 1;
		}

		Field[] fields = objDes.getClass().getDeclaredFields();
		for (int i = 0; i < fields.length; i++) {
			fields[i].setAccessible(true);
			try {
				Object objtmp = fields[i].get(objSrc);
				if (objtmp != null) {

					fields[i].set(objDes, fields[i].get(objSrc));
					fields[i].setAccessible(false);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return 0;
	}
}