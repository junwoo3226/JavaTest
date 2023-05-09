package org.jun.mapper;

import java.util.ArrayList;
import org.jun.domain.Criteria;
import org.jun.domain.ProductDTO;

public interface ProductMapper {
	public void productWrite(ProductDTO pdto);
	
	public ArrayList<ProductDTO> list(Criteria cri);
	
	public ProductDTO detail(ProductDTO pdto);

}
