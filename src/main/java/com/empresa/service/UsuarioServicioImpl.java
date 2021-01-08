package com.empresa.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.empresa.entity.Opcion;
import com.empresa.entity.Rol;
import com.empresa.entity.Usuario;
import com.empresa.repository.UsuarioRepositorio;



@Service
public class UsuarioServicioImpl implements UsuarioServicio{

	@Autowired
	private UsuarioRepositorio repositorio;
	


	@Override
	public List<Opcion> traerEnlacesDeUsuario(int idUsuario) {
		return repositorio.traerEnlacesDeUsuario(idUsuario);
	}

	@Override
	public List<Rol> traerRolesDeUsuario(int idUsuario) {
		return repositorio.traerRolesDeUsuario(idUsuario);
	}

	@Override
	public List<Usuario> listaUsuarios() {
		return repositorio.findAll();
	}

	@Override
	public Usuario insertaUsuario(Usuario obj) {
		return repositorio.save(obj);
	}

	@Override
	public void eliminaUsuarioPorId(int id) {
		repositorio.deleteById(id);
	}

	@Override
	public Optional<Usuario> buscarUsuarioPorId(int id) {
		// TODO Auto-generated method stub
		return repositorio.findById(id);
	}

	@Override
	public List<Usuario> listaUsuarioxRol(int idrol) {
		return repositorio.traerUsuarioDeRoles(idrol);
	}

	@Override
	public List<Usuario> listaPorNombre(String filtro) {
	
		return repositorio.listaPorNombre(filtro);
	}

	@Override
	public Usuario login(Usuario bean) {

		return repositorio.login(bean);
	}
	

}
