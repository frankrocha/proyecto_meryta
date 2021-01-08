package com.empresa.service;

import java.util.List;
import java.util.Optional;

import com.empresa.entity.Producto;

public interface ProductoService {

	
	
	public Producto insertaActualizaProducto(Producto obj);
	public abstract void eliminarProducto(int id);
	public abstract List<Producto> listarPorDescripcion(String filtro);
	public abstract List<Producto> listarPorTipo(int filtro);
	public abstract Optional<Producto> buscarPorId(int id);
	public abstract List<Producto> listaTodos();
	
	
	
}
