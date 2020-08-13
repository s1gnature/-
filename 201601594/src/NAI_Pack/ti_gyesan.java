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
			return "¸»¶ì";
		case 1:
			return "¾ç¶ì";
		case 2:
			return "¿ø¼şÀÌ¶ì";
		case 3:
			return "´ß¶ì";
		case 4:
			return "°³¶ì";
		case 5:
			return "µÅÁö¶ì";
		case 6:
			return "Áã¶ì";
		case 7:
			return "¼Ò¶ì";
		case 8:
			return "È£¶ûÀÌ¶ì";
		case 9:
			return "Åä³¢¶ì";
		case 10:
			return "¿ë¶ì";
		case 11:
			return "¹ì¶ì";
		}
		return null;
	}
	public String Test() {
		return "½Å¸í¼·";
	}
}
