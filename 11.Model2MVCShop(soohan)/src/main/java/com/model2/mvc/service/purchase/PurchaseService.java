package com.model2.mvc.service.purchase;

import java.util.HashMap;
import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.*;



public interface PurchaseService {

	public void addPurchase(Purchase purchase) throws Exception;
	
	public Purchase getPurchase(int tranNo) throws Exception;
	
	//public PurchaseVO getPurchase2(int ProdNo) throws Exception;
	
	public Map<String,Object> getPurchaseList(Search search,String buyerId) throws Exception;
	
	//public HashMap<String,Object> getSaleList(SearchVO searchVO) throws Exception;
	
	public void updatePurcahse(Purchase purchase) throws Exception;
	
	public void updateTranCode(Purchase purchase) throws Exception;
	
}