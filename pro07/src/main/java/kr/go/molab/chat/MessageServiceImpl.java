package kr.go.molab.chat;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MessageServiceImpl implements MessageService {
	@Autowired
	MessageDao messageMapper;
	
	@Override
    public List<MessageVO> findList(String receiver_name) {
        return messageMapper.findList(receiver_name);
    }
	
	@Override
    public void insertMessage(MessageVO messageVO) {
        messageVO.setGubun(0);
        messageVO.setRead_yn(0);
        
        messageMapper.insertMessage(messageVO);
    }
}
