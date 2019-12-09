package co.yedam.hellonote.user.vo;

import lombok.Data;

@Data
public class UserVO {
	String hellonoteId;
	String pw;
	String gender;
	String hGrant;
	String age;
	String hProfile;

	public String gethGrant() {
		return hGrant;
	}
	public void sethGrant(String hGrant) {
		this.hGrant = hGrant;
	}
	public String gethProfile() {
		return hProfile;
	}
	public void sethProfile(String hProfile) {
		this.hProfile = hProfile;
	}
	
	
}
