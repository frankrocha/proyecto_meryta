package com.empresa.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.empresa.entity.Opcion;
import com.empresa.repository.OpcionRepository;


@Service
public class OpcionServiceImpl implements OpcionService{
	@Autowired
	private OpcionRepository repository;
	
	@Override
	public List<Opcion> listaTodos() {
		return repository.findAll();
	}

	@Override
	public List<Opcion> listaTodosRol(int idRol) {
		return repository.listaTodosPorRol(idRol);
	}

}
