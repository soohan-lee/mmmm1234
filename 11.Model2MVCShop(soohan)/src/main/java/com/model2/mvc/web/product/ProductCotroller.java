package com.model2.mvc.web.product;

import java.io.File;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;

@Controller
@RequestMapping("/product/*")
public class ProductCotroller {
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	public ProductCotroller() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")

	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	
	int pageSize;
	
	@RequestMapping(value="addProduct", method=RequestMethod.GET )
	public String addProductView() throws Exception {
		
		System.out.println("/addProductView.do");
		
		return "forward:/product/addProductView.jsp";
	}
	
	@RequestMapping(value="addProduct", method=RequestMethod.POST)
	public String addProduct(@ModelAttribute("product") Product product,@RequestParam("file") MultipartFile uploadFile) throws Exception {
		
		product.setManuDate(product.getManuDate().replace("-", ""));
		
		String originFileName = uploadFile.getOriginalFilename();
		
		product.setFileName(originFileName);
		
		File file = new File (uploadPath,originFileName);
		
		uploadFile.transferTo(file);
		
		productService.insertProduct(product);
		
		return "forward:/product/addProduct.jsp";
	}
	
	@RequestMapping( value="getProduct", method=RequestMethod.GET)
	public String getProduct(@RequestParam("prodNo") String prodNo, @RequestParam("menu") String menu, Model model) throws Exception {
	
		Product product = productService.getProduct(Integer.parseInt(prodNo));
		
		model.addAttribute("product",product);
		System.out.println(menu);
		if(menu.equals("manage")) {
			return "forward:/product/updateProductView.jsp";
		}
		else if(menu.equals("search")) {
			return "forward:/product/getProduct.jsp";
		}
		
		return menu;
	
	}
	
	@RequestMapping(value="updateProductView", method=RequestMethod.GET)
	public String updateProductView(@RequestParam("prodNo") int prodNo,  Model model) throws Exception {
		
		System.out.println("/updateProductView.do");
		
		Product product = productService.getProduct(prodNo);
		
		model.addAttribute("product", product);
		
		return "forward:/product/updateProductView.jsp";
	}
	
	@RequestMapping( value="updateProduct", method=RequestMethod.POST)
	public String updateProduct(@ModelAttribute("product") Product product,  Model model, HttpServletRequest request) throws Exception{
		
		System.out.println("/updateProduct.do");
		
		String rgp=request.getParameter("manuDate");
		String[] str = rgp.split("-");
		String dates = "";
		for(int i=0 ; i<str.length ; i++) {
			dates += str[i];
		}
		product.setManuDate(dates);
		
		productService.updateProduct(product);
		
		model.addAttribute("product", product);
		
		return "forward:/product/getProduct.jsp";
	}
	
	@RequestMapping(value="listProduct")
	public String listProduct(@ModelAttribute("search") Search search, Model model, HttpServletRequest request) throws Exception {
		
		System.out.println("2313231321/listProduct.do");
		
		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
		}
//		
//		if(search.getSearchCondition()==null) {
//			search.setSearchCondition("0");
//		}
//		
//		if(search.getSearchKeyword()== null) {
//			search.setSearchKeyword("");
//		}
//		
		search.setPageSize(pageSize);
		
		Map<String, Object> map  = productService.getProductList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(),pageUnit, pageSize);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		

		
		if(request.getParameter("menu").equals("manage")) {
			return "forward:/product/listProduct.jsp";
		}
		else {
			return "forward:/product/listProduct.jsp";
		}
		
		}
	
}