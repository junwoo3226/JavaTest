package org.jun.service;

import java.util.ArrayList;

import org.jun.domain.BoardDTO;
import org.jun.domain.Criteria;
import org.jun.domain.ProductDTO;
import org.jun.mapper.ProductMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	private ProductMapper pmapper;

	public void productWrite(ProductDTO pdto) {
		pmapper.productWrite(pdto);
	}
	
	@Transactional
	public ProductDTO detail(ProductDTO pdto) {
		return pmapper.detail(pdto);
	}
	
	//상품 리스트 가져오기
	public ArrayList<ProductDTO> list(Criteria cri) {
		return pmapper.list(cri);
	
	}

}
