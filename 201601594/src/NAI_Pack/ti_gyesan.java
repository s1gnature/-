package NAI_Pack;

public class ti_gyesan {
	private int age;

	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public int getBirth_year() {
		return 2020-age+1;
	}
	public String getTi() {
		switch (((2020-age+1)-1990) % 12){
		case 0:
			return "����";
		case 1:
			return "���";
		case 2:
			return "�����̶�";
		case 3:
			return "�߶�";
		case 4:
			return "����";
		case 5:
			return "������";
		case 6:
			return "���";
		case 7:
			return "�Ҷ�";
		case 8:
			return "ȣ���̶�";
		case 9:
			return "�䳢��";
		case 10:
			return "���";
		case 11:
			return "���";
		}
		return null;
	}
	public String Test() {
		return "�Ÿ�";
	}
}
