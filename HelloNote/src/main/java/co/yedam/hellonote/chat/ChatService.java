package co.yedam.hellonote.chat;

import java.util.List;

public interface ChatService {
	
	//전체조회
	List<ChatVO> getChatList(ChatVO vo);
	
	//메세지등록
	int insertChat(ChatVO vo);
	

}
