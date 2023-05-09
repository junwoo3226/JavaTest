package org.jun.service;


import java.util.ArrayList;
import org.jun.domain.Criteria;
import org.jun.domain.ProductDTO;

public interface ProductService {
	
	public void productWrite(ProductDTO pdto);
	
	public ProductDTO detail(ProductDTO pdto);
	
	public ArrayList<ProductDTO> list(Criteria cri);

}
