package com.model2.mvc.web.product;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;

@RestController
@RequestMapping("/product/*")
public class ProductRestCotroller {
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	public ProductRestCotroller() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value="json/addProduct", method=RequestMethod.POST)
	public Product addProduct(@RequestBody Product product) throws Exception {
		
		product.setManuDate(product.getManuDate().replace("-",""));
		productService.insertProduct(product);
		
		return product;
	}
	
	@RequestMapping(value="json/getProduct/{prodNo}", method=RequestMethod.GET)
	public Product getProduct(@PathVariable int prodNo) throws Exception {
		
		System.out.println("/product/json/getProduct:GET");
		
		return productService.getProduct(prodNo);
	}
	
	@RequestMapping(value="json/updateProduct", method=RequestMethod.POST)
	public Product updateProduct(@RequestBody Product product) throws Exception {
		
		System.out.println(">>>>>>>>>>>>>>>>>"+product);
		product.setManuDate(product.getManuDate().replace("-",""));
		productService.updateProduct(product);
		
		return product;
	}
	
	@RequestMapping(value="json/listProduct", method=RequestMethod.POST)
	public Map listProduct(@RequestBody Search search) throws Exception {
		
		int pageSize = 10;
		int pageUnit = 5;
		
		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
		}
		Map<String, Object> map  = productService.getProductList(search);
		
		//Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(),pageUnit, pageSize);
		
		return map;
	}
}