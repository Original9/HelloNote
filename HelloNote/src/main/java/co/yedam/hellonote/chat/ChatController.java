package co.yedam.hellonote.chat;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ChatController {

		@Autowired ChatService chatService;
		
		@RequestMapping(value="/chatList")
		public List<ChatVO> getChatList(ChatVO vo){
			return chatService.getChatList(vo);
		}
		
		@RequestMapping(value="/insertChat")
		public int insertChat(ChatVO vo) {
			
			return chatService.insertChat(vo);
		}
		

	
}
