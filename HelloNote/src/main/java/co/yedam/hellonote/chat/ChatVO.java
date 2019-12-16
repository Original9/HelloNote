package co.yedam.hellonote.chat;

import lombok.Data;

@Data
public class ChatVO {
	int chatId;
	String fromId;
	String toId;
	String chatContent;
	String chatTime;
	
	
	String cmd;

}
