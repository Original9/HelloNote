package co.yedam.hellonote.chat;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ChatDAO {

	@Autowired
	SqlSessionTemplate chat;
	
	//메세지 조회
	public List<ChatVO> getChatList(ChatVO vo){
		return chat.selectList("ChatDAO.getChatList",vo);
	}
	
	//메세지 저장
	public int insertChat(ChatVO vo) {	
		
		
		System.out.println(vo);
		return chat.insert("ChatDAO.insertChat", vo); // null point 
	}
	
	
}
