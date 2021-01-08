package com.empresa.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.empresa.entity.Opcion;



public interface OpcionRepository extends JpaRepository<Opcion, Integer>{
	@Query("select o from Opcion o, RolHasOpcion x where o.idOpcion = x.opcion.idOpcion and  x.rol.idRol = :param")
	public abstract List<Opcion> listaTodosPorRol(@Param("param") int idRol);

}
