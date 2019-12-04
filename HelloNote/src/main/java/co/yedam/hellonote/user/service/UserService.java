package co.yedam.hellonote.user.service;

import java.util.List;
import java.util.Map;

import co.yedam.hellonote.user.vo.UserVO;


public interface UserService {
	
	public UserVO getUser(UserVO vo);
	public List<UserVO> getUserList(UserVO vo);
	public List<Map> getUserListMap(UserVO user);
	//등록
	public int insertUser(UserVO vo);
	//수정
	public int updateUser(UserVO vo);
	//삭제
	public int deleteUser(UserVO vo);

}
