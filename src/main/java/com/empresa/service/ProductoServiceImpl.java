package com.empresa.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.empresa.entity.Producto;
import com.empresa.repository.ProductoRepository;

@Service
public class ProductoServiceImpl  implements ProductoService {

	
	@Autowired
	private ProductoRepository  productoRepository;

	@Override
	public Producto insertaActualizaProducto(Producto obj) {
	
		return productoRepository.save(obj);
	}

	@Override
	public void eliminarProducto(int id) {
	
		productoRepository.deleteById(id);
		
	}
	@Override
	public List<Producto> listarPorDescripcion(String filtro) {
	
		return productoRepository.listaPorDescripcion(filtro);
	}

	@Override
	public List<Producto> listarPorTipo(int filtro) {
		
		return productoRepository.listaPorTipo(filtro);
	}

	@Override
	public Optional<Producto> buscarPorId(int id) {

		return productoRepository.findById(id);
	}

	@Override
	public List<Producto> listaTodos() {
	
		return productoRepository.findAll();
	}

	
	
}
