package com.model2.mvc.web.purchase;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.purchase.PurchaseService;
import com.model2.mvc.service.user.UserService;

@RestController
@RequestMapping("/purchase/*")
public class PurchaseRestController {
	
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	public PurchaseRestController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	//@RequestMapping("/addPurchaseView.do")
	@RequestMapping(value="/json/addPurchase", method=RequestMethod.POST)
	public Purchase addPurchase(@RequestBody Purchase purchase) throws Exception {
		
		System.out.println("/addPurchaseView.do");

		
		purchaseService.addPurchase(purchase);
		
		return purchase;
	}
	
	@RequestMapping(value="/json/listPurchase", method=RequestMethod.POST)
	public Map listPurchase(@RequestBody Search search) throws Exception{
		int pageSize = 10;
		int pageUnit = 5;
		
		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
		}
		
		String buyerId = "user19";
		Map<String, Object> map  = purchaseService.getPurchaseList(search,buyerId);
		
		//Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(),pageUnit, pageSize);
		
		return map;
	}
	@RequestMapping(value="/json/getPurchase/{tranNo}", method=RequestMethod.GET)
	
	public Purchase getPurchase(@PathVariable int tranNo) throws Exception{
		
		return purchaseService.getPurchase(tranNo);
	}
	
	@RequestMapping(value="/json/updatePurchase/{tranNo}",method=RequestMethod.POST)
	public void updatePurchase(@PathVariable int tranNo, @RequestBody Purchase purchase) throws Exception {
		System.out.println(purchase);
		purchaseService.updatePurcahse(purchase);
		
	}
	
	@RequestMapping(value="/json/updateTranCode/{tranNo}/{tranCode}", method=RequestMethod.GET)
	public void updateTranCode(@PathVariable int tranNo, @PathVariable String tranCode, @RequestBody Purchase purchase) throws Exception{
		
		purchaseService.updateTranCode(purchase);
	}
}
