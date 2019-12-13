package co.yedam.hellonote.dday.vo;

public class DDayVO {
	int dDaySeq;
	String dDayname;
	String dDayend;
	String menuId;
	public int getdDaySeq() {
		return dDaySeq;
	}
	public void setdDaySeq(int dDaySeq) {
		this.dDaySeq = dDaySeq;
	}
	public String getdDayname() {
		return dDayname;
	}
	public void setdDayname(String dDayname) {
		this.dDayname = dDayname;
	}
	public String getdDayend() {
		return dDayend;
	}
	public void setdDayend(String dDayend) {
		this.dDayend = dDayend;
	}
	public String getMenuId() {
		return menuId;
	}
	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}
	@Override
	public String toString() {
		return "DDayVO [dDaySeq=" + dDaySeq + ", dDayname=" + dDayname + ", dDayend=" + dDayend + ", menuId=" + menuId
				+ "]";
	}
	
	
	

}
