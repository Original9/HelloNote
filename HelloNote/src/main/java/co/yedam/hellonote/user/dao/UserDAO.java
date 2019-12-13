package co.yedam.hellonote.user.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yedam.hellonote.user.vo.UserVO;

@Repository
public class UserDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	public List<UserVO> getUserList(UserVO user) {
		return mybatis.selectList("UserDAO.getUserList", user);
	}

	public UserVO getUser(UserVO user) {
		return mybatis.selectOne("UserDAO.getUser", user);
	}

	public List<Map<String, Object>> getUserListMap(UserVO user) {
		return mybatis.selectList("UserDAO.getUserListMap", user);
	}

	// 회원가입 프로시저
	public int insertUserSignUp(UserVO vo) {
		return mybatis.insert("UserDAO.insertUserSignUp", vo);
	}

	// 수정
	public int updateUser(UserVO dto) {
		return mybatis.update("UserDAO.updateUser", dto);
	}

	// 삭제
	public int deleteUser(UserVO vo) {
		return mybatis.delete("UserDAO.deleteUser", vo);
	}

	// 단건 삭제
	public int getUserdelete(UserVO vo) {
		return mybatis.delete("UserDAO.getUserdelete", vo);
	}

	// 유저 삭제 proc
	public int deleteUserProc(UserVO vo) {
		return mybatis.delete("UserDAO.deleteUserProc", vo);
	}

	// 유저 리스트 삭제 proc
	public int deleteUserListProc(UserVO vo) {
		return mybatis.delete("UserDAO.deleteUserListProc", vo);
	}

	// 아이디 중복체크
	public UserVO idCheck(String hellonoteId) {
		return mybatis.selectOne("UserDAO.idCheck", hellonoteId);
	}
}
