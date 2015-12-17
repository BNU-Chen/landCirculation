package cn.ac.irsa.landcirculation;

public class MyMoney {

	// /**
	// * ���������ת���ɴ�д�ַ���
	// * @param d
	// * @return
	// */
	public static String valuesToString(double d) {
		System.out.println(d);
		String returnString = "";
		// �������ִ�д����
		String[] num = { "��", "Ҽ", "��", "��", "��", "��", "½", "��", "��", "��" };
		// ʮ���Ƶ�λ
		String[] unit = { "", "ʰ", "��", "Ǫ", "��", "ʰ", "��", "Ǫ", "��", "ʰ", "��", "Ǫ" };
		// ���int,double,long�������͵Ĵ�ֵ
		String[] moneys = String.valueOf(d).split("\\.");
		// System.out.println(moneys[0]);
		// ����������ת�����ֽ�
		char[] moneys1 = moneys[0].toCharArray();
		// newһ������������������ÿ�����ֶ�Ӧ�Ĵ�д
		String[] str = new String[moneys1.length];
		// �����ֽ������ҵ�ÿ�����ֵĴ�д������
		for (int i = 0; i < moneys1.length; i++) {
			// �������ִ�д
			str[i] = num[Integer.parseInt(String.valueOf(moneys1[i]))];
			if (!str[i].equals("��")) {
				if (i != 0 && !str[i - 1].equals("��")) {
					// ǰһλ���ַ����ַǵ�һλ���֣����ڶ�Ӧ�Ĵ�д����͵�λ����ֱ��ȥֵ���
					returnString = returnString + str[i] + unit[moneys1.length - i - 1];
				} else if (i != 0 && str[i - 1].equals("��") && (moneys1.length - i != 4 && moneys1.length - i != 8)) {
					// �ǵ�һλ���֣�����ǰһλΪ�㣬�������㲻����ǧ*�ֱ��ϵ�����Ҫ��ǰ���� "�㡰
					returnString = returnString + "��" + str[i] + unit[moneys1.length - i - 1];
				} else if (i != 0 && str[i - 1].equals("��") && (moneys1.length - i == 4 || moneys1.length - i == 8)) {
					// �ǵ�һλ���֣�����ǰһλΪ�㣬������������ǧ*�ֱ��ϵ����ڶ�Ӧ�Ĵ�д����͵�λ����ֱ��ȥֵ���
					if (moneys1.length - i == 4 && returnString.endsWith("��")) {
						// ��λ����λ��ȫλ���ʱ��ǧλǰ����"��"
						returnString = returnString + "��" + str[i] + unit[moneys1.length - i - 1];
					} else {
						returnString = returnString + str[i] + unit[moneys1.length - i - 1];
					}
				} else if (i == 0) {
					// ��һλ���ֲ������Ϊ0��ֱ���ڶ�Ӧ�Ĵ�д����͵�λ����ֱ��ȥֵ���
					returnString = returnString + str[i] + unit[moneys1.length - i - 1];
				}
			}
			// ����λ������λ�ϼ�����Ӧ������ڵ�λ
			if (moneys1.length > 4) {
				if (moneys1.length - i == 5) {
					// ��λ�ӵ�λ�����������֮��û����������Ҫ��
					if (!returnString.endsWith("��")) {
						if (!returnString.endsWith("��")) {
							// ��λ�������ֲ�Ϊ��Ҳ����Ҫ��
							returnString = returnString + "��";
						}
					}
				} else if (moneys1.length - i == 9) {
					// ��λ�ӵ�λ�������λ�����ֲ�Ϊ������Ҫ��
					if (!returnString.endsWith("��")) {
						returnString = returnString + "��";
					}
				}
			}
		}
		// С�������
		Long dou = 0l;
		if (moneys.length > 1 && moneys[1] != null && !"".equals(moneys[1])) {
			dou = Long.valueOf(moneys[1]);
		}
		if (dou == 0) {
			// С�����û��������Ϊ��
			returnString = returnString + "Ԫ��";
		} else {
			// С�����������λ��ֵ
			returnString = returnString + "Ԫ";
			Long j = dou / 10;
			Long f = dou % 10;
			returnString = returnString + num[j.intValue()] + "��";
			returnString = returnString + num[f.intValue()] + "��";
		}
		return returnString; // To change body of implemented methods use File |
								// Settings | File Templates.
	}

	public static String valuesToString(int d) {
		double d2 = d + 0.0;
		return valuesToString(d2);
	}

	public static String valuesToString(long d) {
		double d2 = d + 0.0;
		return valuesToString(d2);
	}
}
