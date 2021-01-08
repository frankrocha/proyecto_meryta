package com.empresa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.empresa.entity.TipoProducto;
import com.empresa.repository.TipoProductoRepository;

@Service
public class TipoProductoServiceImpl implements TipoProductoService {

	@Autowired
	private TipoProductoRepository  tipoProductoRepository;
	
	@Override
	public List<TipoProducto> listaTipoProducto() {

		return tipoProductoRepository.findAll() ;
	}
	

	
}
