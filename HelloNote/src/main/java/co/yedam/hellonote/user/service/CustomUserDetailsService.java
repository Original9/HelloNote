package co.yedam.hellonote.user.service;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import co.yedam.hellonote.user.dao.UserDAO;
import co.yedam.hellonote.user.vo.UserVO;

//인증, 인가 확인 서비스

public class CustomUserDetailsService implements UserDetailsService {
	@Autowired
	UserDAO dao;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		UserVO vo = new UserVO();
		vo.setHellonoteId(username);
		vo = dao.getUser(vo);

		// 사용자가 존재하지 않는 경우
		if (vo == null) {
			throw new UsernameNotFoundException("no user");
		}

		
		//이미지 추가부분.
		
		String[] exts = {"jpg","jpeg","gif","bmp","png"};
		String filename = vo.getHellonoteId()+"_profileimg.";
//		String path = request.getSession().getServletContext().getRealPath("resources/assets/img/user");  
		String path =  "D:/dev/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp2/wtpwebapps/HelloNote_HelloNote/resources/assets/img/user";
		System.out.println(path);
//		String path = request.getservletContext().getRe + "/resources/assets/img/user/";
		for(String ext : exts) {
			File file = new File(path, filename+ext);
			if(file.exists()){	
				vo.setProfileImg(filename+ext);
				break;
			}
		}
		if(vo.getProfileImg() == null) {
			vo.setProfileImg("defaultImage.jpeg");
		}
		
		//이미지 추가부분 끝.
		return vo;
	}
}