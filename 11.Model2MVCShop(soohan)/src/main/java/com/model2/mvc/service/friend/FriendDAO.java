package com.model2.mvc.service.friend;

import java.util.List;

import com.model2.mvc.service.domain.Friend;

public interface FriendDAO {
	
	public void reqFriend(Friend friend) throws Exception;
	
	public List<Friend> listRecvFriend(String recvFriendId) throws Exception;
	
	public Friend getRecvFriend(int friendNo) throws Exception;
	
	public Friend getFriend(int friendNo) throws Exception;
	
//	public void mangFriend() throws Exception;
	
	public int getTotalCount(String recvFriend) throws Exception;
}
