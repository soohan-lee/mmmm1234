package com.model2.mvc.service.friend;

import java.util.Map;

import com.model2.mvc.service.domain.Friend;

public interface FriendService {
	
	public void reqFriend(Friend friend) throws Exception;
	
	public Map<String,Object> listRecvFriend(String recvFriendId) throws Exception;
	
	public Friend getRecvFriend(int friendNo) throws Exception;
	
	public Friend getFriend(int friendNo) throws Exception;	
	
}
