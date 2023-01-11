package kr.go.molab.chat;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MessageDaoImpl implements MessageDao {

	@Autowired
	SqlSession sqlSession;

	@Override
	public String countMessageView(String user_id) {
		int cnt = sqlSession.selectOne("message.countMessageView", user_id);
		return String.valueOf(cnt);
	}

	@Override
	public List<MessageVO> findList(String receiver_name) {
		return sqlSession.selectList("message.findList", receiver_name);
	}

	@Override
	public void insertMessage(MessageVO messageVO) {
		sqlSession.insert("message.insertMessage", messageVO);
	}
}
