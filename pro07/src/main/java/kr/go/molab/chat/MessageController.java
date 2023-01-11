package kr.go.molab.chat;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MessageController {

	@Autowired
	MessageService messageService;
	
	//별도의 상담 창 채팅
	@GetMapping("/echo/ws")
	public String echoOpen(Model model) {
		return "echo/echo-ws";
	}
	
	//기존 창에서 채팅
	@GetMapping("/chat/msg")
	public String chatOpen(Model model) {
		return "chat/msg";
	}
	
	@RequestMapping(value="/message/list.do",  method = {RequestMethod.POST})
    @ResponseBody
    public Map<String,Object> findMessageList(@ModelAttribute("messageVO") MessageVO messageVO,HttpServletRequest req, HttpServletResponse resp, ModelMap model){
        List<MessageVO> msg_result = messageService.findList(messageVO.getReceiver_name());
        Map<String,Object> result = new HashMap<>();
        result.put("result",msg_result);
        return result;
    }
 
	@RequestMapping(value="/message/message_proc.do")
    public void addMessageSend(@RequestParam String flag,@ModelAttribute("messageVO") MessageVO messageVO, HttpServletRequest req) {
        switch(flag) {
            case "insert" :
                messageService.insertMessage(messageVO);
                break;
        }
    }
}
