package co.yedam.hellonote.calendar.vo;



import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;

@Data
public class CalendarVO {
	@JsonProperty("_id")
	int calendarSeq;
	String title;
	String menuId;
	@JsonProperty("start")
	String startDate; // json format data 
	@JsonProperty("end")
	String endDate;
	String type;
	@JsonProperty("username")
	String userName;
	String backgroundColor;
	String textColor;
	String allDay;
	String description;

}
