package com.model2.mvc.service.friend.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.model2.mvc.service.friend.FriendDAO;
import com.model2.mvc.service.friend.FriendService;
import com.model2.mvc.service.domain.Friend;

@Service("friendServiceImpl")
public class FriendServiceImpl implements FriendService {
	
	@Autowired
	@Qualifier("friendDAOImpl")
	private FriendDAO friendDAO;
	public void setFriendDAO(FriendDAO friendDAO) {
		this.friendDAO=friendDAO;
	}
	public FriendServiceImpl() {
		// TODO Auto-generated constructor stub
		System.out.println("friendServiceImpl::"+getClass());
	}

	@Override
	public void reqFriend(Friend friend) throws Exception {
		// TODO Auto-generated method stub
		friendDAO.reqFriend(friend);
	}
	@Override
	public Map<String, Object> listRecvFriend(String recvFriendId) throws Exception {
		// TODO Auto-generated method stub
		List<Friend> list = friendDAO.listRecvFriend(recvFriendId);
		int totalCount=friendDAO.getTotalCount(recvFriendId);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		return map;
	}
	@Override
	public Friend getRecvFriend(int friendNo) throws Exception {
		// TODO Auto-generated method stub
		return friendDAO.getRecvFriend(friendNo);
	}
	@Override
	public Friend getFriend(int friendNo) throws Exception {
		// TODO Auto-generated method stub
		return friendDAO.getFriend(friendNo);
	}

}
