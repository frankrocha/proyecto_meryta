package com.empresa.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.empresa.entity.Opcion;

import com.empresa.entity.Rol;
import com.empresa.entity.Usuario;



public interface UsuarioRepositorio extends JpaRepository<Usuario, Integer>{

	@Query("Select x from Usuario x where x.celular = :#{#usu.celular} and x.password = :#{#usu.password}")
	public abstract Usuario login(@Param(value = "usu") Usuario bean);
	
	@Query("Select p from Opcion p, RolHasOpcion pr, Rol r, UsuarioHasRol u where "
			+ " p.idOpcion = pr.opcion.idOpcion and "
			+ " pr.rol.idRol = r.idRol and "
			+ " r.idRol = u.rol.idRol and "
			+ " u.usuario.idUsuario = :var_idUsuario")
	public abstract List<Opcion> traerEnlacesDeUsuario(@Param("var_idUsuario") int idUsuario);

	@Query("Select r from Rol r, UsuarioHasRol u where "
			+ " r.idRol = u.rol.idRol and "
			+ " u.usuario.idUsuario = :var_idUsuario")
	public abstract List<Rol> traerRolesDeUsuario(@Param("var_idUsuario")int idUsuario);
	

	@Query("Select l from Usuario l, UsuarioHasRol x where l.idUsuario = x.usuario.idUsuario and  x.rol.idRol = :var_idRol")
	public abstract List<Usuario> traerUsuarioDeRoles(@Param("var_idRol")int idRol);
	

	@Query("select l from Usuario l where l.nombres like :param")
	public abstract List<Usuario> listaPorNombre(@Param("param")String filtro);
	
}
