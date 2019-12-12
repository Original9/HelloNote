package co.yedam.hellonote.user.service;

import java.util.List;
import java.util.Map;

import co.yedam.hellonote.user.vo.UserVO;

public interface UserService {

	// 단건 조회
	public UserVO getUser(UserVO vo);

	// 리스트 조회
	public List<UserVO> getUserList(UserVO vo);

	// 조회 맵
	public List<Map<String, Object>> getUserListMap(UserVO vo);

	// 회원가입 프로시저
	public int insertUserSignUp(UserVO vo);

	// 수정
	public int updateUser(UserVO vo);

	// 삭제
	public int deleteUser(String[] list, UserVO vo);

	// 단건삭제
	int getUserdelete(UserVO vo);
	
	// proc 단건 삭제
	
	int deleteUserProc(UserVO vo);
	
	// proc 리스트 삭제
	public int deleteUserListProc(String[] list, UserVO vo);

	// 아이디 중복 체크
	public UserVO idCheck(UserVO vo);
}
