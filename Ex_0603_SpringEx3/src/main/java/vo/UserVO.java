package vo;

public class UserVO {
	private int userno, age;
	private String name;
	
	public UserVO(int userno, String name, int age) {
		this.userno = userno;
		this.name = name;
		this.age = age;
	}
	
	public int getUserno() {
		return userno;
	}
	public void setUserno(int userno) {
		this.userno = userno;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
}
