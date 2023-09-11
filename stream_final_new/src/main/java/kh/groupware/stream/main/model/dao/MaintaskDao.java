package kh.groupware.stream.main.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.groupware.stream.main.model.vo.MaintaskVo;

@Repository
public class MaintaskDao {
	
	@Autowired
	private SqlSession sqlSession;

	public List<MaintaskVo> projectNameList(){
		return sqlSession.selectList("mainTask.projectNameList");
	}
	
	public List<MaintaskVo> taskList(){
		return sqlSession.selectList("mainTask.taskList");
	}

}