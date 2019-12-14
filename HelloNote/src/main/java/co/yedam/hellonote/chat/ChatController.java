package co.yedam.hellonote.chat;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ChatController {

		@Autowired ChatService chatService;
		
		@RequestMapping(value="/chatList")
		public List<ChatVO> getChatList(ChatVO vo){
			UserDetails userDetails =
					(UserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			vo.setFromId(userDetails.getUsername());
			
			return chatService.getChatList(vo);
		}
		
		@RequestMapping(value="/insertChat")
		public int insertChat(ChatVO vo) {
			UserDetails userDetails =
					(UserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			vo.setFromId(userDetails.getUsername());
			return chatService.insertChat(vo);
		}
		

	
}
