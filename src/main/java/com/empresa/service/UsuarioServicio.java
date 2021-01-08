package com.empresa.service;

import java.util.List;
import java.util.Optional;


import com.empresa.entity.Opcion;
import com.empresa.entity.Rol;
import com.empresa.entity.Usuario;



public interface UsuarioServicio {

	

	public abstract Usuario login(Usuario bean);
	
	public abstract List<Opcion> traerEnlacesDeUsuario(int idUsuario);

	public abstract List<Rol> traerRolesDeUsuario(int idUsuario);
	
	public abstract List<Usuario> listaUsuarios();
	
	public Usuario insertaUsuario(Usuario obj);
	
	public abstract void eliminaUsuarioPorId(int id);
	
	public abstract Optional<Usuario> buscarUsuarioPorId(int id);
	
	public abstract List<Usuario> listaUsuarioxRol(int idrol);
	
	public abstract List<Usuario> listaPorNombre(String filtro);
}
