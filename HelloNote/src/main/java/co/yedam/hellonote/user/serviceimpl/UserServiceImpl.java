package co.yedam.hellonote.user.serviceimpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import co.yedam.hellonote.user.dao.UserDAO;
import co.yedam.hellonote.user.service.UserService;
import co.yedam.hellonote.user.vo.UserVO;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserDAO userDAO;

	@Autowired
	BCryptPasswordEncoder bcryptPasswordEncoder;

	@Override
	public UserVO getUser(UserVO vo) {
		return userDAO.getUser(vo);
	}

	@Override
	public List<UserVO> getUserList(UserVO vo) {
		return userDAO.getUserList(vo);
	}

	@Override
	public List<Map<String, Object>> getUserListMap(UserVO vo) {
		return userDAO.getUserListMap(vo);
	}

	@Override
	public int updateUser(UserVO dto) {
		return userDAO.updateUser(dto);
	}

	@Override
	public int updateUserChange(UserVO dto) {
		dto.setPw(bcryptPasswordEncoder.encode(dto.getPw()));
		return userDAO.updateUserChange(dto);
	}

	@Override
	public int deleteUser(String[] list, UserVO vo) {
		for (int i = 0; i < list.length; i++) {
			vo.setHellonoteId(list[i]);
			userDAO.deleteUser(vo);
		}
		return 0;
	}

	@Override
	public int getUserdelete(UserVO vo) {
		return userDAO.getUserdelete(vo);
	}

	@Override
	public int insertUserSignUp(UserVO vo) {
		vo.setPw(bcryptPasswordEncoder.encode(vo.getPw()));
		return userDAO.insertUserSignUp(vo);
	}

	// 프로시저는 return 값이 안넘어 오기 때문에 직접 return 1 을 직접넣어줌
	@Override
	public int insertNaverUserSignUp(UserVO vo) {
		UserVO getvo = userDAO.getUser(vo);
		if (getvo == null) {
			vo.setPw(bcryptPasswordEncoder.encode(vo.getPw()));
			userDAO.insertUserSignUp(vo);
			return 1;
		}
		return 0;
	}

	@Override
	public int deleteUserProc(UserVO vo) {
		return userDAO.deleteUserProc(vo);
	}

	@Override
	public int deleteUserListProc(String[] list, UserVO vo) {
		for (int i = 0; i < list.length; i++) {
			vo.setHellonoteId(list[i]);
			userDAO.deleteUserListProc(vo);
		}
		return 0;
	}

	@Override
	public UserVO idCheck(String hellonoteId) {
		return userDAO.idCheck(hellonoteId);
	}
}
