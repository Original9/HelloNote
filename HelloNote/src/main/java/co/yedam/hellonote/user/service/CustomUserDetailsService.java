package co.yedam.hellonote.user.service;

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
		System.out.println("##################################" + vo);
		System.out.println("##################################" + vo.getAuthorities());
		// 사용자가 존재하지 않는 경우
		if (vo == null) {
			throw new UsernameNotFoundException("no user");
		}
		return vo;
	}
}