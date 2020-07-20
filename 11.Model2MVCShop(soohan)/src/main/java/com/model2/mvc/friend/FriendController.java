package com.model2.mvc.friend;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.model2.mvc.service.friend.FriendService;
import com.model2.mvc.service.user.UserService;

@Controller
@RequestMapping("/friend/*")
public class FriendController {
	
	@Autowired
	@Qualifier("friendServiceImpl")
	private FriendService friendService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Value("#{commonProperties['pageUnit']}")
	int PageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;

}
