package co.yedam.hellonote.chat;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ChatServicImpl implements ChatService{

	@Autowired
	ChatDAO dao; 
	
	@Override
	public List<ChatVO> getChatList(ChatVO vo) {
		// TODO Auto-generated method stub
		return dao.getChatList(vo);
	}

	@Override
	public int insertChat(ChatVO vo) {
		// TODO Auto-generated method stub
		return dao.insertChat(vo);
	}

}
