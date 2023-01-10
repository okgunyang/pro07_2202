package kr.go.molab.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/user/")
public class AccountController {
	
	@Autowired
	AccountServiceImpl accountService;

	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String goLogin() {
		return "users/login";
	}
	
	@RequestMapping(value = "join", method = RequestMethod.GET)
	public String goJoin() {
		return "users/join";
	}
	
	@RequestMapping(value = "join", method = RequestMethod.POST)
	public String join(Account account) {
		account.setPassword(new BCryptPasswordEncoder().encode(account.getPassword()));
		accountService.join(account);
		return "users/login";
	}

}
