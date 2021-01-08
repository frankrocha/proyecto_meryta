package com.empresa.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.empresa.entity.Producto;

public interface ProductoRepository  extends JpaRepository<Producto, Integer>{
	
	
	@Query("select l from Producto l where l.descripcion like :param")
	public abstract List<Producto> listaPorDescripcion(@Param("param")String filtro);
	
	@Query("select x from Producto x where x.tipoProducto.idTipoProducto = :param")
	public abstract List<Producto> listaPorTipo(@Param("param")int filtro);
	
	
}
