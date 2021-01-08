package com.empresa.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.empresa.entity.UsuarioHasRol;
import com.empresa.repository.RolHasUsuarioRepository;



@Service
public class RolHasUsuarioServiceImpl  implements RolHasUsuarioService{

   @Autowired
	private RolHasUsuarioRepository repository;
	
	
	@Override
	public UsuarioHasRol inserta(UsuarioHasRol obj) {
		return repository.save(obj);
	}

	@Override
	public void eliminar(UsuarioHasRol obj) {
      repository.delete(obj);
	}
	

	
}
